//
//  Character.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
