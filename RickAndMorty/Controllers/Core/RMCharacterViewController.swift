//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 21.10.2024.
//

import UIKit

/// karakterlerin gösterileceği controller
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
            
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self .self) { result in
            
        }
        
    }

}
