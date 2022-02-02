//
//  ViewController.swift
//  PhotoAssingment
//
//  Created by Alexey on 2/2/22.
//

import UIKit


class ViewController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create instance of view controllers
        
        let photoVC = PhotoViewController()
        let favoriteVC = FavoriteViewController()
        
        // set title
        
        photoVC.title = "Photo"
        favoriteVC.title = "Favorite"
        
        // assign view controllers to tab bar
        
        self.setViewControllers([photoVC, favoriteVC], animated: false)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        for item in items {
            item.image = UIImage(systemName: "tick")
        }
        
        self.tabBar.tintColor = .black
        UITabBar.appearance().backgroundColor = .systemBackground
        tabBar.backgroundImage = UIImage()
        
        self.view.backgroundColor = .systemBackground
    }
}
 
