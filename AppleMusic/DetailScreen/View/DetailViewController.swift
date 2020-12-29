//
//  DetailViewController.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//


import UIKit
import Foundation
import AVKit

protocol TrackMovingDelegate: class {
    
    func moveBackForPreviousTrack() -> TrackData.TrackOne?
    func moveForwardForPreviousTrack() -> TrackData.TrackOne?
    
}


class DetailViewController: UIViewController {
    //MARK: - Property
    
    var detailViewData: TrackData = .initial{
        didSet {
           viewDidLayoutSubviews()
           print("viewDataCell")
        }
    }
    var detailModel: ViewData.Track?
    let detailView = DetailViewCode()
    var viewModel: DetailViewModel?
    weak var delegate: TrackMovingDelegate?
    
    //MARK: - LifiCicle
    
    override func loadView() {
        super.loadView()
        let scale: CGFloat = 0.8
        detailView.imageAlbum.transform = CGAffineTransform(scaleX: scale, y: scale)
        detailView.imageAlbum.layer.cornerRadius = 6
        view = detailView
        
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        viewModel = DetailViewModel(detailModel: detailModel!)
            super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        actionButton()
        actionSongSlider()
        updateView()
        viewModel?.fetchTrack()
        updateUI()
        }

    //MARK: - Metods
    private func actionSongSlider() {
        detailView.sliderSongPlay.addTarget(self, action: #selector(actionSliderSong), for: .valueChanged)
        detailView.sliderVolume.addTarget(self, action: #selector(changeVolumeSlider), for: .valueChanged)
    }

    func actionButton() {
        detailView.butttonPlay.addTarget(self, action: #selector(playTrackSong), for: .touchUpInside)
        detailView.butttonNextTrack.addTarget(self, action: #selector(nextTrack), for: .touchUpInside)
        detailView.butttonPrevireusTrack.addTarget(self, action:  #selector(previreusTrack), for: .touchUpInside)
    }
    //MARK: - Selector
    @objc func nextTrack() {
        let cellViewModel = delegate?.moveForwardForPreviousTrack()
        cellViewModel
            .then{ setUI(detailModel: $0)}
            .otherwise { print("cellViewModel = nil")}
    }
    @objc func previreusTrack() {
        let cellViewModel = delegate?.moveBackForPreviousTrack()
        cellViewModel
            .then{ setUI(detailModel: $0)}
            .otherwise { print("cellViewModel = nil")}
    }
    
    
    
    @objc func changeVolumeSlider(_ sender: UISlider) {
        detailView.player.volume = detailView.sliderVolume.value
    }
    @objc func actionSliderSong(_ sender: UISlider) {
        let percentage = detailView.sliderSongPlay.value
        guard let duration = detailView.player.currentItem?.duration else { return }
        let durationSecond = CMTimeGetSeconds(duration)
        let seekTimeUpSeconds = Float64(percentage) * durationSecond
        let seekTime = CMTimeMakeWithSeconds(seekTimeUpSeconds, preferredTimescale: 1)
        detailView.player.seek(to: seekTime)
    }
    @objc func playTrackSong() {
        if detailView.player.timeControlStatus == .paused {
            detailView.player.play()
            detailView.butttonPlay.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            largeTrackImage()
        } else {
            detailView.player.pause()
            detailView.butttonPlay.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            reduceTrackImage()
        }
    }
    private func updateView() {
        viewModel?.updateViewData = { [weak self] viewData in
            self?.detailViewData = viewData
        }
    }
    func fetchD(detailModel: ViewData.Track) {
        self.detailModel = detailModel
    }
    private func updateUI() {
        
        switch detailViewData {
        case .initial:
            print("initial")
        case .loading(let loading):
            setUI(detailModel: loading)
            print("loading")
        case .success(let success):
            setUI(detailModel: success)
            print("success")
        case .failure(_):
            print("failure")
        }
    }
   //MARK: - Animation
    private func largeTrackImage() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.detailView.imageAlbum.transform = .identity
        }, completion: nil)
    }
    private func reduceTrackImage() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            let scale: CGFloat = 0.8
            self.detailView.imageAlbum.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: nil)
    }
    
    //MARK: - Time Setup
    private func monitorStartTime() {
        let time = CMTimeMake(value: 1, timescale: 3)
        let times = [NSValue(time:time)]
        detailView.player.addBoundaryTimeObserver(forTimes: times, queue: .main) { [weak self] in
            self?.largeTrackImage()
        }
    }
    private func observerPlayerCirrentTime() {
        let interval = CMTimeMake(value: 1, timescale: 2)
        detailView.player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] (time) in
            self?.detailView.labelTimestart.text = time.toDisplayString()
            
            let durationTime = self?.detailView.player.currentItem?.duration
            let currentDurationText = ((durationTime ?? CMTimeMake(value: 1, timescale: 1)) - time).toDisplayString()
            self?.detailView.labelTimestop.text = "-\(currentDurationText)"
            self?.updateCurrentTimesSlider()
        }
    }
    private func updateCurrentTimesSlider() {
        let currentSeconds = CMTimeGetSeconds(detailView.player.currentTime())
        let durationSecond =  CMTimeGetSeconds(detailView.player.currentItem?.duration ?? CMTimeMake(value: 1, timescale: 1))
        let percentage = currentSeconds / durationSecond
        detailView.sliderSongPlay.value = Float(percentage)
    }

}
extension DetailViewController {
    
    func setUI(detailModel: TrackData.TrackOne) {
        let string600 = detailModel.artworkUrl100?.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600 ?? "") else { return }
        monitorStartTime()
        observerPlayerCirrentTime()
        detailView.configureDetailView(trackTitle: detailModel.trackName, author: detailModel.artistName!, url: url, previewUrl: detailModel.previewUrl ?? "")
        
    }
}
