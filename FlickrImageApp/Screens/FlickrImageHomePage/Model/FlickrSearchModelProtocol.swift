//
//  FlickrSearchModelProtocol.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation

/*
 *  FlickrSearchModelStateProtocol
 *
 *  Discussion:
 *      protocol for hold the state
 *
 */

protocol FlickrSearchModelStateProtocol {
    var images: [FlickrImagesItems] { get }
    var isLoading: Bool { get }
    var error: String? { get }
}

/*
 *  FlickrSearchModelActionsProtocol
 *
 *  Discussion:
 *      protocol for update the state(Action)
 *
 */

protocol FlickrSearchModelActionsProtocol: AnyObject {
    func displayImages(_ images: [FlickrImagesItems])
    func displayError(_ error: Error?)
    func displayLoading(_ status: Bool)
}
