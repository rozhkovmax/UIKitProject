//
//  ViewController.swift
//  UIKitProject
//
//  Created by Maxim on 06.10.2022.
//

import UIKit
/// Контроллер поиска
final class SearchViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let searchName = "Поиск"
        static let searchImage = UIImage(systemName: "magnifyingglass")
        static let searchBarText = "Поиск по продуктам и магазинам"
        static let recentlyViewedLabelText = "Недавно просмотренные"
        static let clearButtonName = "Очистить"
        static let queryOptionsLableText = "Варианты запросов"
        static let podsText = "AirPods"
        static let careText = "AppleCare"
        static let beatsText = "Beats"
        static let iPhoneText = "Сравнение модели iPhone"
        static let caseViewOneImage = UIImage(named: "Image")
        static let caseViewOneText = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let caseViewTwoImage = UIImage(named: "4")
        static let caseViewTwoText = "Cпортивный ремешок Black Unity"
        static let caseViewThreeImage = UIImage(named: "2")
        static let caseViewThreeText = "Кожаный чехол для MacBook Pro 16 дюймов"
        static let caseViewFourImage = UIImage(named: "iphone")
        static let caseViewFourText = "iPhone 12 Pro"
        static let caseViewOneTexePrice = "3 990.00 руб."
        static let caseViewTwoTexePrice = "2 500.00 руб."
        static let caseViewThreeTexePrice = "3 500.00 руб."
        static let caseViewFourTexePrice = "80 000.00 руб."
        static let caseOneNameImage = ["Image", "case2", "case3"]
        static let caseTwoNameImage = ["4", "clock2", "1"]
        static let caseThreeNameImage = ["2", "caseBrown2", "caseBrown3"]
        static let caseFourNameImage = ["iphone", "iPhone2", "iphone 3"]
        static let caseOneWebUrl = "https://re-store.ru/catalog/BST755118/"
        static let caseTwoWebUrl = "https://re-store.ru/catalog/MJ4V3ZM-A/"
        static let caseThreeWebUrl = "https://re-store.ru/catalog/NM7MDT0M00/"
        static let caseFourWebUrl = "https://re-store.ru/catalog/MGDC3RU-A/"
    }
    
    // MARK: - Visual Components
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 80, width: 150, height: 60)
        label.textColor = .white
        label.text = Constants.searchName
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 15, y: 145, width: 380, height: 35)
        searchBar.placeholder = Constants.searchBarText
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        searchBar.setImage(Constants.searchImage, for: .search, state: .normal)
        return searchBar
    }()
    
    private lazy var recentlyViewedLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 200, width: 290, height: 60)
        label.textColor = .white
        label.text = Constants.recentlyViewedLabelText
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 305, y: 202, width: 100, height: 60)
        button.setTitle(Constants.clearButtonName, for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private lazy var queryOptionsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 460, width: 290, height: 60)
        label.textColor = .white
        label.text = Constants.queryOptionsLableText
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private lazy var podsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 510, width: 290, height: 60)
        label.textColor = .white
        label.text = Constants.podsText
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var podsImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 15, y: 530, width: 20, height: 20)
        image.image = Constants.searchImage
        image.tintColor = .gray
        return image
    }()
    
    private lazy var careLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 550, width: 290, height: 60)
        label.textColor = .white
        label.text = Constants.careText
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var careImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 15, y: 570, width: 20, height: 20)
        image.image = Constants.searchImage
        image.tintColor = .gray
        return image
    }()
    
    private lazy var beatsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 590, width: 290, height: 60)
        label.textColor = .white
        label.text = Constants.beatsText
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var beatsImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 15, y: 610, width: 20, height: 20)
        image.image = Constants.searchImage
        image.tintColor = .gray
        return image
    }()
    
    private lazy var iPhoneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 630, width: 290, height: 60)
        label.textColor = .white
        label.text = Constants.iPhoneText
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var iPhoneImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 15, y: 650, width: 20, height: 20)
        image.image = Constants.searchImage
        image.tintColor = .gray
        return image
    }()
    
    private lazy var caseViewOneView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 5, y: 5, width: 150, height: 200)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var caseViewTwoView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 170, y: 5, width: 150, height: 200)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var caseViewThreeView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 335, y: 5, width: 150, height: 200)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var caseViewFourView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 500, y: 5, width: 150, height: 200)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var caseViewOneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: caseViewOneView.bounds.width, height: 100)
        label.textAlignment = .center
        label.textColor = .white
        label.text = Constants.caseViewOneText
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var caseViewOneImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 12, width: 110, height: 110)
        image.image = Constants.caseViewOneImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var caseViewTwoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: caseViewTwoView.bounds.width, height: 100)
        label.textAlignment = .center
        label.textColor = .white
        label.text = Constants.caseViewTwoText
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var caseViewTwoImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 12, width: 110, height: 110)
        image.image = Constants.caseViewTwoImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var caseViewThreeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: caseViewThreeView.bounds.width, height: 100)
        label.textAlignment = .center
        label.textColor = .white
        label.text = Constants.caseViewThreeText
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var caseViewThreeImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 12, width: 110, height: 110)
        image.image = Constants.caseViewThreeImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var caseViewFourLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: caseViewFourView.bounds.width, height: 100)
        label.textAlignment = .center
        label.textColor = .white
        label.text = Constants.caseViewFourText
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private lazy var caseViewFourImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 12, width: 110, height: 110)
        image.image = Constants.caseViewFourImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var caseScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 10, y: 250, width: view.bounds.width, height: 210)
        scrollView.indicatorStyle = .black
        scrollView.contentSize = CGRect(x: 10, y: 250, width: 680, height: 200).size
        return scrollView
    }()
    
    // MARK: - Private Property
    private let product = [(Constants.caseViewOneText, Constants.caseOneNameImage,
                            Constants.caseViewOneTexePrice, Constants.caseOneWebUrl),
                           (Constants.caseViewTwoText, Constants.caseTwoNameImage,
                            Constants.caseViewTwoTexePrice, Constants.caseTwoWebUrl),
                           (Constants.caseViewThreeText,
                            Constants.caseThreeNameImage, Constants.caseViewThreeTexePrice,
                            Constants.caseThreeWebUrl),
                           (Constants.caseViewFourText, Constants.caseFourNameImage,
                            Constants.caseViewFourTexePrice, Constants.caseFourWebUrl)]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    // MARK: - Private Methods
    private func allMethod() {
        view.addSubview(searchLabel)
        view.addSubview(searchBar)
        view.addSubview(recentlyViewedLabel)
        view.addSubview(clearButton)
        view.addSubview(queryOptionsLabel)
        view.addSubview(podsLabel)
        view.addSubview(podsImageView)
        view.addSubview(careLabel)
        view.addSubview(careImageView)
        view.addSubview(beatsLabel)
        view.addSubview(beatsImageView)
        view.addSubview(iPhoneLabel)
        view.addSubview(iPhoneImageView)
        caseViewOneView.addSubview(caseViewOneLabel)
        caseViewOneView.addSubview(caseViewOneImageView)
        caseViewTwoView.addSubview(caseViewTwoLabel)
        caseViewTwoView.addSubview(caseViewTwoImageView)
        caseViewThreeView.addSubview(caseViewThreeLabel)
        caseViewThreeView.addSubview(caseViewThreeImageView)
        caseViewFourView.addSubview(caseViewFourLabel)
        caseViewFourView.addSubview(caseViewFourImageView)
        createTapRecognizer()
        view.addSubview(caseScrollView)
        caseScrollView.addSubview(caseViewOneView)
        caseScrollView.addSubview(caseViewTwoView)
        caseScrollView.addSubview(caseViewThreeView)
        caseScrollView.addSubview(caseViewFourView)
        navigationItem.backButtonTitle = Constants.searchName
    }
    
    private func createTapRecognizer() {
        caseViewOneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        caseViewOneView.tag = 0
        caseViewTwoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        caseViewTwoView.tag = 1
        caseViewThreeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        caseViewThreeView.tag = 2
        caseViewFourView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
        caseViewFourView.tag = 3
    }
    
    // MARK: - Private objc Methods
    @objc private func tapAction(param: UIGestureRecognizer) {
        guard let caseView = param.view?.tag else { return }
        let productViewController = ProductViewController()
        productViewController.product = product[caseView]
        navigationController?.pushViewController(productViewController, animated: false)
    }
}
