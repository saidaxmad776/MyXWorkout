//
//  Ext + UIView.swift
//  MyXWorkout
//
//  Created by Test on 07/08/22.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.systemGray2.cgColor
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
    }
}
