//
//  TableViewRestaurantes.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 22/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

var restauranteGuardado:Int = Int()

class TableViewRestaurantes : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restComerAqui.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! RestaurantCell
        
        myCell.restName.text = restComerAqui[indexPath.row].name
        myCell.restImg.image = restComerAqui[indexPath.row].image
        myCell.restLoc.text = restComerAqui[indexPath.row].location
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "restDetail") as! RestaurantDetail
        
        vc.img = restComerAqui[indexPath.row].image
        vc.nombre = restComerAqui[indexPath.row].name
        restauranteGuardado = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
