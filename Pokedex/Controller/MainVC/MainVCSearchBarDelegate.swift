//
//  MainVCSearchBarDelegate.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit

extension MainVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemons = pokemons.filter({ $0._name.range(of: lower) != nil })
            collection.reloadData()
        }
    }

}
