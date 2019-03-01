//
//  Restaurant.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 01/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    var name:String = String()
    var image:String = String()
    var location:String = String()
    
    init(name:String, image:String, location:String) {
        self.name = name
        self.image = image
        self.location = location
    }
    
}
