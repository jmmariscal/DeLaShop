//
//  MainTabBarController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 3/19/18.
//  Copyright © 2018 Juan M Mariscal. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false



        setupViewControllers()
    }
    
    
    
    func setupViewControllers() {
        //home
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile"), rootViewController: HomeViewController())
        
        //appointments
        let webNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "cart"), selectedImage: #imageLiteral(resourceName: "cart"), rootViewController: WebViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //gallery
        let galleryNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "photo_btn"), selectedImage: #imageLiteral(resourceName: "photo_btn"), rootViewController: GalleryViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //social networks
        let socialNetworkController = templateNavController(unselectedImage: #imageLiteral(resourceName: "more_info_btn"), selectedImage: #imageLiteral(resourceName: "more_info_btn"), rootViewController: SocialNetViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        
        viewControllers = [homeNavController, webNavController, galleryNavController, socialNetworkController]
        
        //modify tab bar item insets
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
