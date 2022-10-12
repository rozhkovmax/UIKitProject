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
        static let firstBarButtonItemImage = UIImage(systemName: "heart")
        static let secondBarButtonItemImage = UIImage(systemName: "square.and.arrow.up")
        static let compatibleImage = UIImage(systemName: "checkmark.circle.fill")
        static let compatibleText = "Совместимо с"
        static let compatibleNameText = "MacBook Pro — Евгений"
        static let basketText = "Добавить в корзину"
        static let basketTextLable = "Количество товаров:"
        static let orderImage = UIImage(systemName: "cube.box")
        static let orderLineOneText = "Заказ сегодня в течении дня, доставка"
        static let orderLineTwoText = "Чт 25 Фев - Бесплатно"
        static let orderLineThreeText = "Варинт доставки для местоположения: 115533"
        static let placeholderTextField = "0"
        static let detailText = "Подробно"
    }
    
    // MARK: - Visual Components
    private lazy var productNameOneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 20)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var productNameTwoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 480, width: view.bounds.width, height: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 120, width: view.bounds.width, height: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var firstBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: Constants.firstBarButtonItemImage,
                                            style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    
    private lazy var secondBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: Constants.secondBarButtonItemImage,
                                            style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    
    private lazy var firstColorButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 170, y: 520, width: 36, height: 36)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var secondColorButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 215, y: 520, width: 36, height: 36)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.link.cgColor
        return button
    }()
    
    private lazy var compatibleImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 70, y: 585, width: 20, height: 20)
        image.image = Constants.compatibleImage
        image.tintColor = .green
        return image
    }()
    
    private lazy var compatibleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 580, width: 100, height: 30)
        label.text = Constants.compatibleText
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var compatibleNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 195, y: 580, width: 180, height: 30)
        label.text = Constants.compatibleNameText
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .link
        return label
    }()
    
    private lazy var basketLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 620, width: 170, height: 30)
        label.text = Constants.basketTextLable
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var basketTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 220, y: 620, width: 40, height: 30)
        textField.backgroundColor = .systemGray2
        textField.placeholder = Constants.placeholderTextField
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 17)
        textField.keyboardType = .numbersAndPunctuation
        return textField
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 280, y: 620, width: 100, height: 30)
        button.setTitle(Constants.detailText, for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 17)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(detailButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var basketButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 35, y: 665, width: 350, height: 45)
        button.setTitle(Constants.basketText, for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var orderImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 35, y: 720, width: 20, height: 20)
        image.image = Constants.orderImage
        image.tintColor = .white
        return image
    }()
    
    private lazy var orderOneNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 65, y: 720, width: 350, height: 20)
        label.text = Constants.orderLineOneText
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var orderTwoNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 65, y: 740, width: 350, height: 20)
        label.text = Constants.orderLineTwoText
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var orderThreeNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 65, y: 760, width: 350, height: 20)
        label.text = Constants.orderLineThreeText
        label.font = .systemFont(ofSize: 13)
        label.textColor = .link
        return label
    }()
    
    private lazy var caseViewInScrollView = createProductView(caseNameImage: product.1)
    
    // MARK: - Public Properties
    var product: (String, [String], String, String) = ("", [""], "", "")

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    // MARK: - Private Methods
    private func allMethod() {
        productNameOneLabel.text = product.0
        productNameTwoLabel.text = product.0
        productPriceLabel.text = product.2
        createBarButtonItem()
        view.addSubview(productNameOneLabel)
        view.addSubview(productNameTwoLabel)
        view.addSubview(productPriceLabel)
        view.addSubview(firstColorButton)
        view.addSubview(secondColorButton)
        view.addSubview(compatibleImageView)
        view.addSubview(compatibleLabel)
        view.addSubview(compatibleNameLabel)
        view.addSubview(basketButton)
        view.addSubview(orderImageView)
        view.addSubview(orderOneNameLabel)
        view.addSubview(orderTwoNameLabel)
        view.addSubview(orderThreeNameLabel)
        view.addSubview(basketLabel)
        view.addSubview(basketTextField)
        notificationKeyboard()
        createElements()
    }
    
    private func createBarButtonItem() {
        navigationItem.setRightBarButtonItems([firstBarButtonItem, secondBarButtonItem], animated: true)
    }
    
    private func createElements() {
        basketTextField.delegate = self
        view.addSubview(caseViewInScrollView)
        view.addSubview(detailButton)
    }
    
    private func newImageViewWithImage(paramImage: String, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = UIImage(named: paramImage)
        result.isUserInteractionEnabled = true
        result.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapWabAction)))
        return result
    }
    
    private func notificationKeyboard() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil, queue: nil) { _ in
                self.view.frame.origin.y = -230
            }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil, queue: nil) { _ in
                self.view.frame.origin.y = 0.0
            }
    }
    
    private func createProductView(caseNameImage: [String]) -> UIScrollView {
        let scrollViewRect = CGRect(x: 0, y: 160, width: view.bounds.width, height: 300)
        let scrollView = UIScrollView(frame: scrollViewRect)
        scrollView.isPagingEnabled = true
        var imageViewRect = CGRect(x: 60, y: 0, width: 300, height: 300)
        for nameImage in caseNameImage {
            let imageView = newImageViewWithImage(paramImage: nameImage, paramFrame: imageViewRect)
            imageViewRect.origin.x += imageViewRect.width + 110
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollViewRect.width * CGFloat(caseNameImage.count) + 20,
                                        height: 300 )
        return scrollView
    }
    
    // MARK: - Private objc Methods
    @objc private func tapWabAction() {
        let productWebViewController = ProductWebViewController()
        productWebViewController.productUrlName = product.3
        present(productWebViewController, animated: false)
    }
    
    @objc private func detailButtonAction() {
        let detailWebViewController = DetailWebViewController()
        present(detailWebViewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension ProductViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == basketTextField {
            basketTextField.resignFirstResponder()
        }
        return true
    }
}
