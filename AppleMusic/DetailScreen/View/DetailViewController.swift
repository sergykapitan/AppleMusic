//
//  DetailViewController.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//


import UIKit
import Foundation

class DetailViewController: UIViewController {
    //MARK: - Property
  
    let detailView = DetailViewCode()
    
    //MARK: - LifiCicle
    override func loadView() {
        super.loadView()
        view = detailView
    
    }
    override func viewDidLoad() {
            super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
      //  navigationItem.backBarButtonItem.
            
        }
    //MARK: - Metods
    private func setupMainView() {
 
    }
    
}
