//
//  InstagramData.swift
//  DelaShop
//
//  Created by Angel Contreras on 2/2/19.
//  Copyright © 2019 Juan M Mariscal. All rights reserved.
//

import Foundation

struct InstagramData: Codable {
    let data: [Post]
}

struct Post: Codable {
    let images: Image
}

struct Image: Codable {
    let thumbnail: Resolution
    let low_resolution: Resolution
    let standard_resolution: Resolution
}

struct Resolution: Codable {
    let width: Int
    let height: Int
    let url: String
}
