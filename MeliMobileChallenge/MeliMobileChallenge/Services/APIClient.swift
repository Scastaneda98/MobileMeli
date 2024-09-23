//
//  APIClient.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 20/09/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

public enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case serverError(Int)
    case decodingError(Error)
    case unknownError
}

class APIClient {
    static let shared = APIClient()

    private let baseUrl = "https://api.mercadolibre.com/sites/"
    var site: String = UserDefaults.standard.string(forKey: "siteLocation") ?? SiteID.argentina.rawValue
    
    func fetchData<T: Decodable>(endpoint: String,
                                 method: HTTPMethod,
                                 parameters: [String: Any]? = nil,
                                 completion: @escaping (Result<T, APIError>) -> Void) {
        
        LogsManager.shared.logInfo("Starting the request", className: String(describing: type(of: self)))
        guard var components = URLComponents(string: "\(baseUrl)\(site)/\(endpoint)") else {
            LogsManager.shared.logError("Invalid url components", className: String(describing: type(of: self)))

            completion(.failure(.invalidURL))
            return
        }
        
        if method == .get, let parameters = parameters {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
        }
        
        guard let url = components.url else {
            LogsManager.shared.logError("Invalid url", className: String(describing: type(of: self)))
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                LogsManager.shared.logError("Network error: \(error.localizedDescription)", className: String(describing: type(of: self)))
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                LogsManager.shared.logError("unknown error in response", className: String(describing: type(of: self)))
                completion(.failure(.unknownError))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                LogsManager.shared.logError("Server error with error code: \(httpResponse.statusCode)", className: String(describing: type(of: self)))
                completion(.failure(.serverError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                LogsManager.shared.logError("Error: No data received.", className: String(describing: type(of: self)))
                completion(.failure(.unknownError))
                return
            }
            
            do {
                let decodeResponse = try JSONDecoder().decode(T.self, from: data)
                LogsManager.shared.logInfo("Data fetched successfully from: \(url)", className: String(describing: type(of: self)))
                completion(.success(decodeResponse))
            } catch {
                LogsManager.shared.logError("Error decoding data: \(error.localizedDescription)", className: String(describing: type(of: self)))
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
