//
//  ImageCacheManager.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import Foundation
import SwiftUI

final class ImageCacheManager: ObservableObject {
    static let shared: ImageCacheManager = {
        let instance = ImageCacheManager()
        return instance
    }()
    private let cache = NSCache<NSString, NSData>()
    
    private init() {
        cache.countLimit = 40
        cache.totalCostLimit = 50 * 1024 * 1024
    }
    
    func image(forKey key: String) -> UIImage? {
        guard let imageData = cache.object(forKey: key as NSString) else {
            return nil
        }
        return UIImage(data: imageData as Data)
    }
    
    func setImageData(_ data: Data, forKey key: String) {
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
}
