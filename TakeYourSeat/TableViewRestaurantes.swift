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

class TableViewRestaurantes : UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    var buscando:Bool = false
    var ref: DatabaseReference!
    var filteredDataRef = [Restaurante]()
    var postDataRef = [Restaurante]()
    var databaseHandle: DatabaseHandle?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buscando ? filteredDataRef.count : postDataRef.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! RestaurantCell
        
        if buscando {
            myCell.restName.text = filteredDataRef[indexPath.row].name
            myCell.restImg.image = filteredDataRef[indexPath.row].image
            myCell.restLoc.text = filteredDataRef[indexPath.row].location
        }
        else{
            myCell.restName.text = postDataRef[indexPath.row].name
            myCell.restImg.image = postDataRef[indexPath.row].image
            myCell.restLoc.text = postDataRef[indexPath.row].location
        }
        
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDataRef = postDataRef.filter({$0.name.lowercased().contains(searchText.lowercased())})
        buscando = searchText != "" ? true : false
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.placeholder = "Buscar restaurantes.."
        ref = Database.database().reference()
        getDatabaseData()
        self.tableView.reloadData()
        
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
                        self.postDataRef.append(Restaurante(name: name as! String, image: imagen, location: location as! String))
                    }
                }
            self.tableView.reloadData()
        })
        
    }
    
    
}
