//
//  UIKit+Extension.swift
//  SamsNowiOS
//
//  Created by Haitao Chen on 2018/7/28.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

import Foundation
import UIKit

func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)->UIColor {
    return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
}

extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
    
}

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
//      设计图是安卓的设计图，除以360是因为设计稿的基准尺寸是360dp，value参数就是设计稿上面各个元素取到的值。这个函数的原理是，根据设计稿里面的元素控件，占设计稿里的百分比。
    @objc class func pxByWidthRatio(value:CGFloat)->CGFloat {
        let px = UIScreen.main.bounds.size.width*(value/360.0)
        return px
    }
    
    @objc class func XTopDangerHeight()-> CGFloat {
        if UIScreen.main.bounds.height == 812 {
            return 44.0
        }else {
            return 0
        }
    }
    @objc class func XBottomDangerHeight()-> CGFloat {
        if UIScreen.main.bounds.height == 812 {
            return 34.0
        }else {
            return 0
        }
    }
    @objc class func pxBy375Ratio(value:CGFloat)->CGFloat {
        let px = UIScreen.main.bounds.size.width*(value/375.0)
        return px
    }
    
    @objc class func pxBy812Ratio(value:CGFloat)->CGFloat {
        let px = UIScreen.main.bounds.size.height*(value/812.0)
        return px
    }
    
    @objc class func pxBy732Ratio(value:CGFloat)->CGFloat {
        let px = UIScreen.main.bounds.size.height*(value/732.0)
        return px
    }
}

typealias SNGView = UIView
@objc extension SNGView {
    
    // x
//    private var x : CGFloat {
//        get {
//            return frame.origin.x
//        }
//        
//        set(newVal) {
//            var tmpFrame : CGRect = frame
//            tmpFrame.origin.x     = newVal
//            frame                 = tmpFrame
//        }
//    }
//    
//    // y
//    private var y : CGFloat {
//        get {
//            return frame.origin.y
//        }
//        
//        set(newVal) {
//            var tmpFrame : CGRect = frame
//            tmpFrame.origin.y     = newVal
//            frame                 = tmpFrame
//        }
//    }
//    
//    // height
//    var height : CGFloat {
//        get {
//            return frame.size.height
//        }
//        
//        set(newVal) {
//            var tmpFrame : CGRect = frame
//            tmpFrame.size.height  = newVal
//            frame                 = tmpFrame
//        }
//    }
//    
//    // width
//    var width : CGFloat {
//        get {
//            return frame.size.width
//        }
//        set(newVal) {
//            var tmpFrame : CGRect = frame
//            tmpFrame.size.width   = newVal
//            frame                 = tmpFrame
//        }
//    }
    
    // left
    var left : CGFloat {
        get {
            return x
        }
        set(newVal) {
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        get {
            return x + width
        }
        set(newVal) {
            x = newVal - width
        }
    }
    
    // top
    var top : CGFloat {
        get {
            return y
        }
        set(newVal) {
            y = newVal
        }
    }
    
    // bottom
    var bottom : CGFloat {
        get {
            return y + height
        }
        set(newVal) {
            y = newVal - height
        }
    }
    
    var centerX : CGFloat {
        get {
            return center.x
        }
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var centerY : CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var middleX : CGFloat {
        get {
            return width / 2
        }
    }
    var middleY : CGFloat {
        get {
            return height / 2
        }
    }
    
    var middlePoint : CGPoint {
        get {
            return CGPoint(x: middleX, y: middleY)
        }
    }
}


extension UILabel {
    convenience init(textColor : UIColor,lines : NSInteger, font : CGFloat,textAlignment : NSTextAlignment){
        self.init()
        self.textColor = textColor
        self.numberOfLines = lines
        self.font = UIFont.systemFont(ofSize: font)
        self.textAlignment = textAlignment
    }
    convenience init(textColor : UIColor,lines : NSInteger, font : CGFloat, fontWeight:UIFont.Weight,textAlignment : NSTextAlignment){
        self.init()
        self.textColor = textColor
        self.numberOfLines = lines
        self.font = UIFont.systemFont(ofSize: font, weight: fontWeight)
        self.textAlignment = textAlignment
    }
}


extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = title.size(withAttributes: [kCTFontAttributeName as NSAttributedStringKey: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}

extension UIImage {
    /// - Parameters:
    ///   - content: content of barcode
    ///   - size: size of barcode
    /// - Returns: UIImage?
    class func creat_barCode(content: String?, size: CGSize) -> UIImage? {
        if #available(iOS 8.0, *) {
            let data = content?.data(using: String.Encoding.ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CICode128BarcodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            filter?.setValue(NSNumber(value: 0), forKey: "inputQuietSpace")
            let outputImage = filter?.outputImage

            let colorFilter = CIFilter(name: "CIFalseColor")!
            colorFilter.setDefaults()
            colorFilter.setValue(outputImage, forKey: "inputImage")
            colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
            colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1, alpha: 0), forKey: "inputColor1")

            let codeImage = UIImage(ciImage: (colorFilter.outputImage!.transformed(by: CGAffineTransform(scaleX: 10, y: 10))))
            return codeImage
        }else {
            return nil
        }
    }
    
    //二维码
    @objc class func generateQRCode(messgae:NSString,width:CGFloat,height:CGFloat) -> UIImage {
        var returnImage:UIImage?
        if (messgae.length > 0 && width > 0 && height > 0){
            let inputData = messgae.data(using: String.Encoding.utf8.rawValue)! as NSData
            // CIQRCodeGenerator
            let filter = CIFilter.init(name: "CIQRCodeGenerator")!
            filter.setValue(inputData, forKey: "inputMessage")
            var ciImage = filter.outputImage!
            let min = width > height ? height :width;
            let scaleX = min/ciImage.extent.size.width
            let scaleY = min/ciImage.extent.size.height
            ciImage = ciImage.transformed(by: CGAffineTransform.init(scaleX: scaleX, y: scaleY))
            returnImage = UIImage.init(ciImage: ciImage)
        }else {
            returnImage = nil;
        }
        return returnImage!
    }
}


extension UIScrollView: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer.state != UIGestureRecognizerState.possible) {
            return true
        }
        return false
    }
}

extension UIView{
    @objc func viewController() -> UIViewController?{
        var mnextResponse:UIResponder? = self;
        repeat{
            mnextResponse = mnextResponse?.next;
            if let isTrue = mnextResponse?.isKind(of: UIViewController.self),isTrue == true{
                return mnextResponse as? UIViewController;
            }
        }while mnextResponse != nil
        return nil;
    }
    
    @objc func scrollView() -> UIScrollView?{
        var mnextResponse:UIResponder? = self;
        repeat{
            mnextResponse = mnextResponse?.next;
            if let isTrue = mnextResponse?.isKind(of: UIScrollView.self),isTrue == true{
                return mnextResponse as? UIScrollView;
            }
        }while mnextResponse != nil
        return nil;
    }
}

extension Array {
    func convertToJSONString() -> String {
        var result:String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
            
        } catch {
            result = ""
        }
        return result
    }
}








