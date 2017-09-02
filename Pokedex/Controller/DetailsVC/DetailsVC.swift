//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/31/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    var pokemon: Pokemon!
    var pokemonBackEndManager : BackEndManager!
    @IBOutlet var pokeDetailsView: PokeDetailsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonBackEndManager = BackEndManager()
        pokemonBackEndManager.delegate = self
        pokemonBackEndManager.downloadPokemonDetails(pokemon)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
