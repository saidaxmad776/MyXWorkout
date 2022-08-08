//
//  Ext + Date.swift
//  MyXWorkout
//
//  Created by Test on 08/08/22.
//

import UIKit

extension Date {
    
    func getWeekdayNumber() -> Int {
        
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
