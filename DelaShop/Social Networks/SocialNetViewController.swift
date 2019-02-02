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
        
        navigationItem.title = "Social Networks"
        
        collectionView?.backgroundView = UIImageView(image: #imageLiteral(resourceName: "barbershop"))
        
    }
}
