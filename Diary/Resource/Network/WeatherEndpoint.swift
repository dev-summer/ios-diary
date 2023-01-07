//
//  WeatherEndpoint.swift
//  Diary
//
//  Created by SummerCat and som on 2023/01/06.
//

import Foundation

enum WeatherEndpoint {
    case fetchWeatherInformation(latitude: Double, longitude: Double, appid: String = "b87014a68c343a8a60a32e16da67aa98")
    case fetchWeatherIconImage(icon: String)
}

extension WeatherEndpoint {
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchWeatherInformation:
            return .get
        case .fetchWeatherIconImage:
            return .get
        }
    }
    
    var baseURL: String {
        return "https://api.openweathermap.org"
    }
    
    var path: String {
        switch self {
        case.fetchWeatherInformation:
            return "/data/2.5/weather"
        case .fetchWeatherIconImage(let icon):
            return "/img/wn/\(icon)@2x.png"
        }
    }
    
    var queries: [URLQueryItem] {
        switch self {
        case .fetchWeatherInformation(let latitude, let longitude, let appid):
            var queryParameters: [URLQueryItem] = []
            queryParameters.append(URLQueryItem(name: "lat", value: "\(latitude)"))
            queryParameters.append(URLQueryItem(name: "lon", value: "\(longitude)"))
            queryParameters.append(URLQueryItem(name: "appid", value: "\(appid)"))
            return queryParameters
        default:
            return []
        }
    }
    
    func createURLRequest() -> URLRequest? {
        var components = URLComponents(string: self.baseURL)
        components?.path = path
        components?.queryItems = self.queries
        
        var request = components?.url.flatMap { URLRequest(url: $0) }
        request?.httpMethod = httpMethod.rawValue
        
        return request
    }
}
