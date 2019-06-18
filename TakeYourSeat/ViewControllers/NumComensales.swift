//
//  NumComensales.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 17/05/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

import Foundation
import UIKit

var numCom:Int = 0

class NumComensales: UIViewController {
    
    
    @IBOutlet weak var numComensales: UITextField!
    
    
    @IBAction func comprobar(_ sender: Any) {
        if numComensales.text == "" {
            let alert = UIAlertController(title: "Campo vacío", message: "Porfavor, indica el número de personas que van a comer en el restaurante.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else{
            if ((numComensales.text?.isNumber)!){
                numCom = Int(numComensales.text!)!
            } else{
                let alert = UIAlertController(title: "Campo numérico", message: "Tiene que indicar un número en este campo.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numComensales.placeholder = "Número de clientes"
    }
    
}

