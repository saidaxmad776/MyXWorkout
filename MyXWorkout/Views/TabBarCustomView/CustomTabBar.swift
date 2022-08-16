//
//  CustomTabBar.swift
//  MyXWorkout
//
//  Created by Test on 16/08/22.
//

import UIKit

class CustomTabBar: UIView {
    
    private let minimumPossibleHeight: CGFloat = 50
    var pathColor: UIColor = #colorLiteral(red: 0.0471155718, green: 0.3950377405, blue: 0.7236577868, alpha: 1) { didSet { setNeedsDisplay() }}
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: minimumPossibleHeight)
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureUI()
    }
    
       override func draw(_ rect: CGRect) {
        pathColor.setFill()
        // MARK: - значения взяты "на глаз" и необходимо заменить на значения по дизайну
        let path = UIBezierPath()
        let startPoint = CGPoint(x: rect.minX, y: rect.minY)
        path.move(to: startPoint)
        let sideCurveEnd = CGPoint(x: 150, y: 20)
        let sideCurveCP = CGPoint(x: startPoint.x, y: sideCurveEnd.y)
        path.addQuadCurve(to: sideCurveEnd, controlPoint: sideCurveCP)
        let centerArcBegin = CGPoint(x: rect.midX - 40, y: sideCurveEnd.y)
        path.addLine(to: centerArcBegin)
        let centerFirstArcEnd = CGPoint(x: centerArcBegin.x + 40, y: centerArcBegin.y + 60)
        let centerFirstArcCP = CGPoint(x: centerFirstArcEnd.x - 5, y: centerArcBegin.y)
        path.addQuadCurve(to: centerFirstArcEnd, controlPoint: centerFirstArcCP)
        let centerSecondArcEnd = CGPoint(x: rect.midX, y: centerFirstArcEnd.y + 15)
        let centerSecondArcCP = CGPoint(x: centerFirstArcEnd.x + 5, y: centerFirstArcEnd.y + 10)
        let centerSecondArcCP2 = CGPoint(x: centerFirstArcEnd.x + 10, y: centerSecondArcEnd.y)
        path.addCurve(to: centerSecondArcEnd, controlPoint1: centerSecondArcCP, controlPoint2: centerSecondArcCP2)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.close()
        path.fill()
        // MARK: - отражаем часть, так как симметрична, дабы не расписывать.
        let mirrorPath = path
        mirrorPath.apply(CGAffineTransform(scaleX: -1, y: 1))
        mirrorPath.apply(CGAffineTransform(translationX: rect.width, y: 0))
        mirrorPath.fill()
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        backgroundColor = #colorLiteral(red: 0.04063916951, green: 0.4951741695, blue: 0.9038379788, alpha: 1)
        heightAnchor.constraint(greaterThanOrEqualToConstant: minimumPossibleHeight).isActive = true
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowRadius = 10
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
    }
}
