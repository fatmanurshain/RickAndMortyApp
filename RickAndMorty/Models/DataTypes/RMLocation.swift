//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 20.10.2024.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
