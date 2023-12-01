//
//  NetworkWrapper.swift
//  truscoop-ios
//
//  Created by Peter Bidoshi on 12/1/23.
//

import SwiftUI

class NetworkWrapper: ObservableObject {
    
    @Published var scoops: [Scoop] = []
    @Published var loading: Bool = false
    @Published var filtered: [Scoop] = []

    func fetchPosts() -> Void {
        print("FETCHING POSTS")
        loading = true
        APIFetchHandler.sharedInstance.getAllArticles(completion: { [weak self] scoops in
            guard let self = self else { return }
            self.scoops = scoops
            print(scoops[0])

            // Perform UI update on main queue
            DispatchQueue.main.async {
                self.loading = false
                
            }
        })
    }
}

