//
//  ImageDetailView.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import SwiftUI

/*
 *  ImageDetailView
 *
 *  Discussion:
 *      ImageDetailView for ImageDetail navigate from FlickrSearchView
 *      Used shared component AsyncImageData.
 *
 */

struct ImageDetailView {
    @StateObject private var container: MVIContainer<ImageDetailIntentProtocol, ImageDetailModelStateProtocol>
    
    private var intent: ImageDetailIntentProtocol { container.intent }
    private var state: ImageDetailModelStateProtocol { container.model }
    
    init(image: FlickrImagesItems) {
        let model = ImageDetailModel()
        let intent = ImageDetailIntent(model: model)
        let container = MVIContainer(
            intent: intent as ImageDetailIntentProtocol,
            model: model as ImageDetailModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        self._container = StateObject(wrappedValue: container)
        intent.loadImageDetail(image: image)
    }
}

extension ImageDetailView: View{
    var body: some View {
        VStack {
            if let urlString = state.image?.media?.link, let url = URL(string: urlString) {
                AsyncImageData(imageURL: url)
            } else {
                Image(systemName: C.SystemImage.defaultImage)
                    .frame(width: C.ImageDetailPageInfo.imageWidth, height: C.ImageDetailPageInfo.imageHeight)
            }
            Text(state.title)
                .font(.headline)
                .padding()
            
            Text(state.author)
                .padding(.bottom, C.ImageDetailPageInfo.textPadding)
            
            Text("Published: \(state.formattedDate)")
                .padding(.bottom, C.ImageDetailPageInfo.textPadding)
//            GeometryReader { geometry in
//                WebView(htmlContent: state.description)
//                    .frame(width: geometry.size.width, height: geometry.size.height)
//            }
            WebView(htmlContent: state.description)
                .frame(height: C.ImageDetailPageInfo.webViewHeight)
                .padding()
        }
        .navigationTitle(C.ImageDetailPageInfo.navigationTitle)
        .onAppear()
    }
}
