//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/29/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class Pokemon : Mappable {
    private var name: String!
    private var id: Int!
    private var description: String!
    private var defense: Int!
    private var height: String!
    private var weight: String!
    private var attack: Int!
    private var nextEvoluation: Dictionary<String, Any>!
    private var pokemonURL: String!
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

    var _nextEvoluationText: String {
        if nextEvoluation == nil {
            return "No Evoluation Level"
        }
        
        if let name = nextEvoluation["to"] {
            if let level = nextEvoluation["level"] {
                return "Next Evoluation: \(name) LVL:\(level)"
            } else {
                return "Next Evoluation: \(name)"
            }
        } else {
            return ""
        }
    }

    var _nextEvoluationId: String {
        if nextEvoluation == nil {
            return ""
        }
        let string = nextEvoluation["resource_uri"]! as! String
        let newString = string.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
        let id = newString.replacingOccurrences(of: "/", with: "")
        return id
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
        self.pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.id!)/"
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
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(pokemonURL).responseJSON { response in
            let result = response.result
            switch result {
            case .success(let value):
                var json = JSON(value)
                
                self.mapping(map: Map(mappingType: .fromJSON, JSON: json.dictionaryObject!))
                print(self._type)
                break
                
            case .failure(let error) :
                print(error.localizedDescription)
                break
            }
            completed()
        }
    }
    
}
