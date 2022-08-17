//
//  MoreCVC.swift
//  MyXWorkout
//
//  Created by Test on 17/08/22.
//

import UIKit
import Lottie

class MoreCVC: UICollectionViewCell {
        
    private let animationLottie: AnimationView = {
        let animate = AnimationView()
        animate.loopMode = .loop
        animate.contentMode = .scaleToFill
        animate.layer.cornerRadius = 10
        animate.translatesAutoresizingMaskIntoConstraints = false
//        animate.play()
        return animate
    }()
  
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupViews()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            backgroundColor = .white
            layer.cornerRadius = 10
            
            addSubview(animationLottie)
        }
    
    func setAnimate(with animate: AnimateModelMan) {
        animationLottie.animation = Animation.named(animate.name)
        animationLottie.play()
    }
    
    func setAnimateW(with animate: AnimateModelWoman) {
        animationLottie.animation = Animation.named(animate.name)
        animationLottie.play()
    }
       
        
        private func setConstraints() {
            
            NSLayoutConstraint.activate([
                animationLottie.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                animationLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                animationLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                animationLottie.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            ])
        }
}


