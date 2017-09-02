//
//  DetailsVCPokemonDownloadDelegate.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation

extension DetailsVC : PokemonDownloadDelegate {
    func onDownloadFailure(_ error: NSError) {
        print(error.localizedDescription)
    }
    
    func onDownloadSuccess(_ poke: Pokemon) {
        pokemon = poke
        pokeDetailsView.configureView(pokemon)
    }
}
