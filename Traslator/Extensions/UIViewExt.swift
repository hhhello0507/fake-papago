//
//  ViewExt.swift
//  Traslator
//
//  Created by hhhello0507 on 9/19/24.
//

import Foundation
import UIKit

extension UIView {
    @inlinable
    func addSubviews(_ views: UIView...) -> Self {
        for view in views {
            self.addSubview(view)
        }
        return self
    }
}
