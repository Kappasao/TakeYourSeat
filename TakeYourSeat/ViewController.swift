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
var restComerAqui:[Restaurant] = [Restaurant(name: "Comer aqui 1", image: UIImage(named: "rest1")!, location: "C/ sepulveda 65"),
                                  Restaurant(name: "Comer aqui 2", image: UIImage(named: "rest2")!, location: "C/ comte borrell 37"),
                                  Restaurant(name: "Comer aqui 3", image: UIImage(named: "rest3")!, location: "C/ muntaner 1")
]
var restLlevar:[Restaurant] = [Restaurant(name: "Llevar 1", image: UIImage(named: "rest4")!, location: "C/ urgell 201"),
                                  Restaurant(name: "Llevar 2", image: UIImage(named: "rest5")!, location: "C/ pelai 81"),
                                  Restaurant(name: "Llevar 3", image: UIImage(named: "rest6")!, location: "C/ còrsega 109")
]


class ViewController: UIViewController {
    //Aqui empezamos
    
    //Guardamos el boton al que le da el usuario
    @IBAction func Option(_ sender: UIButton) {
        /*if sender.tag == 0{
            selectedOption = 0
        }
        if sender.tag == 1{
            selectedOption = 1
        }*/
        selectedOption = sender.tag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
