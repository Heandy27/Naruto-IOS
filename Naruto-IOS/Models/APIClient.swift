//
//  APIClient.swift
//  Naruto-IOS
//
//  Created by Andy Heredia on 18/9/24.
//

import Foundation

// Creamos un manejo de errores con un enum

enum WesterosError: Error {
    case noData
    case decodingFailed
    case statusCode(code: Int?)
    case unknown
}


// Creamos un protocolo

protocol APIClientProtocol {
    var session: URLSession { get }
    func requestCharacters(_ request: URLRequest,_ completion: @escaping (Result<NarutoCharacter, WesterosError>) -> Void)
    
}
// Creamos un estructura con el protocolo creado arriba
struct APIClient: APIClientProtocol {
   
    // cambiar el valor a una constante
    let session: URLSession
    // Inicializar los parametros y colocar como un valor predefinido como .shared
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    func requestCharacters(_ request: URLRequest, _ completion: @escaping (Result<NarutoCharacter, WesterosError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            let result: Result<NarutoCharacter, WesterosError>
            // El defer ejecuta al ultimo del codigo
            defer {
                completion(result)
            }
            
            guard error == nil else {
                result = .failure(.unknown)
                return
            }
            
            
            guard let data else {
                result = .failure(.noData)
                return
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            
            guard statusCode == 200 else {
                result = .failure(.statusCode(code: statusCode))
                return
            }
            
            guard let characters = try? JSONDecoder().decode(NarutoCharacter.self, from: data) else {
                result = .failure(.decodingFailed)
                return
            }
            
            result = .success(characters)
        }
        task.resume()
    }
    
    /* VERSION ANTIGUA
    func requestCharacters(_ request: URLRequest, _ completion: @escaping (NarutoCharacter?, Error?) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            //desempaqueto el error si es igual a nulo el completion handler devolvera un error y nulo
            guard error == nil else {
                completion(nil,error)
                return
            }
            // desempaqueto data y compruebo si obtengo un objeto data, si hay un error entonces solo retornamos
            guard let data else {
                return
            }
            
          
            // Revisamos si el estatus code el 200, 201, 404, 500
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            // Si no obtenemos un status code 200 de la petición al servidor retornamos
            guard statusCode == 200 else {
                return
            }
            // Ahora desempaquetamos characters para ver si hay personajes en caso de que si hay personajes, decodificamos el json.
            // Si no hay nada retornamos
            guard let characters = try? JSONDecoder().decode(NarutoCharacter.self, from: data) else {
                return
            }
            // Despues de pasar todas las pruebas sabemos que tenemos personajes y que no hay errores
            completion(characters, nil)
        }
        // Ejucatar el codigo, si no colocamos este codigo no va a funcinar el codigo de arriba
        task.resume()
    }
    */
    
}
