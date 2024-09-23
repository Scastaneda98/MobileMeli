//
//  Spinner.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 21/09/24.
//

import UIKit

class LoadingSpinnerView: UIView {
    
    private let spinnerIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .systemBlue
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setpupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setpupView() {
        addSubview(spinnerIndicator)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            spinnerIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinnerIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func startLoading() {
        spinnerIndicator.startAnimating()
        isHidden = false
    }
    
    func stopLoading() {
        spinnerIndicator.stopAnimating()
        isHidden = true
    }
}
