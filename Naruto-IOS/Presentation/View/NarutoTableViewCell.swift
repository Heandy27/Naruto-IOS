//
//  NarutoTableViewCell.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 13/9/24.
//

import UIKit

final class NarutoTableViewCell: UITableViewCell {
    // MARK: Identifier
    // Aquí creamos el identificador que es igual a: "NarutoTableViewCell"
    static let identifier = String(describing: NarutoTableViewCell.self)
    
    // MARK: - Outlets
    @IBOutlet weak var narutoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    // MARK: - Configuration
    func configure(with clan: Clan) {
        titleLabel.text = clan.rawValue
        // Desempaquetamos la url por que en el extension es opcional
        // El imageURL viene de el archivo Clan.swift
        guard let imageURL = clan.imageURL else {
            return
        }
        
        // el metodo setImageView viene del archivo UIImageViewRemote el que creamos para colocar la url
        
        narutoImageView.setImageView(url: imageURL)
        descriptionLabel.text = "Ejemplo del todo el ,mundo asdqweujksafd lkdsflksd"
    }
    
    
}
