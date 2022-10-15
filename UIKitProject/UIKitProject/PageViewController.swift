//
//  PageViewController.swift
//  UIKitProject
//
//  Created by Maxim on 12.10.2022.
//

import UIKit
/// Контроллер страницы начального представления
final class PageViewController: UIPageViewController {
    // MARK: - Constants
    private enum Constants {
        static let skipButtonName = "SKIP"
        static let nextButtonName = "NEXT"
        static let pageOneName = "page1"
        static let pageTwoName = "page2"
        static let pageThreeName = "page3"
        static let pageOneTintText = "Track Your Cycle"
        static let pageTwoTintText = "Plan Your Pregnancy"
        static let pageThreeTintText = "Daily Health Insight"
        static let pageOneText = "Manage irregular period and lcarn and learn how to improve your period"
        static let pageTwoText = "Favorable days are impornant. Vestibulum retrum quam vitae fringular tincidunt."
        static let pageThreeText = "Personal healf insight. Vestibulum retrum quarm vitae fringilla tincidunt."
        static let keyText = "presentView"
        static let goButtonName = "GET STARTED!"
    }
    
    // MARK: - Visual Components
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 780, width: 100, height: 30)
        button.setTitleColor(.systemGray, for: .normal)
        button.setTitle(Constants.skipButtonName, for: .normal)
        button.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 300, y: 780, width: 100, height: 30)
        button.setTitleColor(.link, for: .normal)
        button.setTitle(Constants.nextButtonName, for: .normal)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var goButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 130, y: 780, width: 150, height: 30)
        button.setTitleColor(.link, for: .normal)
        button.setTitle(Constants.goButtonName, for: .normal)
        button.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageCont = UIPageControl()
        pageCont.frame = CGRect(x: 130, y: 780, width: 150, height: 30)
        pageCont.currentPageIndicatorTintColor = .black
        pageCont.pageIndicatorTintColor = .systemGray
        pageCont.numberOfPages = pages.count
        pageCont.currentPageIndicatorTintColor = .link
        pageCont.addTarget(self, action: #selector(pageControlAction(_:)), for: .valueChanged)
        return pageCont
    }()
    
    // MARK: - Private Properties
    private var indexPage = 0
    private var pages: [UIViewController] = [UIViewController]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    // MARK: - Private Methods
    private func allMetod() {
        createPage()
        view.backgroundColor = .white
        dataSource = self
        delegate = self
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        view.addSubview(goButton)
        goButton.isHidden = true
        userDefaults()
    }
    
    private func hiddenBool(isHidden: Bool) {
        for subview in view.subviews where subview is UIPageControl {
            subview.isHidden = isHidden
        }
    }
    
    private func lastView(index: Int) {
        if index == pages.count - 1 {
            goButton.isHidden = false
            skipButton.isHidden = true
            nextButton.isHidden = true
            hiddenBool(isHidden: true)
        } else {
            goButton.isHidden = true
            skipButton.isHidden = false
            nextButton.isHidden = false
            hiddenBool(isHidden: false)
        }
    }
    
    private func userDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: Constants.keyText)
    }
    
    private func createPage() {
        let page1 = PerformanceViewController(imageName: Constants.pageOneName,
                                              titleText: Constants.pageOneTintText,
                                              subtitleText: Constants.pageOneText)
        let page2 = PerformanceViewController(imageName: Constants.pageTwoName,
                                              titleText: Constants.pageTwoTintText,
                                              subtitleText: Constants.pageTwoText)
        let page3 = PerformanceViewController(imageName: Constants.pageThreeName,
                                              titleText: Constants.pageThreeTintText,
                                              subtitleText: Constants.pageThreeText)
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        setViewControllers([pages[indexPage]], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: - Private objc Methods
    @objc func pageControlAction(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func skipButtonAction() {
        dismiss(animated: true)
    }
    
    @objc func nextButtonAction() {
        guard let currentPage = viewControllers?.first,
        let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        if nextPage == pages.last {
            goButton.isHidden = false
            skipButton.isHidden = true
            nextButton.isHidden = true
            hiddenBool(isHidden: true)
        }
        setViewControllers([nextPage], direction: .forward, animated: true)
        pageControl.currentPage += 1
    }
}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController),
              currentIndex > 0 else { return nil }
        indexPage = currentIndex - 1
        return pages[indexPage]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController),
              currentIndex < pages.count - 1 else { return nil }
        indexPage = currentIndex + 1
        return pages[indexPage]
    }
}

// MARK: - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers?.first,
              let currentIndex = pages.firstIndex(of: viewControllers) else { return }
        pageControl.currentPage = currentIndex
        lastView(index: currentIndex)
    }
}
