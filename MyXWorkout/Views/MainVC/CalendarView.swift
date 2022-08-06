//
//  CalendarView.swift
//  MyXWorkout
//
//  Created by Test on 06/08/22.
//

import UIKit

class CalendarView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .red
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension CalendarView {
    
    private func setConstraints() {
        
        
    }
}
