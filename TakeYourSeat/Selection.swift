//
//  Selection.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 22/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

var selectedOption = Int()

class Selection: UIViewController{

    @IBAction func Option(_ sender: UIButton) {
        selectedOption = sender.tag
    }
    
}
