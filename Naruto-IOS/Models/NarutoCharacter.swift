//
//  NarutoCharacter.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 18/9/24.
//

import Foundation

struct NarutoCharacter: Codable {
    let characters: [Characters]
  
}

struct Characters: Codable {
    let name: String
}
