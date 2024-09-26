//
//  UIStackViewExt.swift
//  Traslator
//
//  Created by hhhello0507 on 9/19/24.
//

import Foundation
import UIKit

extension UIStackView {
    @inlinable
    func addArrangedSubviews(_ views: UIView...) -> Self {
        for view in views {
            self.addArrangedSubview(view)
        }
        return self
    }
}
