//
//  SocialNetViewController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 5/7/18.
//  Copyright © 2018 Juan M Mariscal. All rights reserved.
//

import UIKit

class SocialNetViewController:   UICollectionViewController, UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackground()
        navigationItem.title = "Social Networks"
        setupSocialButtons()
        collectionView?.backgroundColor = .clear
        
    }
    
    func assignBackground() {
        let background = UIImage(named: "Haircut")
        
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
        let youTubeBtn = UIButton(type: .system)
        youTubeBtn.addTarget(self, action: #selector(didTapYouTube), for: .touchUpInside)
        youTubeBtn.setTitle("YouTube", for: .normal)
        youTubeBtn.setTitleColor(.white, for: .normal)
        youTubeBtn.backgroundColor = .darkGray
        youTubeBtn.layer.cornerRadius = 5
        
        return youTubeBtn
    }()
    
    let twitterBtn: UIButton = {
        let twitterBtn = UIButton(type: .system)
        twitterBtn.addTarget(self, action: #selector(didTapTwitter), for: .touchUpInside)
        twitterBtn.setTitle("Twitter", for: .normal)
        twitterBtn.setTitleColor(.white, for: .normal)
        twitterBtn.backgroundColor = .darkGray
        twitterBtn.layer.cornerRadius = 5

        return twitterBtn
    }()
    
    let instagramBtn: UIButton = {
        let instagramBtn = UIButton(type: .system)
        instagramBtn.addTarget(self, action: #selector(didTapInstagram), for: .touchUpInside)
        instagramBtn.setTitle("Instagram", for: .normal)
        instagramBtn.setTitleColor(.white, for: .normal)
        instagramBtn.backgroundColor = .darkGray
        instagramBtn.layer.cornerRadius = 5

        return instagramBtn
    }()
    
    fileprivate func setupSocialButtons() {
        let stackView = UIStackView(arrangedSubviews: [youTubeBtn, twitterBtn, instagramBtn])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        //stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 295, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 200, height: 210)
    }
    
    @objc func didTapYouTube() {
        let youtubeHooks = "youtube://user/ChrisFix"
        let youtubeUrl = NSURL(string: youtubeHooks)
        if UIApplication.shared.canOpenURL(youtubeUrl! as URL) {
            UIApplication.shared.open(youtubeUrl! as URL, options: [:], completionHandler: nil)
        } else {
            //redirect to safari because the user doesn't have YouTube App
            let youtubeWebUrl = NSURL(string: "http://www.youtube.com/")
            UIApplication.shared.open(youtubeWebUrl! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func didTapTwitter() {
        let twitterHooks = "twitter://user?screen_name=Juan_Mariscal03"
        let twitterUrl = NSURL(string: twitterHooks)
        if UIApplication.shared.canOpenURL(twitterUrl! as URL) {
            UIApplication.shared.open(twitterUrl! as URL, options: [:], completionHandler: nil)
        } else {
            let twitterWebUrl = NSURL(string: "http://www.twitter.com/Juan_Mariscal03")
            UIApplication.shared.open(twitterWebUrl! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func didTapInstagram() {
        let instagramHooks = "instagram://user?username=the.goodbarber"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.open(instagramUrl! as URL, options: [:], completionHandler: nil)
        } else {
            let instagramWebUrl = NSURL(string: "http://www.instagram.com/")
            UIApplication.shared.open(instagramWebUrl! as URL, options: [:], completionHandler: nil)
        }
    }
    
    
}
