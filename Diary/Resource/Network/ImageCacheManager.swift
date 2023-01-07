//
//  ImageCacheManager.swift
//  Diary
//
//  Created by SummerCat and som on 2023/01/07.
//

import UIKit

final class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
