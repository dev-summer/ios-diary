//
//  HTTPManager.swift
//  Diary
//
//  Created by SummerCat and som on 2023/01/06.
//

import Foundation

final class HTTPManager {
    static let shared = HTTPManager()
    
    func requestToServer(with urlRequest: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let data = data else {
                completion(.failure(.clientError))
                return
            }
            
            guard let response = urlResponse as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                if let response = urlResponse as? HTTPURLResponse {
                    print(response.statusCode)
                }
                return
            }
            
            guard error == nil else {
                completion(.failure(.serverError))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
    
    func requestGet(url: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let validURL = URL(string: url) else {
            completion(.failure(.clientError))
            return
        }
        
        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = HTTPMethod.get
        
        requestToServer(with: urlRequest, completion: completion)
    }
}
