//
//  ProductWebViewController.swift
//  UIKitProject
//
//  Created by Maxim on 10.10.2022.
//

import UIKit

import WebKit
/// Контроллер веб представления товара
final class ProductWebViewController: UIViewController {
    
    // MARK: - Private Properties
    private let webView = WKWebView()
    private let toolBar = UIToolbar()
    private let goBackBarButtonItem = UIBarButtonItem(systemItem: .rewind)
    private let goForwardBarButtonItem = UIBarButtonItem(systemItem: .fastForward)
    private let refreshBarButtonItem = UIBarButtonItem(systemItem: .refresh)
    private let spaceBarButtonItem = UIBarButtonItem(systemItem: .flexibleSpace)
    private let shareBarButtonItem = UIBarButtonItem(systemItem: .action)
    private let progressView = UIProgressView()
    private var observer: NSKeyValueObservation?
    
    // MARK: - Public Properties
    public var productUrlName = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMethod()
    }

    // MARK: - Private Methods
    private func allMethod() {
        view.backgroundColor = .white
        createWebView()
        createToolBar()
        createProgressView()
    }
    
    private func createProgressView() {
        progressView.frame = CGRect(x: 115, y: 800, width: 200, height: 30)
        view.addSubview(progressView)
        observer = webView.observe(\.estimatedProgress, options: [.new]) { _, _ in
            self.progressView.progress = Float(self.webView.estimatedProgress)
        }
    }
    
    private func createWebView() {
        guard let url = URL(string: productUrlName) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(webView)
        webView.navigationDelegate = self
    }
    
    private func createToolBar() {
        toolBar.frame = CGRect(x: 0, y: 770, width: view.bounds.width, height: 50)
        toolBar.barTintColor = .systemGray5
        toolBar.isTranslucent = false
        toolBar.items = [goBackBarButtonItem, goForwardBarButtonItem, spaceBarButtonItem,
                         shareBarButtonItem, refreshBarButtonItem]
        goBackBarButtonItem.action = #selector(goBackItemAction)
        goForwardBarButtonItem.action = #selector(goForwardItemAction)
        refreshBarButtonItem.action = #selector(refreshItemAction)
        shareBarButtonItem.action = #selector(shareItemAction)
        view.addSubview(toolBar)
    }
    
    // MARK: - Private objc Methods
    @objc private func goBackItemAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func goForwardItemAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc private func refreshItemAction() {
        webView.reload()
    }
    
    @objc private func shareItemAction() {
        guard let url = URL(string: productUrlName) else { return }
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}

// MARK: - UIWebViewDelegate
extension ProductWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        goBackBarButtonItem.isEnabled = webView.canGoBack
        goForwardBarButtonItem.isEnabled = webView.canGoForward
    }
}
