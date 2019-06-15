//
//  RequestMaker.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

enum RequestMakerError: Error {
    case malformedURL
    case requestFailed
    case invalidData
    case decodingFailed
}

class RequestMaker {
    
    static let decoder = JSONDecoder()
    
    let baseUrl = "http://localhost:3000/"
    let session =  URLSession.shared
    typealias RequestResult<T> = Result<T, RequestMakerError>
    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
    typealias SuccessCallback<T: Decodable> = (T) -> Void
    
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
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping SuccessCallback<T>) {
        make(withEndpoint: endpoint) { (result: RequestResult<T>) in
            switch result {
            case .success(let object):
                completion(object)
            case .failure:
                break
            }
        }
    }
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint, completion: @escaping CompletionCallback<T>) {
        guard let url = URL(string: "\(baseUrl)\(endpoint.url)") else {
            completion(.failure(.malformedURL))
            return
        }
        // Completion handler anonymous funcion sintaxe melhor
        // Create async task
        let dataTask = session.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                print(error!)
                completion(.failure(.requestFailed))
                return
            }
            // Guard é if ao contrario
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            // Decode data into struct model
            do {
                print(data)
                let decodedObject = try RequestMaker.decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            }
            catch let error {
                completion(.failure(.decodingFailed))
                print(error)
            }
            
        }
        // Execute the async task
        dataTask.resume()
    }
}
