//
//  MenuCell.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 29/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import UIKit

var tbm: TableViewMenu = TableViewMenu()

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var imgPlato: UIImageView!
    @IBOutlet weak var nombrePlato: UILabel!
    @IBOutlet weak var numUnidades: UILabel!
    @IBOutlet weak var precioPlato: UILabel!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var remove: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func añadirUnidad(_ sender: UIButton) {
        carta = restComerAqui[restauranteGuardado].menu
        let preu = carta.platos[comptador].precio
        let num = Int(numUnidades.text!)
        numUnidades.text = String(num! + 1)
        precioTotal = precioTotal + preu
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "precioTotal") , object: nil, userInfo: nil)
        
    }
    
    @IBAction func quitarUnidad(_ sender: UIButton) {
        carta = restComerAqui[restauranteGuardado].menu
        let preu = carta.platos[comptador].precio
        let num = Int(numUnidades.text!)
        if num! >= 1 {
            numUnidades.text = String(num! - 1)
            precioTotal = precioTotal - preu
            NotificationCenter.default.post(name: Notification.Name(rawValue: "precioTotal") , object: nil, userInfo: nil)
        }
    }
    
}
