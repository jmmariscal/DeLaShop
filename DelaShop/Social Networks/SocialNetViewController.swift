//
//  SocialNetViewController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 5/7/18.
//  Copyright © 2018 Juan M Mariscal. All rights reserved.
//

import UIKit

typealias Links = (hook: String, web: String)

class SocialNetViewController:   UICollectionViewController, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackground()
        navigationItem.title = "Social Networks"
        setupSocialButtons()
        collectionView?.backgroundColor = .clear
        
    }
    
    func assignBackground() {
        let background = UIImage(named: "barbershop")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    let youTubeBtn: UIButton = {
        let youTubeBtn = SocialButton(title: "YouTube")
        youTubeBtn.addTarget(self, action: #selector(didTapYouTube), for: .touchUpInside)
        return youTubeBtn
    }()
    
    let twitterBtn: UIButton = {
        let twitterBtn = SocialButton(title: "Twitter")
        twitterBtn.addTarget(self, action: #selector(didTapTwitter), for: .touchUpInside)
        return twitterBtn
    }()
    
    let instagramBtn: UIButton = {
        let instagramBtn = SocialButton(title: "Instagram")
        instagramBtn.addTarget(self, action: #selector(didTapInstagram), for: .touchUpInside)
        return instagramBtn
    }()
    
    fileprivate func setupSocialButtons() {
        let stackView = UIStackView(arrangedSubviews: [youTubeBtn, twitterBtn, instagramBtn])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 250, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 200, height: 250)
    }
    
    @objc func didTapYouTube() {
        let links: Links = ("youtube://user/ChrisFix",
                            "http://www.youtube.com/")
        open(socialTo: links)
    }
    
    @objc func didTapTwitter() {
        let links: Links = ("twitter://user?screen_name=Juan_Mariscal03",
                            "http://www.twitter.com/Juan_Mariscal03")
        open(socialTo: links)
    }
    
    @objc func didTapInstagram() {
        let links: Links = ("instagram://user?username=jmmariscal",
                            "http://www.instagram.com/")
        open(socialTo: links)
    }
    
    private func open(socialTo links: Links) {
        if let url = URL(string: links.hook), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else if let url = URL(string: links.web) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
