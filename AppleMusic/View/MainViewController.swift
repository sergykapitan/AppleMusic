//
//  MainViewController.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    var shareView = MainViewCode()
    
    //MARK: - LifeCicle
    override func loadView() {
        view = shareView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
    }
}

