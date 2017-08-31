//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/29/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var _name: String!
    fileprivate var _id: Int!
    
    
    var name: String {
        
        return _name
    }
    
    var id: Int {
        
        return _id
    }
    
    init(name: String, id: Int) {
        self._id = id
        self._name = name
    }
    
}
