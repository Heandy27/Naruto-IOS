//
//  NetworkModel.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 18/9/24.
//

import Foundation

// Aquí creamos solamente la ruta: https://narutodb.xyz
final class NetworkModel {
    //Creamos el singleton para que solo una vez se instancia la clase
    static let shared = NetworkModel()
    // Variable computada que retorna un URLComponents
    // https://narutodb.xyz
    private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "narutodb.xyz"
        return components
    }
    
    private let client: APIClientProtocol
    // Se le hace privado para que no haya mas de una clase instanciada
    private init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func getAllCharacters(completion: @escaping (Result<NarutoCharacter, WesterosError> ) -> Void) {
        // Vamos a crear nuestra URLRequest
        // la cual unimos todas las urls creadas: https://narutodb.xyz/api/character
        var components = baseComponents
        components.path = "/api/character"
        // Creamos un objeto url: https://narutodb.xyz/api/character
        guard let url = components.url else {
            return
        }
       
        // Utilizamos el metodo de solicitación de GET para traer los datos
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        client.requestCharacters(urlRequest, completion)
        
       
    }
}
