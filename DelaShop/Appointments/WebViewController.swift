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
        
        navigationItem.title = "Appointments"
        
        view.addSubview(webView)
        webView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 64, paddingLeft: 0, paddingBottom: -140, paddingRight: 0, width: 200, height: 90)
        
        setupButtons()
        
        
        webView.delegate = self as? UIWebViewDelegate
    }
    
    let webView:UIWebView = {
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        webView.loadRequest(NSURLRequest(url: NSURL(string: "https://www.genbook.com/bookings/slot/reservation/30381985?category=2430559618")! as URL) as URLRequest)
        
        return webView
    }()
    
    let backBtn: UIButton = {
        let backBtn = UIButton(type: .system)
        backBtn.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
        
        backBtn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        
        return backBtn
    }()
    
    let forwardBtn: UIButton = {
        let forwardBtn = UIButton(type: .system)
        forwardBtn.setImage(#imageLiteral(resourceName: "forward_button"), for: .normal)
        
        forwardBtn.addTarget(self, action: #selector(handleForward), for: .touchUpInside)
        
        return forwardBtn
    }()
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [backBtn, forwardBtn])
        
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        view.addSubview(stackView)
        
        stackView.anchor(top: webView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -87, paddingRight: 0, width: 200, height: 30)
    }
    
    @objc func handleBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func handleForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

}
