//
//  LocationManager.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 21/09/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    var onLocationDetected: ((SiteID) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self, error == nil, let placemark = placemarks?.first else { return }
            
            if let countryCode = placemark.isoCountryCode {
                if let locationEnum = SiteID.fromCountryCode(countryCode) {
                    LogsManager.shared.logInfo("Location successfully obtained \(locationEnum.rawValue) ", className: String(describing: type(of: self)))
                    self.onLocationDetected?(locationEnum)
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        LogsManager.shared.logError("Error getting location: \(error.localizedDescription)", className: String(describing: type(of: self)))
    }
}
