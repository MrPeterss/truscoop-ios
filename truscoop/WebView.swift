//
//  SwiftUI.swift
//  truscoop-ios
//
//  Created by Daniel Chuang on 11/28/23.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    var url: URL?
    
    // Create underlying view
    func makeUIView(context: Context) -> WKWebView {
        
        // Allowing javascript in webview
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        
        return WKWebView(
            frame: .zero,
            configuration: config
        )
    }
    
    // Load in the url
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else {
            return
        }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
    
}
