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
    
    var viewModel: ViewModel!
    let detailView = DetailViewCode()
    var previousSelected: Int? //optional - could be nil
    var audioPlayer: AVAudioPlayer!
    

    override func loadView() {
        super.loadView()
        let scale: CGFloat = 0.8
        detailView.imageAlbum.transform = CGAffineTransform(scaleX: scale, y: scale)
        detailView.imageAlbum.layer.cornerRadius = 6
        view = detailView
        
    
    }
   

    override func viewDidLoad() {
            super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        actionButton()
        actionSongSlider()
        makeTableView()
        setupDetail()
        monitorStartTime()
        observerPlayerCirrentTime()

    }
    private func makeTableView() {
        detailView.tableView.dataSource = self
        detailView.tableView.delegate = self
        detailView.tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailView.tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier)
        
    }

    //MARK: - Action
    private func actionSongSlider() {
        detailView.sliderSongPlay.addTarget(self, action: #selector(actionSliderSong), for: .valueChanged)
        detailView.sliderVolume.addTarget(self, action: #selector(changeVolumeSlider), for: .valueChanged)
    }

    func actionButton() {
        detailView.butttonPlay.addTarget(self, action: #selector(playTrackSong), for: .touchUpInside)
      
    }

    //MARK: - Selector

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
    private func setupDetail() {
        viewModel.delegate = self
        detailView.tableView.tableFooterView = UIView(frame: .zero)
    }

}

//MARK: TrackDelegate
extension DetailViewController: TrackDelegate {
    func update() {
        DispatchQueue.main.async {
            self.detailView.tableView.reloadData()
        }
    }
}
