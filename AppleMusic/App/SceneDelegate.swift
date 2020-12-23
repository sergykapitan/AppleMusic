//
//  SceneDelegate.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "Main", image: UIImage(named: "music"), tag: 1)

        let hystoryViewController = HistoryViewController()
        hystoryViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "historycircle"), tag: 2)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mainViewController,hystoryViewController]
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground")
    }


}

