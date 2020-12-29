//
//  SearchCollectionViewCell.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit
import SDWebImage


final class SearchCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
   // static var cellID: String { return String(describing: self) }
   // var detailViewModel = DetailModel.init(cells: [])
    //MARK: - UI
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = UIColor.black
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
    }
    
    private func initUI() {
        clipsToBounds = true
        backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
       // backgroundColor = .black
        contentView.addSubview(photoImage)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(spinner)
        
    }
    
    private func initLayout() {
        photoImage.anchor(top: contentView.topAnchor,
                          left: contentView.leftAnchor,
                          bottom: contentView.bottomAnchor,
                          paddingTop: 5,
                          paddingLeft: 5,
                          paddingBottom: 5, width: contentView.frame.width / 3)
        artistNameLabel.anchor(top: contentView.topAnchor,
                               left:photoImage.rightAnchor,
                               right: contentView.rightAnchor,
                               paddingTop: 5,paddingLeft: 5,paddingRight: 5 )
        albumNameLabel.anchor(top: artistNameLabel.bottomAnchor,
                              left: photoImage.rightAnchor,
                              right: contentView.rightAnchor,
                              paddingTop: 5,paddingLeft: 5,paddingRight: 5)
        
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: - Methods
    func showSpinner() {
        spinner.startAnimating()
    }

    private func hideSpinner() {
        spinner.stopAnimating()
    }
    
    func hideSpinner(withDelay delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [unowned self] in
            self.hideSpinner()
        }
    }
    
    func configureCell(albumName: String, url: URL,artistName: String) {
        photoImage.sd_setImage(with: url, completed: nil)
        artistNameLabel.text = artistName
        albumNameLabel.text = albumName
    }
}

