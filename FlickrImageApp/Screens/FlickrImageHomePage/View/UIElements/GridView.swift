//
//  GridView.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import SwiftUI

/*
 *  GridView
 *
 *  Discussion:
 *      GridView with data used the shared component AsyncImageData.
 *
 */

struct GridView: View {
    let images: [FlickrImagesItems]
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(images, id: \.self) { image in
                NavigationLink(destination: ImageDetailView(image: image)) {
                    if let urlString = image.media?.link, let url = URL(string: urlString) {
                        AsyncImageData(imageURL: url)
                    } else {
                        Image(systemName: C.SystemImage.defaultImage)
//                            .resizable()
                            .frame(width: C.HomePageInfo.imageWidth, height: C.HomePageInfo.imageHeight)
                    }
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    GridView()
//}
