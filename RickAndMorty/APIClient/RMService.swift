//
//  RMService.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 21.10.2024.
//

import Foundation

//API çağrıları yapmaktan sorumlu

///birincil API hizmet nesnesi
final class RMService {
    ///shared singelton örneği
    static let shared = RMService()
    
    ///özelleştirilmiş yapıcı
    private init() {}
    
    /// ağ isteğini gerçekleştirme
    /// - Parameters:
    ///   - request: istek örneği
    ///   - type: geri dönmesini beklediğimiz nesne türü
    ///   - completion: veri veya hata içeren geri çağrı
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type ,
        completion: @escaping (Result<T, Error>
        ) -> Void){
        
    }
}
