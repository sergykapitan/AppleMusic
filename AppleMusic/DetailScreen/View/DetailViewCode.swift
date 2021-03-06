//
//  DetailViewCode.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit
import SDWebImage
import AVKit
import AVFoundation


final class DetailViewCode: UIView {
 
    var track: Track! {
        didSet {
            let url = URL(string: track.image)
            guard let name = track.name, let urlImage = url,let urlTrack = track.url else { return }
            configureDetailView(trackTitle: name, url: urlImage, previewUrl: urlTrack)
        }
    }

    var album: Album! {
        didSet {
            guard let al = album else { return }
            let index: IndexPath = IndexPath(row: 0, section: 1)
            tableView.selectRow(at: index, animated: true, scrollPosition: .none)
            authorLabel.text = al.artist
            let url = URL(string: al.image)
            imageAlbum.sd_setImage(with: url, completed: nil)
        }
    }
    
    //MARK: - UI
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    private var stackVFirst: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 0
        return stack
    }()
    private var stackHFirst: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    private var stackHSecond: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    private var stackHTherd: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 30
        return stack
    }()
     let imageAlbum: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.anchor( height: 300)
        return image
    }()
    
    private let buttunA: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
     let sliderSongPlay: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
     let labelTimestart: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textAlignment = .left
        return label
    }()
     let labelTimestop: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "--:--"
        label.textAlignment = .right
        return label
    }()
    var trackTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Track Title"
        label.textAlignment = .center
        return label
    }()
    private let authorLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .red
        label.text = "Author"
        label.textAlignment = .center
        return label
    }()
     let butttonPlay: UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(named: "pause"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "play"), for: .highlighted)
        return button
    }()
     let buttonNextTrack: UIButton = {
        let button  = UIButton()
        button.setImage(#imageLiteral(resourceName: "Right"), for: .normal)
        button.anchor(width: 50 )
        return button
    }()
     let buttonPreviousTrack: UIButton = {
        let button  = UIButton()
        button.setImage(#imageLiteral(resourceName: "Left"), for: .normal)
        button.anchor(width: 50 )
        return button
    }()
    private let imageVolumeMin: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "IconMin")
        image.anchor(height: 17)
        return image
    }()
     let sliderVolume: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 50
        return slider
    }()
    private let imageVolumeMax: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "IconMax")
        image.anchor(height: 17)
        return image
    }()
    
     let table: UIView = {
        let table = UIView()
        return table
    }()
   
    var player: AVPlayer = {
            let player = AVPlayer()
            player.automaticallyWaitsToMinimizeStalling = false
            return player
        }()
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        return table
    }()

    
    // MARK: - Init
    init() {
        super.init(frame: CGRect.zero)
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        backgroundColor = .white
        addSubview(cardView)
        table.addSubview(tableView)
        tableView.fillSuperview()
        stackHTherd = UIStackView(arrangedSubviews: [imageVolumeMin,sliderVolume,imageVolumeMax])
        stackHSecond = UIStackView(arrangedSubviews: [buttonPreviousTrack,butttonPlay,buttonNextTrack])
        stackHFirst = UIStackView(arrangedSubviews: [labelTimestart,labelTimestop])
        stackVFirst = UIStackView(arrangedSubviews:[imageAlbum,sliderSongPlay,stackHFirst,authorLabel,trackTitleLabel,table,stackHSecond,stackHTherd])
        stackVFirst.axis = .vertical
        cardView.addSubview(stackVFirst)
        player.automaticallyWaitsToMinimizeStalling = false
    }
    
    private func initLayout() {
        cardView.fillSuperview()
        stackVFirst.anchor(top: cardView.topAnchor,left: cardView.leftAnchor,right: cardView.rightAnchor,bottom: cardView.bottomAnchor,paddingTop: 10,paddingLeft: 10,paddingRight: 10,paddingBottom: 20)

     
    }
 
    func configureDetailView(trackTitle: String,url: URL,previewUrl: String){
        
        trackTitleLabel.text = trackTitle
        imageAlbum.sd_setImage(with: url, completed: nil)
        playTrack(previewUrl: previewUrl )
        
    }
    
    func playTrack(previewUrl: String) {
        guard let url = URL(string: previewUrl) else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.pause()
        
    }
    
}
