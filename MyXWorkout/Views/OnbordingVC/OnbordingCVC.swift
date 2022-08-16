//
//  OnbordingCVC.swift
//  MyXWorkout
//
//  Created by Test on 16/08/22.
//

import UIKit
import Spring

class OnbordingCVC: UICollectionViewCell {
    
    private let backgroundImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "onboardingSecond")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let topLabel: SpringLabel = {
       let label = SpringLabel()
//        label.text = "Have a good health"
        label.textColor = .specialGreen
        label.font = .robotoBold24()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLabel: SpringLabel = {
       let label = SpringLabel()
//        label.text = "Bad body shape, poor sleep, lack of strength, weight gain, weak bones, easily traumatized body, depressed, stressed, poor metabolism, poor resistance"
        label.textColor = .white
        label.font = .robotoMedium16()
        label.textAlignment = .center
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        labelAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        
        addSubview(backgroundImageView)
        addSubview(topLabel)
        addSubview(bottomLabel)
       
    }
    
    private func labelAnimation() {
        
        topLabel.animation = "zoomIn"
        topLabel.curve = "linear"
        topLabel.force = 2
        topLabel.duration = 2
        topLabel.delay = 0.5
        topLabel.animate()
        
        bottomLabel.animation = "zoomIn"
        bottomLabel.curve = "linear"
        bottomLabel.force = 2
        bottomLabel.duration = 2
        bottomLabel.delay = 0.5
        bottomLabel.animate()
    }
    
    func cellConfigure(model: OnboardingStruct) {
        topLabel.text = model.topLabel
        bottomLabel.text = model.bottomLabel
        backgroundImageView.image = model.image
    }
    
    private func setConstraints() {
      
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bottomLabel.heightAnchor.constraint(equalToConstant: 85)
        ])
        
    }
}
