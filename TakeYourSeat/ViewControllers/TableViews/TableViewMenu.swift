//
//  TableViewMenu.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 29/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

var carta = Carta(platos: [])
var precioTotal:Int = 0
var comptador = Int()
var pedidoPlatos: [String] = []


class TableViewMenu : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBAction func Pedido(_ sender: UIButton) {
        NotificationCenter.default.addObserver(self, selector: #selector(TableViewMenu.updatePedido), name: Notification.Name(rawValue: "NombrePlatos"), object: comptador)
        if (pedidoPlatos.isEmpty){
            let alert = UIAlertController(title: "No has pedido nada!", message: "Recuerda añadir todas las unidades que desees de los platos que te apetezcan!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }        
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalAPagar: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carta = postDataRef[restauranteGuardado].menu
        let numPlatos:Int = carta.platos.count 
        return numPlatos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.allowsSelection = false
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MenuCell
        let precio = carta.platos[indexPath.row].precio
        let strPrecio = "\(precio) €"
        myCell.nombrePlato.text = carta.platos[indexPath.row].nombre
        myCell.imgPlato.image = carta.platos[indexPath.row].imagen
        myCell.precioPlato.text = strPrecio
        comptador = indexPath.row
        
        myCell.nombrePlato.tag = indexPath.row
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        precioTotal = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(TableViewMenu.updateText), name: Notification.Name(rawValue: "precioTotal"), object: nil)
    }
    
    @objc func updateText(){
        totalAPagar.text = "Precio total: \(precioTotal)€"
    }
    
    @objc func updatePedido(){
        let platiku = carta.platos[comptador].nombre
        pedidoPlatos.append(platiku)
        print(pedidoPlatos)
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "Number"), object: comptador, userInfo: nil)
    }
}
