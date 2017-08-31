//
//  PokeCell.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/31/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 6.0
    }
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        thumbImage.image = UIImage(named: "\(self.pokemon.id)")
        nameLabel.text = self.pokemon.name.capitalized
    }
    
}
