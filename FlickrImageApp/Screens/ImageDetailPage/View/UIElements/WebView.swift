//
//  WebView.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlContent: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.contentMode = .scaleAspectFill
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
            let responsiveHTML = """
            <html>
            <head>
            <style>
            body {
                font-size: 25px;
            }
            img {
                width: 100%;
                height: auto;
                display: block;
                margin: 0 auto;
            }
            </style>
            </head>
            <body>\(htmlContent)</body>
            </html>
            """
            webView.loadHTMLString(responsiveHTML, baseURL: nil)
        }
}
