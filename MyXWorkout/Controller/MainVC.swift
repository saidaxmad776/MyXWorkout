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
        imageView.alpha = 0.7
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
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name"
        label.font = .robotoMedium16()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "addWorkout"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.addShadowOnView()
        return button
    }()
    
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    
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
        view.addSubview(userNameLabel)
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        
    }
    
    @objc private func addWorkoutButtonTapped() {
        
    }
    
}

extension MainVC {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            trainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            trainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            trainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            trainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 105),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 105),
            
            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),
            
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80),
            
        ])
    }
}
