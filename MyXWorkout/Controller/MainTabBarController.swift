//
//  MainTabBarController.swift
//  MyXWorkout
//
//  Created by Test on 07/08/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupViews()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupViews() {
        
        let mainVC = MainVC()
        let statisticVC = StatisticVC()
        let profileVC = ProfilVC()
        
        setViewControllers([mainVC, statisticVC, profileVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "mainTabBar")
        items[1].image = UIImage(named: "statisticTabBar")
        items[2].image = UIImage(named: "profileTabBar")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.robotoMedium12() as Any],
                                                         for: .normal)
    }
    
}
