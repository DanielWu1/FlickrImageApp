//
//  FlickrImageDetailModelStateProtocol.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import Foundation

/*
 *  ImageDetailModelStateProtocol
 *
 *  Discussion:
 *      protocol for hold the state
 *
 */

protocol ImageDetailModelStateProtocol {
    var image: FlickrImagesItems? { get }
    var formattedDate: String { get }
    var title: String { get }
    var author: String { get }
    var description: String { get }
}

/*
 *  ImageDetailModelStateProtocol
 *
 *  Discussion:
 *      protocol for update the state(Action)
 *
 */

protocol ImageDetailModelActionsProtocol: AnyObject {
    func loadImageDetail(image: FlickrImagesItems)
}
