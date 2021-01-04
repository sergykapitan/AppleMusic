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
    
//    func goToPlaylist(with vm: ViewModel) {
//        
//        let playlistVC =
//        playlistVC.viewModel = vm
//        navigationController?.pushViewController(playlistVC, animated: true)
//    }
    
    
    func playAudio(from endpoint: String, completion: @escaping (AVAudioPlayer?) -> Void) {
        
        guard let url = URL(string: endpoint) else { return }
        
        URLSession.shared.dataTask(with: url) { (dat, _, _) in
            if let data = dat {
                do {
                    let audioPlayer = try AVAudioPlayer(data: data)
                    completion(audioPlayer)
                } catch {
                    completion(nil)
                    print("Couldn't Play Data: \(error.localizedDescription)")
                    return
                }
            }
        }
        
        
    }
    
    
}
