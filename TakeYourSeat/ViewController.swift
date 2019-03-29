//
//  ViewController.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 28/02/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

var cartaItaliano: Carta = Carta(platos: [bolo, pesto, queso])
//Opcion seleccionada dependiendo del boton al que le damos

//Opciones estaticas de momento para recoger si es para comer aqui o no
var opciones = ["Aqui","Para llevar"]
var restComerAqui:[Restaurante] = [Restaurante(name: "Comer aqui 1", image: UIImage(named: "rest1")!, location: "C/ sepulveda 65", menu: cartaItaliano),
                                   Restaurante(name: "Comer aqui 2", image: UIImage(named: "rest2")!, location: "C/ comte borrell 37", menu: cartaItaliano),
                                   Restaurante(name: "Comer aqui 3", image: UIImage(named: "rest3")!, location: "C/ muntaner 1", menu: cartaItaliano),
                                   Restaurante(name: "Llevar 1", image: UIImage(named: "rest4")!, location: "C/ urgell 201", menu: cartaItaliano),
                                   Restaurante(name: "Llevar 2", image: UIImage(named: "rest5")!, location: "C/ pelai 81", menu: cartaItaliano),
                                   Restaurante(name: "Llevar 3", image: UIImage(named: "rest6")!, location: "C/ còrsega 109", menu: cartaItaliano)
]



class ViewController: UIViewController, GIDSignInUIDelegate {
    //Aqui empezamos
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            comprovation()
            print("log")
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        comprovation()
    }
    
    override func reloadInputViews() {
        comprovation()
    }
    
    func comprovation(){
        name = (Auth.auth().currentUser?.displayName ?? "")
        
        if !name.isEmpty{
            let vc = storyboard?.instantiateViewController(withIdentifier: "asd")
            //self.present(vc, animated: true)
            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }
    
}
