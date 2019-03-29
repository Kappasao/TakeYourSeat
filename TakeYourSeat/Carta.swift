//
//  Menu.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 29/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//
import Foundation
import UIKit

//vamos a declarar un menú global y un par de platos también globales para ir maquetando la aplicación con datos estáticos.
var bolo:Plato = Plato(nombre: "Espaguetis bolo", procedencia: "Italia", imagen: UIImage(named: "bolo")!)
var pesto:Plato = Plato(nombre: "Espaguetis pesto", procedencia: "Italia", imagen: UIImage(named: "pesto")!)
var queso:Plato = Plato(nombre: "Espaguetis con queso", procedencia: "Italia", imagen: UIImage(named: "queso")!)




class Carta {
    var platos :[Plato] = []
    
    init(platos : [Plato]) {
        self.platos = platos
    }
    
}

