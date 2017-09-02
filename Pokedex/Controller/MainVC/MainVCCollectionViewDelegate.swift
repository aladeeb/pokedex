//
//  MainVCCollectionViewDelegate.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit

extension MainVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pokemon = inSearchMode ? filteredPokemons[indexPath.row] : pokemons[indexPath.row]
        performSegue(withIdentifier: "DetailsVC", sender: pokemon)
        
    }
}
