//
//  MoreVC.swift
//  MyXWorkout
//
//  Created by Test on 16/08/22.
//

import UIKit

class MoreVC: UIViewController {
    
    private let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moreImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        
        view.addSubview(moreImageView)
    }
}

extension MoreVC {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            moreImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            moreImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            moreImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            moreImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}
