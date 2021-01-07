//
//  DetailTableViewCell.swift
//  AppleMusic
//
// Created by Sergey on 24.12.2020.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    var titleLabel: UILabel =  {
        let label = UILabel()
        return label
    }()
        
    var album: Album! {
        didSet {
            let price = album.price ?? 0.00
            titleLabel.text = album.artist + " " + "\(price)"

        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    func initialize() {
        
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        NSLayoutConstraint.activate([
            
            self.contentView.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
        ])
        
    }
    override func prepareForReuse() {
           super.prepareForReuse()
        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
        self.imageView?.image = nil
       }

}
