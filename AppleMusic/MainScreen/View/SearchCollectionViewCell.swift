//
//  SearchCollectionViewCell.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit

final class SearchCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static var cellID: String { return String(describing: self) }
    
    private let photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let albumNameLabel: UILabel = {
        let label = UILabel()
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
    
    private func initUI() {
        clipsToBounds = true
        backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)

        photoImage.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
       // contentView.addSubview(photoImage)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(spinner)
    }
    
    private func initLayout() {
      //  photoImage.fillFull(for: self)
      //  albumNameLabel.fillFull(for: self)
        albumNameLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor,paddingTop: 5,paddingLeft: 5)
        
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
    
    func configureCell(albumName: String) {
       // photoImage.image. = image
        albumNameLabel.text = albumName
    }
}

