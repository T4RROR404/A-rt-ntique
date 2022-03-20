//
//  ViewController.swift
//  Navigation
//
//  Created by insomnia on 08.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupTabBar()
        
    }
    
    func setupTabBar() {
        
        let feedViewController = createNavController(vc: FeedViewController(), itemName: "Loots", ItemImage: "arrow.up.arrow.down")
        
        let loginViewController = createNavController(vc: LoginViewController(), itemName: "Profile", ItemImage: "person.crop.rectangle")

        viewControllers = [feedViewController, loginViewController]
        
    }
    
    
    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))  ,tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        

    
        
        return navController
    }


}

