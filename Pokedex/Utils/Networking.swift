//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Ahmad Ayman on 8/31/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit
import Alamofire

class Networking {
    
    var manager: SessionManager!
    init(requestTimeout : Double) {
        manager = self.getAlamofireManager(timeout: requestTimeout)
    }
    
    func getAlamofireManager(timeout : Double) -> SessionManager  {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = timeout
        configuration.timeoutIntervalForRequest = timeout
        let alamofireManager = Alamofire.SessionManager(configuration: configuration)
        return alamofireManager
    }
}
