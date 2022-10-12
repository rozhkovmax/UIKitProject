//
//  PriceWebViewController.swift
//  UIKitProject
//
//  Created by Maxim on 11.10.2022.
//

import UIKit
import WebKit
/// Контроллер просмотра PDF
final class DetailWebViewController: UIViewController {
    
    // MARK: - Private Properties
    private let webView = WKWebView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createWebView()
    }
    
    // MARK: - Private Methods
    private func createWebView() {
        guard let urlPdf = Bundle.main.url(forResource: "Detail", withExtension: "pdf") else { return }
        let request = URLRequest(url: urlPdf)
        webView.load(request)
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(webView)
    }
}
