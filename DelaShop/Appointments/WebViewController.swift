//
//  WebViewController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 3/19/18.
//  Copyright © 2018 Juan M Mariscal. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, WKNavigationDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Shop"
        
        view.addSubview(webView)
        webView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -140, paddingRight: 0, width: 200, height: 90)
        
        setupButtons()
        
        
        webView.delegate = self as? UIWebViewDelegate
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [refreshBtn, backBtn, forwardBtn])
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        view.addSubview(stackView)
        
        stackView.anchor(top: webView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -87, paddingRight: 0, width: 200, height: 30)
    }
    
    let webView:UIWebView = {
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        webView.loadRequest(NSURLRequest(url: NSURL(string: "https://www.beardbrand.com")! as URL) as URLRequest)
        
        return webView
    }()
    
    let backBtn: UIButton = {
        let backBtn = UIButton(type: .system)
        backBtn.setImage(#imageLiteral(resourceName: "back_btn_light"), for: .normal)
        backBtn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        return backBtn
    }()
    
    let forwardBtn: UIButton = {
        let forwardBtn = UIButton(type: .system)
        forwardBtn.setImage(#imageLiteral(resourceName: "forward_btn_light copy"), for: .normal)
        
        forwardBtn.addTarget(self, action: #selector(handleForward), for: .touchUpInside)
        
        return forwardBtn
    }()
    
    let refreshBtn: UIButton = {
       let reBtn = UIButton(type: .system)
        reBtn.setImage(#imageLiteral(resourceName: "repeat_btn"), for: .normal)
        reBtn.addTarget(self, action: #selector(handleRefresh), for: .touchUpInside)
        
        return reBtn
    }()
    
    @objc func handleBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func handleRefresh() {
        webView.reload()
    }
    
    @objc func handleForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

}
