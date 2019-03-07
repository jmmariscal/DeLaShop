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
        

        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        //home
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_btn"), selectedImage: #imageLiteral(resourceName: "home_btn"), rootViewController: HomeViewController())
        
        //appointments
        let webNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "calendar_icon_white"), selectedImage: #imageLiteral(resourceName: "calendar_icon_white"), rootViewController: WebViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //gallery
        let galleryNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "photos_icon"), selectedImage: #imageLiteral(resourceName: "photos_icon"), rootViewController: GalleryViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //social networks
        let socialNetworkController = templateNavController(unselectedImage: #imageLiteral(resourceName: "more_info_btn"), selectedImage: #imageLiteral(resourceName: "more_info_btn"), rootViewController: SocialNetViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabBar.tintColor = .black
        
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
