//
//  Clan.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 13/9/24.
//

import Foundation


enum Clan: String, CaseIterable {
    case uzumaki = "Uzumaki"
    case uchiha = "Uchiha"
    case senju = "Senju"
}

// Extendemos la logica del enum osea "Clan", hacemos una variable computada para que retorne una URL

extension Clan {
    var imageURL: URL? {
        switch self {
        case .senju:
            URL(string: "https://awoiaf.westeros.org/images/1/19/House_Stark.png")
        case .uzumaki:
            URL(string: "https://awoiaf.westeros.org/images/thumb/1/1e/House_Targaryen.svg/545px-House_Targaryen.svg.png")
        case .uchiha:
            URL(string: "https://awoiaf.westeros.org/images/8/88/House_Lannister.png")
        }
    }
}

