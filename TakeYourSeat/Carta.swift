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
var bolo:Plato = Plato(nombre: "Espaguetis bolo", procedencia: "Italia", precio: 10, imagen: UIImage(named: "bolo")!)
var pesto:Plato = Plato(nombre: "Espaguetis pesto", procedencia: "Italia", precio: 10, imagen: UIImage(named: "pesto")!)
var queso:Plato = Plato(nombre: "Espaguetis con queso", procedencia: "Italia", precio: 10, imagen: UIImage(named: "queso")!)
var queso1:Plato = Plato(nombre: "Espaguetis con queso", procedencia: "Italia", precio: 10, imagen: UIImage(named: "queso")!)
var queso2:Plato = Plato(nombre: "Espaguetis con queso", procedencia: "Italia", precio: 10, imagen: UIImage(named: "queso")!)


var burger:Plato = Plato(nombre: "Burger", procedencia: "USA", precio: 10, imagen: UIImage(named: "burger")!)
var fries:Plato = Plato(nombre: "Patatas fritas", procedencia: "Francia", precio: 10, imagen: UIImage(named: "fries")!)
var frankfurt:Plato = Plato(nombre: "Hot dog", procedencia: "Alemania", precio: 10, imagen: UIImage(named: "frankfurt")!)


class Carta {
    var platos :[Plato] = []
    
    init(platos : [Plato]) {
        self.platos = platos
    }
    
}
