//
//  InstagramImageFetcher.swift
//  DelaShop
//
//  Created by Angel Contreras on 2/2/19.
//  Copyright © 2019 Juan M Mariscal. All rights reserved.
//

import Foundation

class InstagramImageFetcher {
    
    //Singleton
    static let shared = InstagramImageFetcher()
    
    private var endpoint: URL? {
        return URL(string: "https://api.instagram.com/v1/users/self/media/recent/?access_token=\(accessToken)")
    }
    
    private let accessToken = "48092835.d551c49.d345ef364f264606a11c2ba3b66962bc"
    
    func getInstagramData(completion: @escaping (InstagramData?)->Void ) {
        guard let url = endpoint else { completion(nil); return}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }
            
            let instagramData: InstagramData? = try? JSONDecoder().decode(InstagramData.self, from: data)
            
            DispatchQueue.main.async {
                completion(instagramData)
            }
        }
        
        dataTask.resume()

    }
    
    func fetchImage(with urlString: String, completion: @escaping (Data?) -> Void ) {
        
        guard let url = URL(string: urlString) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
        
        dataTask.resume()
    }
}
