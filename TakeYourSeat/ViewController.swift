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


//Opcion seleccionada dependiendo del boton al que le damos
var ref: DatabaseReference!
//Opciones estaticas de momento para recoger si es para comer aqui o no
var opciones = ["Aqui","Para llevar"]
class ViewController: UIViewController, GIDSignInUIDelegate {
    //Aqui empezamos
    
    
    
    
    @IBOutlet weak var takeYourSeat: UIButton!
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
        name = Auth.auth().currentUser?.displayName ?? ""
        takeYourSeat.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        comprovation()
        print(name)
        if name == ""{
            takeYourSeat.isHidden = true
            signInButton.isHidden = false
        }
        else{
            signInButton.isHidden = true
            takeYourSeat.isHidden = false
        }
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
