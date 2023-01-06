//
//  WeatherInformation.swift
//  Diary
//
//  Created by SummerCat and som on 2023/01/06.
//

import Foundation

struct WeatherInformation: Decodable {
    let weather: Weather
}

struct Weather: Decodable {
    let main: String
    let icon: String
}
