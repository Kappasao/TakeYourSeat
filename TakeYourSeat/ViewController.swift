//
//  ViewController.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 28/02/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import UIKit
import FirebaseDatabase
import GoogleSignIn
import FirebaseAuth

var cartaItaliano: Carta = Carta(platos: [bolo, pesto, queso, queso1, queso2])
var cartaFastFood: Carta = Carta(platos: [burger, fries, frankfurt])
//Opcion seleccionada dependiendo del boton al que le damos

var ref: DatabaseReference!

//Opciones estaticas de momento para recoger si es para comer aqui o no
var opciones = ["Aqui","Para llevar"]
var restComerAqui:[Restaurante] = [Restaurante(name: "Comer aqui 1", image: UIImage(named: "rest1")!, location: "C/ sepulveda 65", menu: cartaItaliano),
                                   Restaurante(name: "Comer aqui 2", image: UIImage(named: "rest2")!, location: "C/ comte borrell 37", menu: cartaFastFood),
                                   Restaurante(name: "Comer aqui 3", image: UIImage(named: "rest3")!, location: "C/ muntaner 1", menu: cartaItaliano),
                                   Restaurante(name: "Llevar 1", image: UIImage(named: "rest4")!, location: "C/ urgell 201", menu: cartaFastFood),
                                   Restaurante(name: "Llevar 2", image: UIImage(named: "rest5")!, location: "C/ pelai 81", menu: cartaItaliano),
                                   Restaurante(name: "Llevar 3", image: UIImage(named: "rest6")!, location: "C/ còrsega 109", menu: cartaFastFood)
]



class ViewController: UIViewController, GIDSignInUIDelegate {
    //Aqui empezamos
    
    
    
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
            comprovation()
            print("log")
    }
    
    
    /*func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: Error!) {
        if (error == nil) {
            comprovation()
            print("log")
        } else {
            print("\(error.localizedDescription)")
        }
    }*/
    
    /*func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.comprovation), name: Notification.Name("ToogleAuthUINotification"), object: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        comprovation()
    }
    
    override func reloadInputViews() {
        comprovation()
    }
    
    @objc func comprovation(){
        name = Auth.auth().currentUser?.displayName ?? ""
        
        if name != ""{
            let vc = storyboard?.instantiateViewController(withIdentifier: "asd")
            //self.present(vc, animated: true)
            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }
    
}
