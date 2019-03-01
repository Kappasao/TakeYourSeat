//
//  RestaurantCell.swift
//  TakeYourSeat
//
//  Created by Manel Sitjar on 01/03/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantImage: UILabel!
    @IBOutlet weak var restaurantLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
