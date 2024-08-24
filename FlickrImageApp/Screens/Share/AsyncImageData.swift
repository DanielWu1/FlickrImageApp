//
//  AsyncImageData.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import SwiftUI

/*
 *  AsyncImageData
 *
 *  Discussion:
 *      Custom AsyncImage here 
 *
 */


struct AsyncImageData: View {
    let imageURL: URL
    // cache part
    private var cacheManager: ImageCacheManager
    private var networkManager: NetworkManager
    
    init(imageURL: URL, cacheManager: ImageCacheManager = ImageCacheManager.shared, networkManager: NetworkManager = NetworkManager.shared) {
        self.imageURL = imageURL
        self.cacheManager = cacheManager
        self.networkManager = networkManager
    }
    
    var body: some View {
        // if is in the cache then get the data and show
        if let cachedUIImage = cacheManager.image(forKey: imageURL.absoluteString) {
            Image(uiImage: cachedUIImage)
                .frame(width: C.HomePageInfo.imageWidth, height: C.HomePageInfo.imageHeight)
                .clipped()
        } else {
            // in case not in cache
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: C.HomePageInfo.imageWidth, height: C.HomePageInfo.imageHeight)
                case .success(let image):
                    image
                        .frame(width: C.HomePageInfo.imageWidth, height: C.HomePageInfo.imageHeight)
                        .clipped()
                    //if appear then cache the image
                        .onAppear {
                            cacheImage(from: imageURL)
                        }
                case .failure:
                    Image(systemName: C.SystemImage.failureLoadImage)
                        .frame(width: C.HomePageInfo.imageWidth, height: C.HomePageInfo.imageHeight)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
    
    private func cacheImage(from url: URL) {
        // download here
        Task {
            do {
                let data = try await networkManager.request(urlString: url.absoluteString, method: .GET, body: nil)
                cacheManager.setImageData(data, forKey: url.absoluteString)
            } catch {
                print("Failed to cache image: \(error)")
            }
        }
    }
}

//#Preview {
//    AsyncImageData()
//}
