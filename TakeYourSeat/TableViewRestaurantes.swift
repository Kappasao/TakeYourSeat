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
import FirebaseAuth
import GoogleSignIn

var restauranteGuardado:Int = Int()
var postDataRef = [Restaurante]()


class TableViewRestaurantes : UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    var buscando:Bool = false
    var ref: DatabaseReference!
    var filteredDataRef = [Restaurante]()
    var platosCarta = Carta(platos: [])
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
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            name = ""
            let vc = storyboard?.instantiateViewController(withIdentifier: "start")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = vc
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
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
        
        if !postDataRef.isEmpty{
            postDataRef.removeAll()
        }
        
        let idRef = self.ref.child("restaurants")
        idRef.observe(DataEventType.value, with: {
            (snapshot) in
                for restaurants in snapshot.children.allObjects as! [DataSnapshot]{
                    let value = restaurants.value as? [String: AnyObject]
                    
                    let name = value?["Name"]
                    let url = value?["image"]
                    let location = value?["location"]
                    let Url = URL(string: url as! String)
                    
                    
                    if value?["Carta"] as? [String: AnyObject] != nil{
                        let carta = value?["Carta"] as! [String: [String: AnyObject]]
                        
                        carta.forEach({ (key, value) in
                            print(value)
                            let namePlato = value["Name"]
                            let urlPlato = value["imagen"]
                            let precio = value["precio"]
                            let UrlPlato = URL(string: urlPlato as! String)
                            if let data = try? Data(contentsOf: UrlPlato!) {
                                let imagenPlato: UIImage = (UIImage(data: data) ?? nil)!
                                //self.platosCarta.append(Plato(nombre: namePlato as! String, precio: precio as! Int, imagen: imagenPlato))
                                self.platosCarta.platos.append(Plato(nombre: namePlato as! String, precio: precio as! Int, imagen: imagenPlato))
                            }
                        })
                        
                            /*let namePlato = carta["Name"]
                            let urlPlato = platos["imagen"]
                            let precio = platos["precio"]
                            let UrlPlato = URL(string: urlPlato as! String)
                            if let data = try? Data(contentsOf: UrlPlato!) {
                                let imagenPlato: UIImage = (UIImage(data: data) ?? nil)!
                                self.platosCarta.append(Plato(nombre: namePlato as! String, precio: precio as! Int, imagen: imagenPlato))
                            }*/
                        
                    }
                    
                    print(self.platosCarta)
//                    guard let namePlato = plato["name"] else { return }
                    
                    
                    if let data = try? Data(contentsOf: Url!) {
                        let imagen: UIImage = (UIImage(data: data) ?? nil)!
                        //postDataRef.append(Restaurante(name: name as! String, image: imagen, location: location as! String, menu: Carta[platosCarta]))
                        postDataRef.append(Restaurante(name: name as! String, image: imagen, location: location as!String, menu: self.platosCarta))
                    }
                    
                }
            self.tableView.reloadData()
        })
    }
    
}
