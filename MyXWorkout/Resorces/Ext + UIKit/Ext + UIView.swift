//
//  Ext + UIView.swift
//  MyXWorkout
//
//  Created by Test on 07/08/22.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 1.0
    }
}
