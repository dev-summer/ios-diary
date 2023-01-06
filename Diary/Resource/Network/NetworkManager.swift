//
//  NetworkManager.swift
//  Diary
//
//  Created by SummerCat and som on 2023/01/06.
//

import Foundation

struct NetworkManager {
    public static let publicNetworkManager = NetworkManager()
    
    func getJSONData<T: Codable>(endpoint: WeatherEndpoint,
                                 type: T.Type,
                                 completion: @escaping (Result<T, NetworkError>) -> Void) {
        HTTPManager().requestGet(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                guard let data: T = JSONConverter().decodeData(data: data) else {
                    completion(.failure(.missingData))
                    return
                }
                completion(.success(data))
            case .failure(_):
                return
            }
        }
    }
}
