//
//  UISpacer.swift
//  Traslator
//
//  Created by hhhello0507 on 9/19/24.
//

import Foundation
import UIKit
import SnapKit

final class UISpacer: UIView {
    
    private let width: CGFloat
    private let height: CGFloat
    
    init(width: CGFloat = 0, height: CGFloat = 0) {
        self.width = width
        self.height = height
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        fatalError()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup() {
        snp.makeConstraints {
            $0.height.equalTo(height)
            $0.width.equalTo(width)
        }
    }
}
