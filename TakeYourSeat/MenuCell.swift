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
    var number = Int()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func añadirUnidad(_ sender: UIButton) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.counter), name: Notification.Name(rawValue: "Number"), object: nil)
        //No añade bien el nombre
        carta = restComerAqui[restauranteGuardado].menu
        let plato = carta.platos[number].nombre
        let preu = carta.platos[number].precio
        let num = Int(numUnidades.text!)
        numUnidades.text = String(num! + 1)
        precioTotal = precioTotal + preu
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "precioTotal") , object: nil, userInfo: nil)
        
        pedidoPlatos.append(plato)
        
    }
    
    @IBAction func quitarUnidad(_ sender: UIButton) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.counter), name: Notification.Name(rawValue: "Number"), object: number)
        
        carta = restComerAqui[restauranteGuardado].menu
        let plato = carta.platos[number].nombre
        let preu = carta.platos[number].precio
        let num = Int(numUnidades.text!)
        if num! >= 1 {
            numUnidades.text = String(num! - 1)
            precioTotal = precioTotal - preu
            NotificationCenter.default.post(name: Notification.Name(rawValue: "precioTotal") , object: nil, userInfo: nil)
            
            
            for i in 0..<pedidoPlatos.count - 1{
                if pedidoPlatos[i] == plato{
                    pedidoPlatos.remove(at: i)
                    break
                }
            }
        }
            //borrar solo 1 de los elementos repetidos
            //pedidoPlatos = pedidoPlatos.filter{$0 != plato}
            
        
            
       
    }
    
    @objc func counter() {
        number = comptador
    }
    
    
    
}
