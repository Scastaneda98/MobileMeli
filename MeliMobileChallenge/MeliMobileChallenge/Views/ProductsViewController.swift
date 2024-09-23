//
//  ProductsViewController.swift
//  MeliMobileChallenge
//
//  Created by Santiago Castañeda on 20/09/24.
//
import UIKit
import Combine
import Foundation

class ProductsViewController: BaseViewController {
    var viewModel: ProductsViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width - 30)/2, height: Constants.Height.xl)
        layout.minimumInteritemSpacing = Constants.Spacing.Positive.s
        layout.minimumLineSpacing = Constants.Spacing.Positive.s
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let loadingSpinner = LoadingSpinnerView()
    private let errorView = ErrorView()
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.title = "Productos"
        setupUI()
        bindViewModel()
        
        viewModel.searchProducts()
    }
    
    func setupUI() {
        view.addSubview(collectionView)
        view.addSubview(loadingSpinner)
        view.addSubview(errorView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        errorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Spacing.Positive.s),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.s),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.s),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingSpinner.widthAnchor.constraint(equalToConstant: Constants.ImageSize.medium),
            loadingSpinner.heightAnchor.constraint(equalToConstant: Constants.ImageSize.medium)
        ])
        
        NSLayoutConstraint.activate([
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Spacing.Positive.m),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.Spacing.Negative.m),
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func bindViewModel() {
        
        viewModel.$isLoading
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.loadingSpinner.startLoading()
                } else {
                    self?.loadingSpinner.stopLoading()
                }
                
            }
            .store(in: &cancellables)
        
        viewModel.$products
            .sink { [weak self] products in
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
            .store(in: &cancellables)
        
        viewModel.$isError
            .sink { [weak self] isError in
                if isError {
                    self?.errorView.showError(image: "wifi.slash", errorMessage: "Ocurrió un error de conexión. Por favor, inténtelo de nuevo más tarde.", colorImage: .red)
                }
            }
            .store(in: &cancellables)
        
        viewModel.$isProductsEmpty
            .sink { [weak self] isEmpty in
                if isEmpty {
                    self?.errorView.showError(image: "magnifyingglass.circle.fill", errorMessage: "No encontramos pulicaciones", colorImage: .lightGray)
                }
            }
            .store(in: &cancellables)
    }
    
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductsCollectionViewCell
        let item = viewModel.item(at: indexPath.row)
        cell.configure(with: item)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.products[indexPath.item]
        LogsManager.shared.logInfo("Click in product: \(item)", className: String(describing: type(of: self)))
        coordinator?.showProductDetail(item: item)
    }
}
