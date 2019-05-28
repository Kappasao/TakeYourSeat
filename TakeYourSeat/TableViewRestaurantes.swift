//
//  TableViewRestaurantes.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 22/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

var restauranteGuardado:Int = Int()

class TableViewRestaurantes : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var ref: DatabaseReference!
    var postDataRef = [String]()
    var databaseHandle: DatabaseHandle?
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return restComerAqui.count
        return postDataRef.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! RestaurantCell
        
        //myCell.restName.text = restComerAqui[indexPath.row].name
        myCell.restName.text = postDataRef[indexPath.row]
        //myCell.restImg.image = restComerAqui[indexPath.row].image
        //myCell.restLoc.text = restComerAqui[indexPath.row].location
        
        return myCell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "restDetail") as! RestaurantDetail
        
        vc.img = restComerAqui[indexPath.row].image
        vc.nombre = restComerAqui[indexPath.row].name
        restauranteGuardado = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        databaseHandle = ref.child("restaurants").queryOrderedByKey().observe(.childAdded) {
            (snapshot) in
            if let crudOne = snapshot.value as? [String: String]{
                let name = crudOne["Name"]
                self.postDataRef.append(name!)
            }
        }
        self.tableView.reloadData()
        print(postDataRef)
    }
    
    
}
