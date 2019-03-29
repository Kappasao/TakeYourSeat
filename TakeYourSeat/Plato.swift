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
    var imagen = UIImage()
    
    init(nombre:String, procedencia:String, imagen:UIImage) {
        self.nombre = nombre
        self.procedencia = procedencia
        self.imagen = imagen
    }
    
}
