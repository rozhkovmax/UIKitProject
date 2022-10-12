//
//  ForYouViewController.swift
//  UIKitProject
//
//  Created by Maxim on 06.10.2022.
//

import UIKit
/// Контроллер персональных продуктов
final class InPersonViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let newText = "Вот что нового"
        static let caseImage = UIImage(named: "apple-airpod")
        static let orderdText = "Ваш заказ отправлен."
        static let goodsText = "1 товар, доставка завтра"
        static let arrowImage = UIImage(systemName: "chevron.right")
        static let treatmentText = "Обрабатывается"
        static let sentText = "Отправлено"
        static let deliverText = "Доставлено"
        static let recommendationText = "Рекомендуется вам"
        static let scrollImage = UIImage(named: "square")
        static let newsText = "Получите новости о своем заказе в режиме реального времени."
        static let notificationText = "Включите уведомления, чтобы получить новости о свое заказе."
        static let deviceText = "ваши устройства"
        static let showText = "Показать все"
        static let avatarImage = UIImage(named: "avatar1")
        static let barName = "Для Вас"
        static let keyName = "Avatar"
        static let ImageSizeForLargeState: CGFloat = 40
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let ImageBottomMarginForSmallState: CGFloat = 6
        static let ImageSizeForSmallState: CGFloat = 32
        static let NavBarHeightSmallState: CGFloat = 44
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    // MARK: - Visual Components
    private lazy var personScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        scrollView.contentSize = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height).size
        scrollView.indicatorStyle = .white
        return scrollView
    }()
    
    private lazy var lineOneView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 430, height: 1)
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var newLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 30, width: 250, height: 35)
        label.text = Constants.newText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var shadowCaseView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 25, y: 95, width: 375, height: 170)
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var caseView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 90, width: 375, height: 170)
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var lineTwoView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 195, width: 375, height: 1)
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var caseImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 30, y: 20, width: 80, height: 80)
        image.image = Constants.caseImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var orderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 20, width: 250, height: 35)
        label.text = Constants.orderdText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private lazy var goodsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 45, width: 250, height: 35)
        label.text = Constants.goodsText
        label.textAlignment = .left
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var arrowOneButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 340, y: 40, width: 35, height: 35)
        button.setImage(Constants.arrowImage, for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.frame = CGRect(x: 15, y: 120, width: 350, height: 30)
        progressView.progressTintColor = .systemGreen
        progressView.progress = 0.5
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 2)
        progressView.layer.cornerRadius = 4
        return progressView
    }()
    
    private lazy var treatmentLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 130, width: 130, height: 35)
        label.text = Constants.treatmentText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var sentLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 130, width: 130, height: 35)
        label.text = Constants.sentText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var deliverLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 290, y: 130, width: 130, height: 35)
        label.text = Constants.deliverText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var recommendationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 320, width: 250, height: 35)
        label.text = Constants.recommendationText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var scrollImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 40, y: 380, width: 50, height: 50)
        image.image = Constants.scrollImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 375, width: 210, height: 70)
        label.text = Constants.newsText
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 120, y: 415, width: 300, height: 70)
        label.text = Constants.notificationText
        label.textAlignment = .left
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var arrowTwoButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 380, y: 410, width: 30, height: 30)
        button.setImage(Constants.arrowImage, for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private lazy var lineThreeView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 490, width: 430, height: 1)
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var deviceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 530, width: 350, height: 35)
        label.text = Constants.deviceText
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 295, y: 530, width: 100, height: 40)
        button.setTitle(Constants.showText, for: .normal)
        return button
    }()
    
    // MARK: - Private Properties
    private let avatarImageView = UIImageView(image: Constants.avatarImage)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }
    
    // MARK: - Private Methods
    private func allMethod() {
        view.addSubview(personScrollView)
        personScrollView.addSubview(newLabel)
        personScrollView.addSubview(shadowCaseView)
        personScrollView.addSubview(caseView)
        personScrollView.addSubview(lineOneView)
        personScrollView.addSubview(lineTwoView)
        caseView.addSubview(caseImageView)
        caseView.addSubview(orderLabel)
        caseView.addSubview(goodsLabel)
        caseView.addSubview(arrowOneButton)
        caseView.addSubview(progressView)
        caseView.addSubview(treatmentLabel)
        caseView.addSubview(sentLabel)
        caseView.addSubview(deliverLabel)
        personScrollView.addSubview(recommendationLabel)
        personScrollView.addSubview(scrollImageView)
        personScrollView.addSubview(newsLabel)
        personScrollView.addSubview(notificationLabel)
        personScrollView.addSubview(arrowTwoButton)
        personScrollView.addSubview(lineThreeView)
        personScrollView.addSubview(deviceLabel)
        personScrollView.addSubview(showButton)
        createNavigationBar()
        tapAvatarImage()
        avatarImageView.image = checkUserDefaults()
    }
    
    private func tapAvatarImage() {
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(tapAvatarImageAction)))
    }
    
    private func saveUserDefaults(image: Data) {
        let defaults = UserDefaults.standard
        defaults.setValue(image, forKey: Constants.keyName)
    }
    
    private func checkUserDefaults() -> UIImage? {
        let userDefaults = UserDefaults.standard
        guard let dataImage = userDefaults.object(forKey: Constants.keyName) as? Data,
              let image = UIImage(data: dataImage) else {
            let image = Constants.avatarImage?.resizeImage(to: CGSize(width: 30, height: 30))
            return image
        }
        return image
    }
    
    private func createNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Constants.barName
        navigationController?.overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(avatarImageView)
        avatarImageView.layer.cornerRadius = Constants.ImageSizeForLargeState / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                                   constant: -Constants.ImageRightMargin),
            avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                                    constant: -Constants.ImageBottomMarginForLargeState),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.ImageSizeForLargeState),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
        ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Constants.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Constants.NavBarHeightLargeState - Constants.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        let factor = Constants.ImageSizeForSmallState / Constants.ImageSizeForLargeState
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        let sizeDiff = Constants.ImageSizeForLargeState * (1.0 - factor)
        let yTranslation: CGFloat = {
            let maxYTranslation = Constants.ImageBottomMarginForLargeState -
            Constants.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff *
                                                (Constants.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        avatarImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    // MARK: - Private objc Methods
    @objc private func tapAvatarImageAction() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension InPersonViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let img = image.resizeImage(to: CGSize(width: 30, height: 30))
        avatarImageView.image = img
        guard let imageData = image.pngData() else { return }
        saveUserDefaults(image: imageData)
        dismiss(animated: true)
    }
}

// MARK: - UIImage
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

// MARK: - UIScrollViewDelegate
extension InPersonViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

// MARK: - UINavigationControllerDelegate
extension InPersonViewController: UINavigationControllerDelegate {}
