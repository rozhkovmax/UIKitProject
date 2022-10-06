//
//  ProductViewController.swift
//  UIKitProject
//
//  Created by Maxim on 06.10.2022.
//

import UIKit
/// Контроллер с продуктами
final class ProductViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let defaultImage = UIImage(systemName: "magnifyingglass")
    }
    
    // MARK: - Visual Components
    private lazy var productLable: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 115, y: 100, width: 200, height: 100)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 115, y: 300, width: 200, height: 200)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - Public Properties
    var productName = ""
    var productImage = Constants.defaultImage
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    // MARK: - Private Methods
    private func allMethod() {
        productLable.text = productName
        productImageView.image = productImage 
        view.addSubview(productLable)
        view.addSubview(productImageView)
    }
}
