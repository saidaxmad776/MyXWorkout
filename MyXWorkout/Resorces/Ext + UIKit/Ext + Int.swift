//
//  Ext + Int.swift
//  MyXWorkout
//
//  Created by Test on 11/08/22.
//

import UIKit

extension Int {
    
    func convertSeconds() -> (Int, Int) {
        let min = self / 60
        let sec = self % 60
        return (min, sec)
    }
    
    func setZeroForSecond() -> String {
        return (Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)")
    }
}
