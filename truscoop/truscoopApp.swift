//
//  truscoopApp.swift
//  truscoop
//
//  Created by Peter Bidoshi on 11/19/23.
//

import SwiftUI

@main
struct truscoopApp: App {
    
    @StateObject var network = NetworkWrapper()
    
    var body: some Scene {
        WindowGroup {
            ContentView(filter: "all")
                .environmentObject(network)
        }
    }
}
