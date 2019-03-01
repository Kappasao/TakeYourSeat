//
//  ViewController.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 28/02/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import UIKit

//Opcion seleccionada dependiendo del boton al que le damos
var selectedOption = Int()
//Opciones estaticas de momento para recoger si es para comer aqui o no
var opciones = ["Aqui","Para llevar"]

class ViewController: UIViewController {
    //Aqui empezamos
    
    //Guardamos el boton al que le da el usuario
    @IBAction func Option(_ sender: UIButton) {
        if sender.tag == 0{
            selectedOption = 0
        }
        if sender.tag == 1{
            selectedOption = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
