//
//  MainVC.swift
//  MyXWorkout
//
//  Created by Test on 06/08/22.
//

import UIKit

class MainVC: ViewController {
    
    private let trainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trainView")
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.layer.borderWidth = 7
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let calendarView = CalendarView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        
        
        view.addSubview(trainImageView)
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
       
    }
    
}

extension MainVC {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            trainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            trainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            trainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            trainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 105),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 105),
            
            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
}
