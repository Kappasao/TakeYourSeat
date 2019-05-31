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
    
    
    
    @IBOutlet weak var imageQr: UIImageView!
    var pedido = String()
    override func viewDidLoad() {
        
        for i in 0..<pedidoPlatos.count{
            pedido = pedido + pedidoPlatos[i] + ", "
        }
        
        if takeaway == true {
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
