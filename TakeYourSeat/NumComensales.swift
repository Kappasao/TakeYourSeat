//
//  NumComensales.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 17/05/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

var numCom = 0

class NumComensales: UIViewController {
    
    @IBOutlet weak var comensales: UITextField!
    
    @IBAction func confirm(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comensales.text = "0"
    }
    
}
