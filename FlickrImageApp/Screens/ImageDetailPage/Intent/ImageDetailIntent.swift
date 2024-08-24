//
//  ImageDetailIntent.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import Foundation

/*
 *  ImageDetailIntentProtocol
 *
 *  Discussion:
 *      ImageDetailIntent setup the model ImageDetailModelActions
 *
 */

class ImageDetailIntent {
    private weak var model: ImageDetailModelActionsProtocol?
    
    init(model: ImageDetailModelActionsProtocol) {
        self.model = model
    }
    
}

/*
 *  ImageDetailIntent
 *
 *  Discussion:
 *      ImageDetailIntent setup the model ImageDetailModelActions function
 *
 */

extension ImageDetailIntent: ImageDetailIntentProtocol{
    func loadImageDetail(image: FlickrImagesItems) {
        model?.loadImageDetail(image: image)
    }
}
