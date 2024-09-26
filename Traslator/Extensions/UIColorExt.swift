//
//  UIColorExt.swift
//  Traslator
//
//  Created by hhhello0507 on 9/19/24.
//

import UIKit

extension UIColor {
    convenience init(_ hex: UInt, alpha: Double = 1.0) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            alpha: alpha
        )
    }
}
