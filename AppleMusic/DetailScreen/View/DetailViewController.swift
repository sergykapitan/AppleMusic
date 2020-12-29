//
//  DetailViewController.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//


import UIKit
import Foundation
import AVKit


class DetailViewController: UIViewController {
    //MARK: - Property
  
    let detailView = DetailViewCode()
    var viewModel: DetailViewModel
    
    
    //MARK: - LifiCicle
    override func loadView() {
        super.loadView()
        view = detailView
    
    }
    override func viewDidLoad() {
            super.viewDidLoad()
        viewModel.delegate = self
        tabBarController?.tabBar.isHidden = true
        viewModel.fetchTrack()
        actionButton()
            
        }
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    //MARK: - Metods

    

    func actionButton() {
        detailView.butttonPlay.addTarget(self, action: #selector(playTrackSong), for: .touchUpInside)
        
    }
    @objc func playTrackSong() {
        if detailView.player.timeControlStatus == .paused {
            detailView.player.play()
            detailView.butttonPlay.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        } else {
            detailView.player.pause()
            detailView.butttonPlay.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
    }
    

}
extension DetailViewController: DetailViewModelProtocol {
    
    func setUI(detailModel: TrackData) {
        let string600 = self.viewModel.detailModel.artworkUrl100?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        detailView.configureDetailView(trackTitle: detailModel.trackName, author: detailModel.artistName ?? "", url: url, previewUrl: detailModel.previewUrl ?? "")
    }
    
    
}
