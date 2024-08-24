//
//  FlickrImageHomePageIntent.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation

/*
 *  FlickrSearchIntent
 *
 *  Discussion:
 *      setup the model and networkManger
 *
 */

class FlickrSearchIntent {
    private weak var model: (any FlickrSearchModelActionsProtocol)?
    private let networkManager: NetworkManager
    
    init(model: any FlickrSearchModelActionsProtocol, networkManager: NetworkManager = .shared) {
        self.model = model
        self.networkManager = networkManager
    }
}

/*
 *  FlickrSearchIntent (extension)
 *
 *  Discussion:
 *      extension of the FlickrSearchIntent provide the searchImage feature
 *
 */

extension FlickrSearchIntent: FlickrSearchIntentProtocol {

    func searchImages(query: String) async {
        guard !query.isEmpty else {
            model?.displayImages([])
            return
        }
        model?.displayError(nil)
        model?.displayLoading(true)
        do {
            let urlString = "\(C.baseUrl)\(query)"
            let data = try await networkManager.request(urlString: urlString, method: .GET, body: nil)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(FlickrImage.self, from: data)
            model?.displayImages(response.flickrImagesItem)
        } catch {
            model?.displayError(error)
        }
    }
}
