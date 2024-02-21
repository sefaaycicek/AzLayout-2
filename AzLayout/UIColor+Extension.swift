//
//  UIColor+Extension.swift
//  AzLayout
//
//  Created by Sefa Aycicek on 19.02.2024.
//

import UIKit

extension UIColor {
    func hexStringToUIColor(hex: String, alpha : CGFloat = 1.0) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count < 3 {
            return .clear
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    var hexString : String {
        var hexValue = "#000000"
        if let colorRef = self.cgColor.components {
            let r:CGFloat = colorRef[0]
            let g:CGFloat = colorRef[1]
            let b:CGFloat = colorRef[2]
            hexValue = String(NSString(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255))))
        }
        return hexValue
    }
}
