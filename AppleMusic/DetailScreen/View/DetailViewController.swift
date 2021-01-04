//
//  DetailViewController.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//


import UIKit
import Foundation
import AVKit

//protocol TrackMovingDelegate: class {
//    
//    func moveBackForPreviousTrack() -> DetailModel.TrackOne?
//    func moveForwardForPreviousTrack() -> DetailModel.TrackOne?
//    
//}


class DetailViewController: UIViewController {
    //MARK: - Property
    
    var viewModel: ViewModel!
    let detailView = DetailViewCode()
    var previousSelected: Int? //optional - could be nil
    var audioPlayer: AVAudioPlayer!
    
  //  weak var delegate: TrackMovingDelegate?
    var albumss: Album! {
      didSet {
        print("123")
        
      }
    }
    var track: Track! {
        didSet {
            print("TrackViewControler")
    
//            detailTextLabel?.text = track.duration!.toMinutes
//            detailTextLabel?.text = "$\(track.price!)"
        }
    }
    
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
       // setUI()
        actionButton()
        actionSongSlider()
        makeTableView()
        setupDetail()

    }
    private func makeTableView() {
        detailView.tableView.dataSource = self
        detailView.tableView.delegate = self
        detailView.tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailView.tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: TrackTableViewCell.identifier)
        
    }
    func buttonTarget() {
    
    }
    
    @objc  func refreshAlbumList(sender: UIButton) {
        
        let track = viewModel.tracks[sender.tag]
        print(sender.tag)
        //check if its the fist time we tapped the play button - check if same button is tapped twice
        if previousSelected != nil && sender.tag != previousSelected {
            detailView.tableView.reloadRows(at: [IndexPath(row: previousSelected!, section: 1)], with: .top)
        }
        
        switch sender.currentImage == #imageLiteral(resourceName: "play") {
        case true:
            guard let endpoint = track.url, let url = URL(string: endpoint) else { return }
            //API Requests
            URLSession.shared.dataTask(with: url) { [weak self] (dat, _, _) in
                if let data = dat {
                    do {
                        DispatchQueue.main.async {
                            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
                            self?.previousSelected = sender.tag
                        }
                        //Set AVPlayer with Data from API Request
                        self?.audioPlayer = try AVAudioPlayer(data: data)
                        //AudioPlayer to play
                        self?.audioPlayer.play()
                    } catch {
                        print("Couldn't Play Data: \(error.localizedDescription)")
                        return
                    }
                }
            }.resume()
            
        case false:
            previousSelected = nil
            sender.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            audioPlayer.pause()
        }
        
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
       // let cellViewModel = delegate?.moveForwardForPreviousTrack()
//        cellViewModel
//            .then{ _ in setUI()}
//            .otherwise { print("cellViewModel = nil")}
    }
    @objc func previreusTrack() {
       // let cellViewModel = delegate?.moveBackForPreviousTrack()
//        cellViewModel
//            .then{ _ in setUI()}
//            .otherwise { print("cellViewModel = nil")}
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

//extension DetailViewController {
//
//    func setUI() {
//        let string600 = viewModel.currentAlbum.image.replacingOccurrences(of: "100x100", with: "600x600")
//        guard let url = URL(string: string600) else { return }
//        monitorStartTime()
//        observerPlayerCirrentTime()
//        print("currentAlbum = \(viewModel.currentAlbum.url)")
//        detailView.configureDetailView(trackTitle: viewModel.currentAlbum.title, author: viewModel.currentAlbum.artist,url: url)
//
//    }
//}
//MARK: TrackDelegate
extension DetailViewController: TrackDelegate {
    func update() {
        DispatchQueue.main.async {
            self.detailView.tableView.reloadData()
        }
    }
}
