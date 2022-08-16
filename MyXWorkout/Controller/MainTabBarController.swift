//
//  MainTabBarController.swift
//  MyXWorkout
//
//  Created by Test on 07/08/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupViews()
        setConstrints()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .none
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .specialGray
        
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(customTabBar)
    }
    
    private func setupViews() {
        
        let mainVC = MainVC()
        let statisticVC = StatisticVC()
        let profileVC = ProfilVC()
        let moreVC = MoreVC()
        
        setViewControllers([mainVC, statisticVC, profileVC, moreVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        items[3].title = "More"
        
        items[0].image = UIImage(named: "mainTabBar")
        items[1].image = UIImage(named: "statisticTabBar")
        items[2].image = UIImage(named: "profileTabBar")
        items[3].image = UIImage(systemName: "ellipsis")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.robotoBold12() as Any],
                                                         for: .normal)
    }
    
    
    private func setConstrints() {
        
        NSLayoutConstraint.activate([
            customTabBar.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor, constant: 0),
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 0),
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 0),
            
        ])
    }
}
