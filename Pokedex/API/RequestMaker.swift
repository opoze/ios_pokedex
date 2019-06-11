//
//  RequestMaker.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class RequestMaker {
    
    let baseUrl = "http://localhost:3000/"
    let session =  URLSession.shared
    typealias CompletionCallback<T: Decodable> = (T) -> Void
    
    // Endpoints enum
    enum Endpoint {
        case list
        case details(query: String)
        case move
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            case .move:
                return "moves"
            }
        }
    }
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpoint.url)") else {
            return
        }
        // Completion handler anonymous funcion sintaxe melhor
        // Create async task
        let dataTask = session.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                print(error!)
                return
            }
            // Guard é if ao contrario
            guard let data = data else {
                return
            }
            
            // Decode data into struct model
            do {
                print(data)
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(decodedObject)
            }
            catch let error {
                print(error)
            }
            
        }
        // Execute the async task
        dataTask.resume()
    }
}
