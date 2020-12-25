//
//  MainTabBarController.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewModel = MainViewModel(model: ViewData())
        
        
        
        viewControllers = [
            generateViewController(rootViewController: SearchCollectionViewController(viewModel: firstViewModel), image: #imageLiteral(resourceName: "search") , title: "Search"),
            generateViewController(rootViewController: HistoryViewController(), image: #imageLiteral(resourceName: "history"), title: "History")
        ]
       
    }
    
    private func generateViewController(rootViewController: UIViewController,image: UIImage,title: String) ->UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }

}
