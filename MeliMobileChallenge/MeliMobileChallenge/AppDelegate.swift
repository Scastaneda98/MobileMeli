//
//  AppDelegate.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 17/09/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    private let locationManager = LocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let apparence = UINavigationBarAppearance()
        apparence.backgroundColor = UIColor(named: "headerColor")
        apparence.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = apparence
        UINavigationBar.appearance().scrollEdgeAppearance = apparence
        getLocation()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    func getLocation() {
        locationManager.onLocationDetected = { [weak self] location in
            guard self != nil else { return }
            UserDefaults.standard.set(location.rawValue, forKey: "siteLocation")
        }
    }
}

