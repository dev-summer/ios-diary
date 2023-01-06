//
//  JSONConverter.swift
//  Diary
//
//  Created by 정선아 on 2023/01/06.
//

import Foundation

final class JSONConverter {
    func decodeData<T: Codable>(data: Data) -> T? {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch DecodingError.dataCorrupted(let context) {
            print(context.codingPath, context.debugDescription, context.underlyingError ?? "", separator: "\n")
            return nil
        } catch {
            return nil
        }
    }
}
