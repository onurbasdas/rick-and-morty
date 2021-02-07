//
//  Parser.swift
//  RickMortyy
//
//  Created by Onur Başdaş on 6.02.2021.
//

import Foundation

struct Parser {
    func parse(comp: @escaping ([Result]) -> ()) {
        let api = URL(string: "https://rickandmortyapi.com/api/character")
        URLSession.shared.dataTask(with: api!) { (data, response, error) in
            if error != nil{
                print("Error")
            }
            do{
                let value = try JSONDecoder().decode(Root.self, from: data!)
                comp(value.results)
            }catch{
                print("Error")
            }
            
            
            
        }.resume()
    }
}

