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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// ağ isteğini gerçekleştirme
    /// - Parameters:
    ///   - request: istek örneği
    ///   - type: geri dönmesini beklediğimiz nesne türü
    ///   - completion: veri veya hata içeren geri çağrı
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type ,
        completion: @escaping (Result<T, Error>) -> Void)
    {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            //Decode response
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                
            }
            catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    //MARK: private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
