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

    func getAllArticles(completion:
                        @escaping ([Scoop]) -> Void) {
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        
        //        let url = "http://35.236.220.70/api/articles/";
        let url = "http://127.0.0.1:8000/api/articles/"
        
        AF.request(url, method: .get)
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

        //        let url = "http://35.236.220.70/api/articles/rating/";
        let url = "http://127.0.0.1:8000/api/articles/rating/\(scoop_id)/?user_id=\(user_id)"
        
        AF.request(url, method: .get)
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
        
//        let url = "http://35.236.220.70/api/articles/rating/\(scoop_id)";
        let url = "http://localhost:8000/api/articles/rating/\(scoop_id)?user_id=\(user_id)&rating=\(vote)"
                
        // 4. Create a decoder
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // 5. Create the request
        AF.request(url, method: .post)
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
    
    func removeVote(scoop_id: String, completion: @escaping (SucessResponse) -> Void) {
        
        let user_id = UIDevice.current.identifierForVendor!.uuidString
        
        //        let url = "http://35.236.220.70/api/articles/rating/\(scoop_id)";
        let url = "http://localhost:8000/api/articles/rating/\(scoop_id)?user_id=\(user_id)"
        
        // 4. Create a decoder
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // 5. Create the request
        AF.request(url, method: .delete)
            .validate()
            .responseDecodable(of: SucessResponse.self, decoder: decoder) { response in
                
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
    
    
//    func getAllArticles() {
//        decoder.dateDecodingStrategy = .iso8601 // Only if needed
//        decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
//        
////        let url = "http://35.236.220.70/api/articles/";
//        let url = "http://127.0.0.1:8000/api/articles/"
//       
//        AF.request(url, method: .get)
//            .validate()
//            .response{ resp in
//                print(resp)
//                switch resp.result{
//                    case .success(let data):
//                        do{
////                            print(data!)
////                            let article_list = try JSON(data: data!)["articles"].rawString()
////                            print(article_list!)
////                            let article_data = article_list?.data(using: .utf8)
////                            print(article_data!)
////                            let jsonData = try JSONDecoder().decode([Scoop].self, from: article_data!)
//                            print("HELLO WORLD")
//                            let article_list = try JSON(data: data!).rawString()
//                            print(article_list!)
////                            let jsonData = try self.decoder.decode([FailableDecodable<Scoop>].self, from: data!)
////                                .compactMap { $0.base }
//                            let jsonData = try self.decoder.decode([Scoop].self, from: data!)
//                            print(jsonData)
//                        } catch {
////                            print(error.localizedDescription)
//                            print(error)
//                        }
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//        }
//   }
}
