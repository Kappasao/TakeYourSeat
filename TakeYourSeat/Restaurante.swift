//
//  Restaurant.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 01/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

class Restaurante {
    
    var name:String = ""
    var image:UIImage = UIImage()
    var location:String = ""
    var menu:Carta = Carta(platos: [Plato(nombre: "", procedencia: "", precio: 0, imagen: UIImage())])
    
    init() {

    }
    
    convenience init(name:String, image:UIImage, location:String, menu:Carta) {
        self.init()
        self.name = name
        self.image = image
        self.location = location
        self.menu = menu
    }
    
    convenience init(name:String, image:UIImage, location:String) {
        self.init()
        self.name = name
        self.image = image
        self.location = location
    }
    
    
    
    
    func getNumPlatos(menu:Carta) -> Int{
        return menu.platos.count
    }
    
}
