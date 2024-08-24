//
//  FlickrImageHomePage.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import SwiftUI

/*
 *  FlickrSearchView
 *
 *  Discussion:
 *      Home page of the application shows the SearchBar and GridView
 *
 */

struct FlickrSearchView {
    @StateObject private var container: MVIContainer<FlickrSearchIntentProtocol, FlickrSearchModelStateProtocol>
    @State private var searchText: String = ""
    
    private var intent: FlickrSearchIntentProtocol { container.intent }
    private var state: any FlickrSearchModelStateProtocol { container.model }
    
    init() {
        let model = FlickrSearchModel()
        let intent = FlickrSearchIntent(model: model)
        let container = MVIContainer(
            intent: intent as FlickrSearchIntentProtocol,
            model: model as FlickrSearchModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        self._container = StateObject(wrappedValue: container)
    }
    
}

extension FlickrSearchView: View{
    var body: some View {
        NavigationView {
            VStack{
                SearchBar(text: $searchText, onSearch: { query in
                    Task {
                        await intent.searchImages(query: query)
                    }
                })
                if state.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                            .padding()
                        Spacer()
                    }
                } else if let error = state.error {
                    VStack {
                        Spacer()
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                        Spacer()
                    }
                } else if state.images.isEmpty {
                    VStack {
                        Spacer()
                        Text(C.HomePageInfo.NoDataFound)
                            .foregroundColor(.gray)
                            .padding()
                        Spacer()
                    }
                } else {
                    ScrollView {
                        GridView(images: state.images)
                    }
                }
            }
            .navigationTitle(C.HomePageInfo.navigationTitle)
        }
    }
}

//#Preview {
//    FlickrSearchView()
//}
