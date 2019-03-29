//
//  TableViewMenu.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 29/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

var carta:Carta = Carta(platos: [])

class TableViewMenu : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalAPagar: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carta = restComerAqui[restauranteGuardado].menu
        let numPlatos:Int = carta.platos.count 
        return numPlatos
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MenuCell
        let precio = carta.platos[indexPath.row].precio
        let strPrecio = "\(precio) €"
        myCell.nombrePlato.text = carta.platos[indexPath.row].nombre
        myCell.imgPlato.image = carta.platos[indexPath.row].imagen
        myCell.precioPlato.text = String(strPrecio)
        return myCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        totalAPagar.text = "total a pagar: 0€"
    }

}
