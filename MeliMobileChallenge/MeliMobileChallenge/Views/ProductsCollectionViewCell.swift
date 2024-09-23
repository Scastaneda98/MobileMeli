//
//  ProductsCollectionViewCell.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 20/09/24.
//
import UIKit
import SDWebImage

class ProductsCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Constants.FontSize.l)
        label.numberOfLines = 3
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCardStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(priceLabel)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.Spacing.Positive.s),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spacing.Positive.s),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Spacing.Negative.s)
        ])
        
        NSLayoutConstraint.activate([
            originalPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.Spacing.Positive.xs),
            originalPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spacing.Positive.s),
            originalPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Spacing.Negative.s)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor, constant: Constants.Spacing.Positive.xs),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spacing.Positive.s),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Spacing.Negative.s),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.Spacing.Negative.s)
        ])
    }
    
    func setupCardStyle() {
        contentView.layer.cornerRadius = Constants.ViewStyle.cornerRaidus
        contentView.layer.borderWidth = Constants.ViewStyle.borderWidth
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.masksToBounds = true
    }
    
    func configure(with item: Item) {
        titleLabel.text = item.title
        priceLabel.text = item.price.formatPrice(currency: CurrencyID.fromCountryCode(item.currencyID))
        if let originalPrice = item.originalPrice {
            let originalPriceText = NSMutableAttributedString(string: originalPrice.formatPrice(currency: CurrencyID.fromCountryCode(item.currencyID)))
            originalPriceText.addAttribute(.strikethroughStyle,
                                           value: NSUnderlineStyle.single.rawValue,
                                           range: NSMakeRange(0, originalPriceText.length))
            originalPriceLabel.attributedText = originalPriceText
        }
        
        if let imageUrl = URL(string: item.thumbnail) {
            imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"), options: .highPriority,completed: nil)
        }
    }
}
