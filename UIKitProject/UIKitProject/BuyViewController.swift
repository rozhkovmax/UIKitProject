//
//  BuyViewController.swift
//  UIKitProject
//
//  Created by Maxim on 06.10.2022.
//

import UIKit
/// Контроллер покупок
final class BuyViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let keyText = "presentView"
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startPerformance()
    }
    
    // MARK: - Private Methods
    private func startPerformance() {
        let userDefaults = UserDefaults.standard
        let presentView = userDefaults.bool(forKey: Constants.keyText)
        if presentView == false {
            let pageViewController = PageViewController(transitionStyle: .scroll,
                                                        navigationOrientation: .horizontal,
                                                        options: nil)
            present(pageViewController, animated: true)
        }
    }
}
