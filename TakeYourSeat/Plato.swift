//
//  Plato.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 29/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

class Plato{
    
    var nombre = String()
    var procedencia = String()
    var precio = Int()
    var imagen = UIImage()
    
    init(nombre:String, procedencia:String, precio:Int, imagen:UIImage) {
        self.nombre = nombre
        self.procedencia = procedencia
        self.precio = precio
        self.imagen = imagen
    }
    
}
