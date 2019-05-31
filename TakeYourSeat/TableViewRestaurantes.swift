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
    var postDataRef = [Restaurante]()
    var databaseHandle: DatabaseHandle?
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return restComerAqui.count
        return postDataRef.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! RestaurantCell
        
        //myCell.restName.text = restComerAqui[indexPath.row].name
        myCell.restName.text = postDataRef[indexPath.row].name
        myCell.restImg.image = postDataRef[indexPath.row].image
        myCell.restLoc.text = postDataRef[indexPath.row].location
        //let URL = URL(postDataRef[indexPath.row])
        //myCell.restImg.image =
        //myCell.restImg.image = restComerAqui[indexPath.row].image
        //myCell.restLoc.text = restComerAqui[indexPath.row].location
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "restDetail") as! RestaurantDetail
        
        vc.img = postDataRef[indexPath.row].image
        vc.nombre = postDataRef[indexPath.row].name
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
        
        ref = Database.database().reference()
        /*databaseHandle = ref.child("restaurants").child("Can Stucom").observe(.childAdded) {
            (snapshot) in
            if let crudOne = snapshot.value as? NSDictionary{
                let name = crudOne["Name"] as! String
                self.postDataRef.append(name)
                print(name)
            }
        }*/

        getDatabaseData()
        self.tableView.reloadData()
       
        /*ref.child("restaurants").child("Can Stucom").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
            
            
                let value = snapshot.value as? NSDictionary
                let name = value?["Name"] as? String ?? ""
                let url = value?["image"] as? String ?? ""
                let location = value?["location"] as? String ?? ""
                //let carta = value?["carta"] as? String ?? ""
                let Url = URL(string: url)
                if let data = try? Data(contentsOf: Url!) {
                    let imagen: UIImage = (UIImage(data: data) ?? nil)!
                    self.postDataRef.append(Restaurante(name: name, image: imagen, location: location))
                }
            
                self.tableView.reloadData()
            }) { (error) in
                print(error.localizedDescription)
        }
        self.tableView.reloadData()
        */
    }
    
    func getDatabaseData(){
        let idRef = self.ref.child("restaurants")
        idRef.observe(DataEventType.value, with: {
            (snapshot) in
                for restaurants in snapshot.children.allObjects as! [DataSnapshot]{
                    let value = restaurants.value as? [String: AnyObject]
                    
                    let name = value?["Name"]
                    let url = value?["image"]
                    let location = value?["location"]
                    let Url = URL(string: url as! String)
                    if let data = try? Data(contentsOf: Url!) {
                        let imagen: UIImage = (UIImage(data: data) ?? nil)!
                        //self.postDataRef.append(Restaurante(name: name!, image: imagen, location: location!))
                        self.postDataRef.append(Restaurante(name: name as! String, image: imagen, location: location as! String))
                    }
                    //let imagen = UIImage(named: "100")
                    //self.postDataRef.append(Restaurante(name: name as! String, image: imagen!, location: location as! String))
                    
                }
            self.tableView.reloadData()
        })
        
    }
    
    
}
