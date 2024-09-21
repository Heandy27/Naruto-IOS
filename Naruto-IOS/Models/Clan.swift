//
//  Clan.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 13/9/24.
//

import Foundation


enum Clan: String, CaseIterable {
    case uzumaki = "Naruto Uzumaki"
    case uchiha = "Itachi Uchiha"
    case senju = "Hashirama Senju"
}

// Extendemos la logica del enum osea "Clan", hacemos una variable computada para que retorne una URL

extension Clan {
    var imageURL: URL? {
        switch self {
        case .senju:
            URL(string: "https://static.wikia.nocookie.net/naruto/images/7/7e/Hashirama_Senju.png")
        case .uzumaki:
            URL(string: "https://static.wikia.nocookie.net/naruto/images/7/7d/Naruto_Part_II.png")
        case .uchiha:
            URL(string: "https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png")
        }
    }
}

