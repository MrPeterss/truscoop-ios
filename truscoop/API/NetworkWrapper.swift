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
        loading = true
        APIFetchHandler.sharedInstance.getAllArticles(
            completion: { [weak self] scoops in
                guard let self = self else { return }
                self.scoops = scoops
                self.filtered = scoops.reversed()
                // Perform UI update on main queue
                DispatchQueue.main.async {
                    self.loading = false
                }
        })
    }
    
    func getVote(scoop_id: String, completion: @escaping (Int) -> Void) -> Void {
        loading = true
        APIFetchHandler.sharedInstance.getVote(scoop_id: scoop_id, completion: completion)
    }
    
    func addVote(scoop_id: String, vote: Float, completion: @escaping (Scoop) -> Void) -> Void {
        loading = true
        APIFetchHandler.sharedInstance.addVote(scoop_id: scoop_id, vote: vote, completion: completion)
    }
    
    func removeVote(scoop_id: String, completion: @escaping (Scoop) -> Void) -> Void {
        loading = true
        APIFetchHandler.sharedInstance.removeVote(scoop_id: scoop_id, completion: completion)
    }

    func addArticle(url: String, completion: @escaping (Scoop?) -> Void) -> Void {
        loading = true
        APIFetchHandler.sharedInstance.addArticle(url: url, completion: completion)
    }
}

