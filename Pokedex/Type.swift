//
//  Types.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation
import ObjectMapper

class Type : Mappable {
    private var name : String!
    private var resourceUri : String!
    
    var _name : String {
        get {
            if name == nil {
                name = ""
            }
            return name
        } set {
            name = newValue
        }
    }
    
    var _resourceUri : String {
        get {
            if resourceUri == nil {
                resourceUri = ""
            }
            return resourceUri
        } set {
            resourceUri = newValue
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _name <- map["name"]
        _resourceUri <- map["resource_uri"]
    }
    
}
