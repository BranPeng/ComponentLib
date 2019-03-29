//
//  QRCode.swift
//  sng
//
//  Created by Jimmy Lu on 9/15/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

import Foundation

@objc class QRCode: NSObject {
    
    @objc static var defaultSize: CGSize {
        let width = floor(UIScreen.main.bounds.size.width / 2) // half of screen width
        return CGSize(width:width, height: width) // square
    }
    @objc var data: Data?
    @objc var imageSize = QRCode.defaultSize
    
    /**
     Initialize with the specified data
     
     - Parameter data: the data to embed in the QR Code
     */
    @objc init(data: Data) {
        self.data = data
        super.init()
    }
    
    /**
     Initialize with the specified text
     
     - Parameter text: the text to embed in the QR Code
     */
    @objc init(text: String) {
        data = text.data(using: .isoLatin1)
        super.init()
    }
    
    private func ciImage() -> CIImage? {
        guard let qrData = data, let generator = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        
        // set text
        generator.setDefaults()
        generator.setValue(qrData, forKey: "inputMessage")
        
        return generator.outputImage
    }
    
    /**
     Generate the QR Code image containing the data initialized
     
     - Return the qr code for the data, if available
     */
    @objc func generate() -> UIImage? {
        guard var qrCIImage = ciImage() else {
            return nil
        }
        
        // size it
        let ciSize = qrCIImage.extent.integral.size
        let qrWidthRatio = imageSize.width / ciSize.width
        let qrHeightRatio = imageSize.height / ciSize.height
        let qrSizeTransform = CGAffineTransform(scaleX: qrWidthRatio, y: qrHeightRatio)
        qrCIImage = qrCIImage.transformed(by: qrSizeTransform)
        
        return UIImage(ciImage: qrCIImage)
    }
    
}
