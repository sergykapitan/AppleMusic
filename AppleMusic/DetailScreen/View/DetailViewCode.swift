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
    private let imageAlbum: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.heightEqualToMultiplier(inView: image, multiplier: 1)
        

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
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textAlignment = .left
        return label
    }()
    private let labelTimestop: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "--:--"
        label.textAlignment = .right
        return label
    }()
    private let trackTitleLabel:UILabel = {
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
    private let butttonPlay: UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(named: "pause"), for: .normal)
        button.setTitleColor(UIColor.blue, for: .selected)
        button.setImage(#imageLiteral(resourceName: "play"), for: .highlighted)
        return button
    }()
    private let butttonNextTrack: UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(named: "Right"), for: .normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.anchor(width: 50 )
        return button
    }()
    private let butttonPrevireusTrack: UIButton = {
        let button  = UIButton()
        button.setImage(UIImage(named: "Left"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "Add"), for: .highlighted)
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
    private let sliderVolume: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    private let imageVolumeMax: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "IconMax")
        image.anchor(height: 17)
        return image
    }()
    
    private let tableView: UIView = {
        let table = UIView()
        table.backgroundColor = .blue
        table.anchor(height: 200)
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
        stackHTherd = UIStackView(arrangedSubviews: [imageVolumeMin,sliderVolume,imageVolumeMax])
        stackHSecond = UIStackView(arrangedSubviews: [butttonPrevireusTrack,butttonPlay,butttonNextTrack])
        stackHFirst = UIStackView(arrangedSubviews: [labelTimestart,labelTimestop])
        stackVFirst = UIStackView(arrangedSubviews: [imageAlbum,sliderSongPlay,stackHFirst,trackTitleLabel,authorLabel,tableView,stackHSecond,stackHTherd])
        stackVFirst.axis = .vertical
        cardView.addSubview(stackVFirst)
    }
    
    private func initLayout() {
        cardView.fillSuperview()
        stackVFirst.anchor(top: cardView.topAnchor,left: cardView.leftAnchor,right: cardView.rightAnchor,bottom: cardView.bottomAnchor,paddingTop: 10,paddingLeft: 10,paddingRight: 10,paddingBottom: 20)

     
    }
    func configureDetailView(trackTitle: String,author: String){
        trackTitleLabel.text = trackTitle
        authorLabel.text = author
    }
  
}
