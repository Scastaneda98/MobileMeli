//
//  ErrorView.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 23/09/24.
//

import UIKit

class ErrorView: UIView {
    
    private let errorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: Constants.FontSize.xl)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setpupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setpupView() {
        addSubview(errorImageView)
        addSubview(errorMessageLabel)
        
        configureConstrints()
    }
    
    private func configureConstrints() {
        NSLayoutConstraint.activate([
            errorImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            errorImageView.heightAnchor.constraint(equalToConstant: Constants.ImageSize.medium),
            errorImageView.widthAnchor.constraint(equalToConstant: Constants.ImageSize.medium)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: Constants.Spacing.Positive.s),
            errorMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func showError(image: String, errorMessage: String, colorImage: UIColor) {
        errorImageView.image = UIImage(systemName: image)
        errorImageView.tintColor = colorImage
        errorMessageLabel.text = errorMessage
    }
}

