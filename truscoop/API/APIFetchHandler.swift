//
//  APIFetchHandler.swift
//  truscoop-ios
//
//  Created by Daniel Chuang on 12/1/23.
//

import Foundation
import Alamofire
import SwiftyJSON

struct RatingResponse: Decodable {
    let userRating: Int
    let rating: Float
}

struct SucessResponse: Decodable {
    let success: String
}

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
    
    private let decoder = JSONDecoder()
    
    private let server = "http://35.236.220.70/"
    
    init() {
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getAllArticles(completion:
                        @escaping ([Scoop]) -> Void) {
        
        //        let endpoint = "http://35.236.220.70/api/articles/";
        let endpoint = "\(server)api/articles/"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Scoop].self, decoder: decoder) {
                response in
                // Handle the response
                switch response.result {
                case .success(let articles):
                    //                    let articles_base = articles.compactMap { $0.base }
                    print("Successfully fetched \(articles.count) posts")
                    completion(articles)
                case .failure(let error):
                    print("Error in NetworkManager.fetchPosts: \(error)")
                }
            }
    }
    
    func getVote(scoop_id: String, completion:
                 @escaping (Int) -> Void) {
        
        let user_id = UIDevice.current.identifierForVendor!.uuidString
        
        //        let endpoint = "http://35.236.220.70/api/articles/rating/";
        let endpoint = "\(server)api/articles/rating/\(scoop_id)/?user_id=\(user_id)"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: RatingResponse.self, decoder: decoder) {
                response in
                // Handle the response
                switch response.result {
                case .success(let rating):
                    print(rating.userRating)
                    completion(rating.userRating)
                case .failure(_):
                    print("RATING IS NOT THERE")
                    completion(-1)
                }
            }
    }
    
    func addVote(scoop_id: String, vote: Float, completion: @escaping (Scoop) -> Void) {
        
        let user_id = UIDevice.current.identifierForVendor!.uuidString
        
        let endpoint = "\(server)api/articles/rating/\(scoop_id)?user_id=\(user_id)&rating=\(vote)"
        
        // 5. Create the request
        AF.request(endpoint, method: .post)
            .validate()
            .responseDecodable(of: Scoop.self, decoder: decoder) { response in
                
                print(response)
                // 5. Handle the response
                switch response.result {
                case .success(let scoop):
                    completion(scoop)
                case .failure(let error):
                    print("Error in NetworkManager.addLike: \(error)")
                }
            }
    }
    
    func removeVote(scoop_id: String, completion: @escaping (Scoop) -> Void) {
        
        let user_id = UIDevice.current.identifierForVendor!.uuidString
        
        //        let endpoint = "http://35.236.220.70/api/articles/rating/\(scoop_id)";
        let endpoint = "\(server)api/articles/rating/\(scoop_id)?user_id=\(user_id)"
        
        // 5. Create the request
        AF.request(endpoint, method: .delete)
            .validate()
            .responseDecodable(of: Scoop.self, decoder: decoder) { response in
                
                print(response)
                // 5. Handle the response
                switch response.result {
                case .success(let scoop):
                    completion(scoop)
                case .failure(let error):
                    print("Error in NetworkManager.addLike: \(error)")
                }
            }
    }
    
    func addArticle(url: String, completion: @escaping (Scoop?) -> Void) {
                
        let endpoint = "\(server)api/articles/?url=\(url)"
        //https://www.nytimes.com/2023/12/01/us/politics/santos-house-republicans-expulsion.html
        // 5. Create the request
        AF.request(endpoint, method: .post)
            .validate()
            .responseDecodable(of: Scoop.self, decoder: decoder) { response in
                
                print(response)
                // 5. Handle the response
                switch response.result {
                case .success(let scoop):
                    completion(scoop)
                case .failure(let error):
                    print("Error in NetworkManager.addLike: \(error)")
                    completion(nil)
                }
            }
    }
}
