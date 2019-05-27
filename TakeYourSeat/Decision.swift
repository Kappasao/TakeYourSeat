//
//  Decision.swift
//  TakeYourSeat
//
//  Created by Alvaro Salomoni on 27/05/2019.
//  Copyright © 2019 AlvaroManelTaniaUri. All rights reserved.
//

import Foundation
import UIKit

class Decision: UIViewController{
    
    var takeaway = Bool()
    
    @IBOutlet weak var imageQr: UIImageView!
    var pedido = String()
    
    let pedidu = pedidoPlatos
 
    override func viewDidLoad() {
        
        for i in 0..<pedidu.count{
            pedido = pedido + pedidu[i] + ", "
        }
        
        if takeaway {
            pedido = pedido + "Para llevar."
        } else{
            pedido = pedido + "Para comer aqui."
        }
        
        let data = pedido.data(using: String.Encoding.ascii)
        
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        
        let definitiveImage = UIImage(ciImage: scaledQrImage)
        
        self.imageQr.image = definitiveImage
    }
  
}
