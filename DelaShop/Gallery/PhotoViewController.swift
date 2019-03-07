//
//  PhotoViewController.swift
//  DelaShop
//
//  Created by Juan M Mariscal on 3/4/19.
//  Copyright © 2019 Juan M Mariscal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var image: InstagramData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "\(image.)")
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
}
