//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 21.10.2024.
//

import Foundation

//API çağrıları yapmaktan sorumlu

/// API çağrısını temsil eden nesne
final class RMRequest {
    ///API sabitleri
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
   /// istenilen endpoint
   private let enpoint: RMEndpoint
    
   ///API için yol bileşeni var mı?
   private let pathComponents: Set<String>
   
   ///API için sorgu parametreleri var mı?
   private let queryParameters: [URLQueryItem]
    
   // API isteği için dize biçiminde oluşturulmuş URL
   private var urlString: String {
       var string = Constants.baseURL
       string += "/"
       string += enpoint.rawValue
       
       ///Eğer pathComponents dizisi boş değilse, her bir bileşen URL'ye  "/" ile birlikte eklenir.
       if !pathComponents.isEmpty {
           pathComponents.forEach {
               string += "/\($0)"
           }
       }
       
       if !queryParameters.isEmpty {
           string += "?"
           ///compactMap ile her parametre kontrol edilir ve değeri varsa URL'ye eklenir.
           let argumentString = queryParameters.compactMap({
               guard let value = $0.value else { return nil }
               return "\($0.name)=\(value)"
           }).joined(separator: "&")
           string += argumentString
       }
       
       return string
   }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    // MARK: Public
    
    /// - Parameters:
    ///   - endpoint: hedef endpoint
    ///   - pathComponents: yol bileşenlerinin koleksiyonu
    ///   - queryParameters: sorgu parametrelerinin bir koleksiyonu
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.enpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
