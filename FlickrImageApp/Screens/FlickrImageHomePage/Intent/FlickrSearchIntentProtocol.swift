//
//  FlickrSearchIntentProtocol.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation

/*
 *  FlickrSearchIntentProtocol
 *
 *  Discussion:
 *      protocol of the FlickrSearchIntent
 *
 */

protocol FlickrSearchIntentProtocol {
    func searchImages(query: String) async
}
