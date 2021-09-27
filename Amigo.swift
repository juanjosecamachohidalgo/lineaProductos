//
//  Amigo.swift
//  secondApp
//
//  Created by Aula11 on 22/10/18.
//  Copyright © 2018 Juan José Camacho Hidalgo. All rights reserved.
//

import UIKit
class Amigo{

    //MARK: atributos
    
    var nombre: String
    var foto: UIImage?
    var gradoAfinidad: Int
    
    //MARK: Inicialización
    
    init?(nombre: String, foto: UIImage?, gAfinidad: Int){
        if nombre.isEmpty || gAfinidad < 0 {
            return nil
        }
        self.nombre = nombre
        self.foto = foto
        self.gradoAfinidad = gAfinidad
    }
}
