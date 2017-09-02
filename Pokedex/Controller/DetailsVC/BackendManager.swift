//
//  BackendManager.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class BackEndManager {
    
    private var network : Networking!
    weak var delegate : PokemonDownloadDelegate?
    
    init() {
        network = Networking(requestTimeout: 10)
    }
    
    func downloadPokemonDetails(_ poke : Pokemon) {
        let pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(poke._id)/"
        network.manager.request(pokemonURL).responseJSON { response in
            let result = response.result
            switch result {
            case .success(let value):
                let json = JSON(value)
                poke.mapping(map: Map(mappingType: .fromJSON, JSON: json.dictionaryObject!))
                let descURL = URL(string : "\(URL_BASE)\(json["descriptions"][0]["resource_uri"].string!)")!
                self.network.manager.request(descURL).responseJSON { response in
                    let result = response.result
                    switch result {
                    case .success(let value) :
                        let json = JSON(value)
                        poke._description = json["description"].string!
                        self.delegate?.onDownloadSuccess(poke)
                        break
                    case .failure(let error) :
                        self.delegate?.onDownloadFailure(error as NSError)
                        break
                    }
                }
                break
                
            case .failure(let error) :
                self.delegate?.onDownloadFailure(error as NSError)
                break
                
            }
        }
    }
}
