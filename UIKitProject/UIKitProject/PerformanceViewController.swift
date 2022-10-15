//
//  PerformanceViewController.swift
//  UIKitProject
//
//  Created by Maxim on 12.10.2022.
//

import UIKit
///  Контроллер начального представления
final class PerformanceViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let errorText = "Ошибка!"
        static let fontOneName = "Cochin-Bold"
        static let fontTwoName = "Baskerville"
    }
    
    // MARK: - Visual Components
    private lazy var performanceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 1.2)
        return imageView
    }()
    
    private lazy var oneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 60, y: 590, width: 280, height: 70)
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.font = UIFont(name: Constants.fontOneName, size: label.font.pointSize)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var twoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 640, width: 365, height: 70)
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15)
        label.font = UIFont(name: Constants.fontTwoName, size: label.font.pointSize)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle
    init(imageName: String, titleText: String, subtitleText: String) {
        super.init(nibName: nil, bundle: nil)
        performanceImageView.image = UIImage(named: imageName)
        oneLabel.text = titleText
        twoLabel.text = subtitleText
        allMetod()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.errorText)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UILabel.animate(withDuration: 2) {
            self.oneLabel.alpha = 1
            self.twoLabel.alpha = 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        oneLabel.alpha = 0
        twoLabel.alpha = 0
    }
    
    // MARK: - Private Methods
    private func allMetod() {
        view.addSubview(performanceImageView)
        view.addSubview(oneLabel)
        view.addSubview(twoLabel)
        transparency()
    }
    
    private func transparency() {
        oneLabel.alpha = 0
        twoLabel.alpha = 0
    }
}
