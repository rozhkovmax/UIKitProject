//
//  SceneDelegate.swift
//  UIKitProject
//
//  Created by Maxim on 06.10.2022.
//

import UIKit
/// Начальный SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            
            guard let windowScene = scene as? UIWindowScene else { return }
            let window = UIWindow(windowScene: windowScene)
            
            let searchVC = SearchViewController()
            searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
            let buyVC = BuyViewController()
            buyVC.tabBarItem = UITabBarItem(title: "Покупка",
                                            image: UIImage(named: "laptop (3)"), tag: 0)
            let inPersonVC = InPersonViewController()
            inPersonVC.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.circle"), tag: 1)
            let basketVC = BasketViewController()
            basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)
            
            let searchNavController = UINavigationController(rootViewController: searchVC)
            let buyNavController = UINavigationController(rootViewController: buyVC)
            let inPersonNavController = UINavigationController(rootViewController: inPersonVC)
            let basketNavController = UINavigationController(rootViewController: basketVC)
            
            let tabBarVC = UITabBarController()
            tabBarVC.setViewControllers(
                [buyNavController, inPersonNavController, searchNavController, basketNavController],
                animated: true)
            
            window.rootViewController = tabBarVC
            window.overrideUserInterfaceStyle = .dark
            window.makeKeyAndVisible()

            self.window = window
        }
}
