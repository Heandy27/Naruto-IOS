//
//  UIImageViewRemote.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 13/9/24.
//

import UIKit


// MARK: - ImageView new logic
// Extendemos la logica de UIImageView

extension UIImageView {
    
    
    func setImageView(url: URL) {
        // Capturamos self para no crear dependencias circulares
        downloadWithURLSession(url: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    
    // Este metodo obtiene una imagen a partir de una URL
    // Utiliza URLSession para ello
    private func downloadWithURLSession(
        url: URL,
        completion: @escaping(UIImage?) -> Void
    ) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            // Guards en la misma linea entonces la primera condicion es data y si data no es nil sigue con image.
            // image es un tipo UIImage por que es una extension de UIImageView
            guard let data, let image = UIImage(data: data) else {
                // Si hubo un error en el data con la image entonces el completion dice que sea nulo
                completion(nil)
                return
            }
            print(completion(image))
            // Entonces como ya sabemos que no es nula la pasamos al completion la imagen
            completion(image)
        }
        // Aquí ya solo decimos empezar
        .resume()
    }
}
