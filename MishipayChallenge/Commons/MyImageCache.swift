//
//  MyImageCache.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import Foundation
import UIKit

class MyImageCache {
    
    static let sharedCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 20
        cache.totalCostLimit = 10*1024*1024;
        return cache
    }();
    
}

extension UIImageView  {
    
    func fetchImage(_ url: String) {
        guard let url = URL(string: url) else { return }
        let cache = MyImageCache.sharedCache
        if let cacheImage = cache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                self.image = cacheImage
            }
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                } else if let data = data, let image = UIImage(data: data) {
                    cache.setObject(image, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    print(error ?? "")
                }
                }.resume()
        }
    }
    
}
