//
//  RestaurantDetail.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 01/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import UIKit

class RestaurantDetail: UIViewController {

    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restImg: UIImageView!
    @IBOutlet weak var restDesc: UILabel!
    
    var nombre = ""
    var desc = ""
    var img:UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restName.text = nombre
        restImg.image = img
        restDesc.text = desc
        // Do any additional setup after loading the view.
    }

}
