//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/29/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

class Pokemon : Mappable {
    
    private var id: Int!
    private var name: String!
    private var description: String!
    private var defense: Int!
    private var height: String!
    private var weight: String!
    private var attack: Int!
    private var types : [Type]!
    private var type : String!

    var _name: String {
        get {
            return name.capitalized
        } set {
            name = newValue
        }
    }
    
    var _id: Int {
        get {
            return id
        } set {
            id = newValue
        }
    }
    
    var _description: String {
        get {
            if description == nil {
                return ""
            }
            return description
        } set {
            description = newValue
        }
    }
    
    var _attack: Int {
        get {
            if attack == nil {
                return 0
            }
            return attack
        } set {
            attack = newValue
        }
    }
    
    var _defense: Int {
        get {
            if defense == nil {
                return 0
            }
            return defense
        } set {
            defense = newValue
        }
    }
    
    var _height : String {
        get {
            if height == nil {
                return ""
            }
            return height
        } set {
            height = newValue
        }
    }
    
    var _weight: String {
        get {
            if weight == nil {
                return ""
            }
            return weight
        } set {
            weight = newValue
        }
    }
    
    private var _types : [Type] {
        get {
            return types
        } set {
            types = newValue
        }
    }
    
    var _type : String {
        get {
            var string = ""
            if(_types.count != 0) {
                for t in _types {
                    string += "\(t._name.capitalized)/"
                }
                string.remove(at: string.index(before: string.endIndex))
            }
            return string
        }
    }
    
    init(name: String, id: Int) {
        self.id = id
        self.name = name
        types = [Type]()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _attack <- map["attack"]
        _defense <- map["defense"]
        _height <- map["height"]
        _weight <- map["weight"]
        _types <- map["types"]
    }
    

}
