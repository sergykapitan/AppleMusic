//
//  ViewController+Extention.swift
//  AppleMusic
//
//  Created by Sergey on 03.01.2021.
//

import Foundation
import UIKit
import AVFoundation

extension UIViewController {
    
    func goToDetail(with vm: ViewModel) {
        
        let detailVC = DetailViewController()
        detailVC.viewModel = vm
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
 
}
