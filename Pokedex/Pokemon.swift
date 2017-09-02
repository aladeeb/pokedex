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
    private var _name: String!
    private var _id: Int!
    private var _descObj: Dictionary<String, String>!
    private var _description: String!
    private var _types: [Dictionary<String, String>]!
    private var _defense: Int!
    private var _height: String!
    private var _weight: String!
    private var _attack: Int!
    private var _nextEvoluation: Dictionary<String, Any>!
    private var _pokemonURL: String!

    var name: String {
        return _name.capitalized
    }
    
    var type: String {
        if _types.count == 0 || _types == nil {
            return ""
        } else {
            var string = ""
            for x in 0..<_types.count {
                string += _types[x]["name"]!.capitalized
                if x != _types.count - 1 {
                    string += "/"
                }
            }
            return string
        }
    }

    var id: Int {
        return _id
    }
    
    var description: String {
        if _description == nil {
            return ""
        }
        return _description
    }
    
    var attack: String {
        if _attack == nil {
            return ""
        }
        return String(_attack)
    }
    
    var defense: String {
        if _defense == nil {
            return ""
        }
        return String(_defense)
    }
    
    var height : String {
        if _height == nil {
            return ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            return ""
        }
        return _weight
    }

    var nextEvoluationText: String {
        if _nextEvoluation == nil {
            return "No Evoluation Level"
        }
        
        if let name = _nextEvoluation["to"] {
            if let level = _nextEvoluation["level"] {
                return "Next Evoluation: \(name) LVL:\(level)"
            } else {
                return "Next Evoluation: \(name)"
            }
        } else {
            return ""
        }
    }

    var nextEvoluationId: String {
        if _nextEvoluation == nil {
            return ""
        }
        let string = _nextEvoluation["resource_uri"]! as! String
        let newString = string.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
        let id = newString.replacingOccurrences(of: "/", with: "")
        return id
    }
    
    init(name: String, id: Int) {
        self._id = id
        self._name = name
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._id!)/"
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _attack <- map["attack"]
        _defense <- map["defense"]
        _height <- map["height"]
        _weight <- map["weight"]
        _types <- map["types"]
        _nextEvoluation <- map["evolutions.0"]
        _descObj <- map["descriptions.0"]
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { response in
            let result = response.result
            switch result {
            case .success(let value):
                let json = JSON(value)
                self.mapping(map: Map(mappingType: .fromJSON, JSON: json.dictionaryObject!))
                Alamofire.request("\(URL_BASE)\(self._descObj["resource_uri"]!)").responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        self._description = json["description"].string!
                    case .failure(let error):
                        print(error)
                    }
                    completed()
                })

                break
                
            case .failure(let error) :
                print(error.localizedDescription)
                break
            }
            completed()
        }
    }
    
}
