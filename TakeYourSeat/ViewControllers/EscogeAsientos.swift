//
//  EscogeAsientos.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 17/06/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

class EscogeAsientos: UIViewController{
    
    @IBOutlet weak var numeroClientes: UILabel!
    
    override func viewDidLoad() {
        let clientes = String(numCom)
        numeroClientes.text = "Numero de clientes: \(clientes)"
    }
    
}
