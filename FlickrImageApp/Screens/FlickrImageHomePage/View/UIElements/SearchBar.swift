//
//  SearchBar.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import SwiftUI

/*
 *  SearchBar
 *
 *  Discussion:
 *      Custom TextField binding data from FlickrSearchView
 *
 */

struct SearchBar: View {
    @Binding var text: String
    var onSearch: (String) -> Void
    
    var body: some View {
        TextField("Search...", text: $text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .onChange(of: text) { newValue in
            onSearch(newValue)
        }
    }
}
//#Preview {
//    SearchBar(text: , onSearch: )
//}
