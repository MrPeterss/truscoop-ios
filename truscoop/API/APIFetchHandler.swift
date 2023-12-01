//
//  APIFetchHandler.swift
//  truscoop-ios
//
//  Created by Daniel Chuang on 12/1/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()

    private let decoder = JSONDecoder()

    func getAllArticles() {
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
                    print(articles)
//                    completion(posts)
                case .failure(let error):
                    print("Error in NetworkManager.fetchPosts: \(error)")
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
