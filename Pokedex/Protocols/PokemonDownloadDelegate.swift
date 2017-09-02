//
//  PokemonDownloadDelegate.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 9/2/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation

protocol PokemonDownloadDelegate : class {
    func onDownloadSuccess(_ poke : Pokemon)
    func onDownloadFailure(_ error : NSError)
}
