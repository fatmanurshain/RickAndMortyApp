//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 21.10.2024.
//

import UIKit

final class CharacterListView: UIView {
    
    private let viewModel = CharacterListViewViewModel()
    
    //yükleme göstergesi
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0 //opacity
        collectionView.translatesAutoresizingMaskIntoConstraints = false /// Auto Layout ile kullanılmak üzere view'in otomatik kısıtlamalara çevrilmemesini sağlar
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
        
    }()
    
    //init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(spinner)
        addSubview(collectionView)
        
        addConstraints()
        
        spinner.startAnimating()
        viewModel.fetchCharacters()
        
        setupCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //Bu metod, spinner için konumlandırma kısıtlamalarını ayarlar. Spinner, görünümün merkezinde yer alacak şekilde ayarlandı.
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupCollectionView(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.spinner.stopAnimating() // Spinner'ı durdur
            
            self.collectionView.isHidden = false // Collection view'ı görünür hale getir
            
            // Animasyon başlat
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1 // Collection view'ın görünürlüğünü artır
            }
        }

    }
}
