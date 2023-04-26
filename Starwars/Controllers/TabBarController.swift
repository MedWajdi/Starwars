//
//  TabBarController.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import Foundation
import UIKit


final class TabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs(){
        let menuVC = MenuViewController()
        let favoriteVC = FavoriteViewController()
        
        menuVC.navigationItem.largeTitleDisplayMode = .automatic
        favoriteVC.navigationItem.largeTitleDisplayMode = .automatic
        
        menuVC.title = "Menu"
        favoriteVC.title = "Favorite"
        
        
        let nav1 = UINavigationController(rootViewController: menuVC)
        let nav2 = UINavigationController(rootViewController: favoriteVC)

        nav1.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName:"filemenu.and.selection"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Favorite", image:  UIImage(systemName:"heart"), tag: 2)
        
        for nav in [nav1,nav2] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        
        setViewControllers([nav1,nav2], animated : true)
        
    }
    
    
}

