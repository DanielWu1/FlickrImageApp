//
//  Constant.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation

/*
 *  Constant File
 *
 *  Discussion:
 *      All Constant variable here
 *
 */

struct C{
    static let baseUrl: String = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    struct HomePageInfo{
        static let navigationTitle: String = "Flickr Search"
        static let NoDataFound: String = "No images found"
        static let imageHeight: CGFloat = 150
        static let imageWidth: CGFloat = 150
    }
    struct ImageDetailPageInfo{
        static let navigationTitle: String = "Image Detail"
        static let imageHeight: CGFloat = 150
        static let imageWidth: CGFloat = 150
        static let textPadding: CGFloat = 5
        static let webViewWidth: CGFloat = .infinity
        static let webViewHeight: CGFloat = 200
        struct ModelDefaultInfo{
            static let noTitle: String = "No Title"
            static let author: String = "Unknown"
            static let noDescription: String = "No Description"
            static let noDate: String = "Unknown Date"
        }
    }
    struct SystemImage{
        static let failureLoadImage: String = "xmark.circle"
        static let defaultImage: String = "photo"
    }
    struct ErrorMessage{
        static let FailedLoadImage: String = "Failed to load images:"

    }
}
