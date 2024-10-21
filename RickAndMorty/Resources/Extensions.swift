//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 22.10.2024.
//

import UIKit

extension UIView {
    ///Bu parametre, birden fazla UIView'in geçişine olanak tanır (UIView... ile).
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
