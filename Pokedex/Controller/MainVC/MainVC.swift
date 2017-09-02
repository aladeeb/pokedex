//
//  ViewController.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/29/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemons = [Pokemon]()
    var filteredPokemons = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonFromCSV()
        //initAudio()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        playMusic(sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsVC" {
            if let detailsVC = segue.destination as? DetailsVC {
                if let poke = sender as? Pokemon {
                    detailsVC.pokemon = poke
                }
            }
        }
    }
    

}

