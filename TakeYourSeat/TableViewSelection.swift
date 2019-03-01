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


class tableViewSelection: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedOption == 0 {
            return restComerAqui.count
        } else{
            return restLlevar.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableViewRestaurant.dequeueReusableCell(withIdentifier: "myCell") as! RestaurantCell
        if selectedOption == 0 {
            myCell.restaurantName.text = restComerAqui[indexPath.row].name
            myCell.restaurantLocation.text = restComerAqui[indexPath.row].location
            myCell.restaurantImage.text = restComerAqui[indexPath.row].image
        } else{
            myCell.restaurantName.text = restLlevar[indexPath.row].name
            myCell.restaurantLocation.text = restLlevar[indexPath.row].location
            myCell.restaurantImage.text = restLlevar[indexPath.row].image
        }
        return myCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    @IBOutlet weak var testText: UILabel!
    @IBOutlet weak var tableViewRestaurant: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Decimos que el texto es depende del boton presionado
        testText.text = opciones[selectedOption]
        tableViewRestaurant.delegate = self
        tableViewRestaurant.dataSource = self
    }
    
}
