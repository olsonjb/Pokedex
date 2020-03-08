//
//  Service.swift
//  PokedexDraft
//
//  Created by Jacob Olson on 3/7/20.
//  Copyright © 2020 Jacob Olson. All rights reserved.
//

import Foundation

class Service {
    
    let BASE_URL = "https://pokeapi.co/api/v2/pokemon/2/"
    
    static let shared = Service()
    
    func fetchPokemon() {
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch data with error ", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }
            } catch let error {
                print("Failed to create json with error: ", error.localizedDescription)
            }
        }.resume()
    }
}
