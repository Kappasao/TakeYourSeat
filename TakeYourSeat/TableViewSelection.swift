//
//  Test1.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 01/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

//TODO: Cambiar y convertir esta clase para que soporte un tableview dependiendo de la opcion que el usuario haya escogido


class tableViewSelection: UIViewController{
    
    @IBOutlet weak var testText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Decimos que el texto es depende del boton presionado
        testText.text = opciones[selectedOption]
    }
    
}
