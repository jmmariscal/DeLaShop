//
//  SocialButton.swift
//  DelaShop
//
//  Created by Angel Contreras on 3/6/19.
//  Copyright © 2019 Juan M Mariscal. All rights reserved.
//

import UIKit

class SocialButton: UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        backgroundColor = .lightGray
        layer.cornerRadius = 5
    }
}
