//
//  FlickrImage.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation

struct FlickrImage: Hashable, Codable {
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case link = "link"
        case flickrImagesItem = "items"
    }
    let title: String?
    let link: String?
    let flickrImagesItem: [FlickrImagesItems]
}

struct FlickrImagesItems: Hashable, Codable {
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case description = "description"
        case media = "media"
        case author = "author"
        case published = "published"
    }
    let title: String?
    let description: String?
    let media: Media?
    let author: String?
    let published: String?
}

struct Media: Hashable, Codable {
    enum CodingKeys: String, CodingKey{
        case link = "m"
    }
    let link: String
}
