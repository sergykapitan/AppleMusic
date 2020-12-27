//
//  DetailViewCode.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit

final class DetailViewCode: UIView {
    
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
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    private var stackVSecond: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 16
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
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    private var stackHTherd: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    private let imageAlbum: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.anchor( height: 200)
        return image
    }()
   
    
    private let buttunA: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let sliderSongPlay: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    private let labelTimestart: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "labelTimestart"
        label.textAlignment = .left
        return label
    }()
    private let labelTimestop: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "labelTimestop"
        label.textAlignment = .right
        return label
    }()
    private let ArtistNameLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.text = "ArtistNameLabel"
        label.textAlignment = .center
        return label
    }()
    private let AlbumNameLabel:UILabel = {
        let label = UILabel()
        label.text = "AlbumNameLabel"
        label.backgroundColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    private let butttonPlay: UIButton = {
        let button  = UIButton()
        return button
    }()
    private let butttonNextTrack: UIButton = {
        let button  = UIButton()
        return button
    }()
    private let butttonPrevireusTrack: UIButton = {
        let button  = UIButton()
        return button
    }()
    private let imageVolumeDown: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .magenta
        image.anchor(width: 40 ,height: 40)
        return image
    }()
    private let sliderVolume: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    private let imageVolumeUp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .magenta
        image.anchor(width: 40 ,height: 40)
        return image
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

        stackVFirst = UIStackView(arrangedSubviews: [imageAlbum,sliderSongPlay])
        stackHFirst = UIStackView(arrangedSubviews: [labelTimestart,labelTimestop])
        stackVSecond = UIStackView(arrangedSubviews: [ArtistNameLabel,AlbumNameLabel])
        stackHSecond = UIStackView(arrangedSubviews: [butttonPrevireusTrack,butttonPlay,butttonNextTrack])
        stackHTherd = UIStackView(arrangedSubviews: [imageVolumeDown,sliderVolume,imageVolumeUp])
        
        stackVFirst.axis = .vertical
        stackHFirst.axis = .horizontal
        stackVSecond.axis = .vertical
        stackHSecond.axis = .horizontal
        stackHTherd.axis = .horizontal
        
        cardView.addSubview(stackVFirst)
        cardView.addSubview(stackHFirst)
        cardView.addSubview(stackVSecond)
        cardView.addSubview(stackHSecond)
        cardView.addSubview(stackHTherd)
        
    }
    
    private func initLayout() {
        cardView.fillSuperview()
        stackVFirst.anchor(top: cardView.topAnchor,left: cardView.leftAnchor,right: cardView.rightAnchor,paddingTop: 10,paddingLeft: 10,paddingRight: 10)
        stackHFirst.anchor(top:stackVFirst.bottomAnchor,left: cardView.leftAnchor,right: cardView.rightAnchor,paddingTop: 10,paddingLeft: 10,paddingRight: 10)
        stackVSecond.anchor(top: stackHFirst.bottomAnchor, left: cardView.leftAnchor, right: cardView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        stackHSecond.anchor(top:stackVSecond.bottomAnchor,left:cardView.leftAnchor,right: cardView.rightAnchor,paddingTop: 5,paddingLeft: 10,paddingRight: 10)
        stackHTherd.anchor(top: stackHSecond.bottomAnchor, left: cardView.leftAnchor, right: cardView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
     
    }
  
}
