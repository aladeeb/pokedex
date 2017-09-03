//
//  Evolution.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/3/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation
import ObjectMapper

class Evolution : Mappable {
    private var level: Int!
    private var to: String!
    private var resourceUri: String!
    
    var _level: Int {
        get {
            if level == nil {
                return 0
            }
            return level
        } set {
            level = newValue
        }
    }
    
    var _to: String {
        get {
            if to == nil {
                return ""
            }
            return to
        } set {
            to = newValue
        }
    }
    
    private var _resourceUri: String {
        get {
            if resourceUri == nil {
                return ""
            }
            return resourceUri
        } set {
            resourceUri = newValue
        }
    }
    
    var _nextEvolutionId: String {
        let str1 = resourceUri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
        let str2 = str1.replacingOccurrences(of: "/", with: "")
        return str2
    }
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        _level <- map["level"]
        _to <- map["to"]
        _resourceUri <- map["resource_uri"]
    }
}
