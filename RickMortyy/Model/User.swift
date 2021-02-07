//
//  User.swift
//  RickMortyy
//
//  Created by Onur Başdaş on 6.02.2021.
//

import Foundation

struct Root : Codable {
    let results : [Result]
}

struct Result : Codable {
    let name : String
    let status : String
    let gender : String
    let image : String
    let species : String
}


