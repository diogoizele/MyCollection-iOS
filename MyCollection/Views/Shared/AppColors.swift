//
//  AppColors.swift
//  MyCollection
//
//  Created by Diogo Izele on 13/09/25.
//

import UIKit

extension UIColor {
    static var primary: UIColor { UIColor(hex: "#0F1827") }
    static var secondary: UIColor { UIColor(hex: "#9CA3AF") }
    static var textPrimary: UIColor { UIColor(hex: "#0F1827") }
    static var textSecondary: UIColor { UIColor(hex: "#4B5562") }
    static var backgroundPrimary: UIColor { UIColor(hex: "#FFFFFF") }
    static var backgroundSecondary: UIColor { UIColor(hex: "#F9FAFB") }
}

extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") { hexString.removeFirst() }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        let r, g, b: CGFloat
        if hexString.count == 6 {
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgbValue & 0x0000FF) / 255.0
        } else {
            r = 0; g = 0; b = 0
        }

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
