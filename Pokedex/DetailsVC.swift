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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var nextEvoluationLabel: UILabel!
    @IBOutlet weak var currentEvoluationImage: UIImageView!
    @IBOutlet weak var nextEvoluationImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: String(pokemon.id))
        mainImage.image = img
        currentEvoluationImage.image = img
        nameLabel.text = pokemon.name
        idLabel.text = String(pokemon.id)
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
    }
    
    func updateUI() {
        descLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        baseAttackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        nextEvoluationLabel.text = pokemon.nextEvoluationText
        nextEvoluationImage.image = UIImage(named: pokemon.nextEvoluationId)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
