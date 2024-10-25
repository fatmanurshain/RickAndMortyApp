//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 21.10.2024.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
}

final class RMCharacterListViewViewModel: NSObject{
    
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    
    // Characters model array
    private var characters: [RMCharacter] = [] {
        didSet{
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModel.append(viewModel)
            }
            
        }
    }
    
    private var cellViewModel: [RMCharacterCollectionViewCellViewModel] = []
    
   public func fetchCharacters(){
        RMService.shared.execute( //Bu fonksiyon, bir API isteği oluşturur ve isteği işler.
            .listCharacterRequest,
            expecting: RMGetAllCharactersResponse.self) { // Bu parametre, API isteğinden dönen yanıtın RMGetAllCharactersResponse modeline dönüştürülmesini sağlar.
                [weak self] result in //Weak self, bir nesneye zayıf bir referans oluşturarak, bu nesnenin hafızadan silinmesine izin verir.
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
                
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }

    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else{
            fatalError("Unsupported Cell")
        }
        cell.configure(with: cellViewModel[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        
        return CGSize(
            width: width,
            height: width * 1.5)
    }
}
