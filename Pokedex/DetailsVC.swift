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
        
        let img = UIImage(named: String(pokemon._id))
        mainImage.image = img
        currentEvoluationImage.image = img
        nameLabel.text = pokemon._name
        idLabel.text = String(pokemon._id)
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
    }
    
    func updateUI() {
        descLabel.text = pokemon._description
        typeLabel.text = pokemon._type
        baseAttackLabel.text = String(pokemon._attack)
        defenseLabel.text = String(pokemon._defense)
        heightLabel.text = pokemon._height
        weightLabel.text = pokemon._weight
        nextEvoluationLabel.text = pokemon._nextEvoluationText
        nextEvoluationImage.image = UIImage(named: pokemon._nextEvoluationId)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
