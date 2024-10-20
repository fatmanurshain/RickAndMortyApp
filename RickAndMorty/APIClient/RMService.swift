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
    ///shared singelton instance
    static let shared = RMService()
    
    ///özelleştirilmiş yapıcı
    private init() {}
    
    /// ağ isteğini gerçekleştirme
    /// - Parameters:
    ///   - request: istek örneği
    ///   - completion: veri veya hata içeren geri çağrı
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
}
