//
//  FlickrImageHomePageModel.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation

/*
 *  FlickrSearchModel
 *
 *  Discussion:
 *      FlickrSearchModel is for setup the state
 *
 */

final class FlickrSearchModel: ObservableObject, FlickrSearchModelStateProtocol {
    
    @Published var images: [FlickrImagesItems] = []
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
}

/*
 *  FlickrSearchModel
 *
 *  Discussion:
 *      FlickrSearchModel is for setup the Action function
 *
 */

extension FlickrSearchModel: FlickrSearchModelActionsProtocol {

    func displayImages(_ images: [FlickrImagesItems]) {
        self.images = images
        self.error = nil
        self.isLoading = false
    }

    func displayError(_ error: Error?) {
        self.error = error?.localizedDescription
        self.isLoading = false
    }

    func displayLoading(_ status: Bool) {
        self.isLoading = status
    }
}
