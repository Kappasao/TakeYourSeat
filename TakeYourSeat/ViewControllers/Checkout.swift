//
//  Checkout.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 17/06/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

var online:Bool = false

class Checkout: UIViewController{
    
    
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewDidLoad() {
        if precioTotal > 0{
            let preu = String(precioTotal)
            totalPrice.text = "precio: \(preu)€"
        } else{
            totalPrice.text = "vaya.. parece que no has pedido nada."
        }
    }
    
    
    @IBAction func Proceed(_ sender: UIButton) {
        if sender.tag == 1{
            online = true
        } else{
            online = false
        }
    }
}
