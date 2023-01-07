//
//  NetworkManager.swift
//  Diary
//
//  Created by SummerCat and som on 2023/01/06.
//

import UIKit

struct NetworkManager {
    public static let publicNetworkManager = NetworkManager()
    
    func getJSONData<T: Decodable>(endpoint: WeatherEndpoint,
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
    
    func getImageData(endpoint: WeatherEndpoint, completion: @escaping (UIImage) -> ()) {
        let cachedKey = NSString(string: "\(endpoint)")
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            return completion(cachedImage)
        }
        
        HTTPManager().requestGet(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    return
                }
                
                ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                completion(image)
            case .failure(_):
                return
            }
        }
    }
}
