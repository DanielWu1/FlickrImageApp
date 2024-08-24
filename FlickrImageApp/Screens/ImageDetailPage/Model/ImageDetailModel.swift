//
//  FlickrImageDetailModel.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import Foundation

/*
 *  ImageDetailModel
 *
 *  Discussion:
 *      ImageDetailModel is for setup the state
 *
 */

final class ImageDetailModel: ObservableObject, ImageDetailModelStateProtocol {
    
    @Published var image: FlickrImagesItems?
    @Published var formattedDate: String = ""
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var description: String = ""
}

/*
 *  ImageDetailModel
 *
 *  Discussion:
 *      ImageDetailModel is for setup the Action function
 *
 */

extension ImageDetailModel: ImageDetailModelActionsProtocol {
    func loadImageDetail(image: FlickrImagesItems) {
        self.image = image
        self.title = image.title ?? C.ImageDetailPageInfo.ModelDefaultInfo.noTitle
        self.author = "Author: \(image.author ?? C.ImageDetailPageInfo.ModelDefaultInfo.author)"
        self.description = image.description ?? C.ImageDetailPageInfo.ModelDefaultInfo.noDescription
        
        if let dateString = image.published {
            self.formattedDate = formatDateString(dateString: dateString)
        } else {
            self.formattedDate = C.ImageDetailPageInfo.ModelDefaultInfo.noDate
        }
    }
    
    
    func formatDateString(dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: dateString) else { return dateString }
        return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .short)
    }
}
