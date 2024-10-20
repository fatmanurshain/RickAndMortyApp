//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 21.10.2024.
//

import Foundation

/// unique API EndPoint
/// @frozen, Swift'te enum'ların gelecekte değişmeyeceğini (yani yeni durumlar eklenmeyeceğini) garanti eder. Bu, performans optimizasyonları için kullanılır çünkü derleyici enum'ın durumlarını sabit olarak kabul eder ve buna göre işlem yapar.
@frozen enum RMEndpoint: String{
    /// karakter bilgisini almak için endpoint
    case character
    /// bölüm bilgisini almak için endpoint
    case episode
    /// konum bilgisini almak için endpoint
    case location
}
