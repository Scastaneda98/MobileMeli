//
//  BaseViewController.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 18/09/24.
//
import UIKit
class BaseViewController: UIViewController {
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
}
