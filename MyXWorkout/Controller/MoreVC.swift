//
//  MoreVC.swift
//  MyXWorkout
//
//  Created by Test on 16/08/22.
//

import UIKit
import Lottie


class MoreVC: UIViewController {
    
    private let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moreImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: ["Man", "Woman"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.selectedSegmentTintColor = .specialYellow
        let font = UIFont.robotoBold16()
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.white],
                                                for: .normal)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.specialGray],
                                                for: .selected)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedChangePerson), for: .valueChanged)
        return segmentedControl
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        collectionVIew.bounces = true
        collectionVIew.showsVerticalScrollIndicator = false
        collectionVIew.backgroundColor = .none
        return collectionVIew
    }()
    
    
    private let animateArrayM: [AnimateModelMan] = [
        AnimateModelMan(name: "animation9"),
        AnimateModelMan(name: "animation2"),
        AnimateModelMan(name: "animation3"),
        AnimateModelMan(name: "animation4"),
        AnimateModelMan(name: "animation5"),
        AnimateModelMan(name: "animation6"),
        AnimateModelMan(name: "animation7"),
        AnimateModelMan(name: "animation8"),
        AnimateModelMan(name: "animation9"),
        AnimateModelMan(name: "animation10"),
        AnimateModelMan(name: "animation11"),
        AnimateModelMan(name: "animation12"),
        AnimateModelMan(name: "animation13"),
        AnimateModelMan(name: "animation14"),
        AnimateModelMan(name: "animation15"),
        AnimateModelMan(name: "animation16"),
        AnimateModelMan(name: "animation17"),
        AnimateModelMan(name: "animation18"),]
    
    private let animateArrayW: [AnimateModelWoman] = [
        AnimateModelWoman(name: "animateW1"),
        AnimateModelWoman(name: "animateW2"),
        AnimateModelWoman(name: "animateW3"),
        AnimateModelWoman(name: "animateW4"),
        AnimateModelWoman(name: "animateW5"),
        AnimateModelWoman(name: "animateW6"),
        AnimateModelWoman(name: "animateW7"),
        AnimateModelWoman(name: "animateW8"),
        AnimateModelWoman(name: "animateW9"),
        AnimateModelWoman(name: "animateW10"),
        AnimateModelWoman(name: "animateW11"),
        AnimateModelWoman(name: "animateW12"),
        AnimateModelWoman(name: "animateW13"),
        AnimateModelWoman(name: "animateW14")]
    
    

    private let  idCollectionView = "idCollectionView"
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setDelegate()
    }
    
    private func setupView() {
        
        view.addSubview(moreImageView)
        view.addSubview(segmentedControl)
        
        view.addSubview(collectionView)
        collectionView.register(MoreCVC.self, forCellWithReuseIdentifier: idCollectionView)
        
        
    }
    
    private func setDelegate() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc private func segmentedChangePerson() {
//        if segmentedControl.selectedSegmentIndex == 0 {
//            animateArrayM.count
//        } else {
//            animateArrayW.count
//        }
    }
}

extension MoreVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    animateArrayM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCollectionView, for: indexPath) as! MoreCVC
        cell.setAnimate(with: animateArrayM[indexPath.row]) 
        return cell
    }
    
    
    
}

extension MoreVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.10,
               height: 180)
    }
}

extension MoreVC {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            moreImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            moreImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            moreImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            moreImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

        ])
    }
}
