//
//  PokeDetailsView.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit

class PokeDetailsView: UIView {
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeDesc: UILabel!
    @IBOutlet weak var pokeType: UILabel!
    @IBOutlet weak var pokeDefense: UILabel!
    @IBOutlet weak var pokeHeight: UILabel!
    @IBOutlet weak var pokeID: UILabel!
    @IBOutlet weak var pokeWeight: UILabel!
    @IBOutlet weak var pokeBaseAttack: UILabel!
    @IBOutlet weak var pokeCurrentEvoImage: UIImageView!
    @IBOutlet weak var pokeNextEvoImage: UIImageView!
    @IBOutlet weak var nextEvoText: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureView(_ poke : Pokemon) {
        nameLabel.text = poke._name
        pokeImage.image = UIImage(named : "\(poke._id)")
        pokeType.text = poke._type
        pokeDefense.text = String(poke._defense)
        pokeHeight.text = poke._height
        pokeID.text = String(poke._id)
        pokeWeight.text = poke._weight
        pokeBaseAttack.text = String(poke._attack)
        pokeDesc.text = poke._description
        nextEvoText.text = "Next Evolution: \(poke._evolution._to) - LVL: \(poke._evolution._level)"
        pokeCurrentEvoImage.image = UIImage(named : "\(poke._id)")
        pokeNextEvoImage.image = UIImage(named: "\(poke._evolution._nextEvolutionId)")
    }
}
