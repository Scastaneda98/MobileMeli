//
//  ProductDetailViewController.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 21/09/24.
//

import UIKit

class ProductDetailViewController: BaseViewController {
    var viewModel: ProductDetailViewModel!
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.FontSize.l)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.FontSize.m)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.FontSize.m)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var discountPercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.FontSize.m)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stockAvailableLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.FontSize.l)
        label.text = "Stock disponible"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.FontSize.m, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    init(viewModel: ProductDetailViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalle"
        setupUI()
        configureData()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(originalPriceLabel)
        view.addSubview(priceLabel)
        view.addSubview(discountPercentage)
        view.addSubview(stockAvailableLabel)
        view.addSubview(quantityLabel)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.m),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Spacing.Positive.m)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.m),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.Spacing.Positive.m),
            imageView.heightAnchor.constraint(equalToConstant: Constants.Height.xl)
        ])
        
        NSLayoutConstraint.activate([
            originalPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            originalPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.m),
            originalPriceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.Spacing.Positive.m),
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            priceLabel.trailingAnchor.constraint(equalTo: discountPercentage.leadingAnchor, constant: Constants.Spacing.Negative.m),
            priceLabel.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor, constant: Constants.Spacing.Positive.xs),
        ])
        
        NSLayoutConstraint.activate([
            discountPercentage.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: Constants.Spacing.Positive.xs),
            discountPercentage.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor, constant: Constants.Spacing.Positive.xs),
        ])
        
        NSLayoutConstraint.activate([
            stockAvailableLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            stockAvailableLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.m),
            stockAvailableLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Constants.Spacing.Positive.xs),
        ])
        
        NSLayoutConstraint.activate([
            quantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            quantityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.m),
            quantityLabel.topAnchor.constraint(equalTo: stockAvailableLabel.bottomAnchor, constant: Constants.Spacing.Positive.xs),
        ])
    }
    
    private func configureData() {
        titleLabel.text = viewModel.item.title
        priceLabel.text = viewModel.item.price.formatPrice(currency: CurrencyID.fromCountryCode(viewModel.item.currencyID))
        if let originalPrice = viewModel.item.originalPrice {
            let originalPriceText = NSMutableAttributedString(string: originalPrice.formatPrice(currency: CurrencyID.fromCountryCode(viewModel.item.currencyID)))
            originalPriceText.addAttribute(.strikethroughStyle,
                                           value: NSUnderlineStyle.single.rawValue,
                                           range: NSMakeRange(0, originalPriceText.length))
            originalPriceLabel.attributedText = originalPriceText
            discountPercentage.text = "\(viewModel.calculateDiscountPercentage())% OFF"
        }
        
        if let imageUrl = URL(string: viewModel.item.thumbnail) {
            imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"), options: .highPriority,completed: nil)
        }
        
        if(viewModel.item.availableQuantity == 0) {
            stockAvailableLabel.text = "Sin Stock"
            quantityLabel.isHidden = true
        }
        quantityLabel.text = "Cantidad: \(viewModel.item.availableQuantity)"
    }
    
}
