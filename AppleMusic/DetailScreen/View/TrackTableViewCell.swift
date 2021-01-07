//
//  TrackTableViewCell.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    static let identifier = "TrackTableViewCell"

    var titleLabel: UILabel =  {
        let label = UILabel()
        return label
    }()
    
    var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var track: Track! {
        didSet {
            titleLabel.text = track.name
            guard let price = track.price else { return }
            button.setTitle("\(price)$", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font =  UIFont.systemFont(ofSize: 10)

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
        let button = UIButton(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(button)
        
        self.button = button
        self.titleLabel = titleLabel
        
        NSLayoutConstraint.activate([
            self.contentView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.button.centerYAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.button.trailingAnchor)
        ])
        
    }
    override func prepareForReuse() {
           super.prepareForReuse()
        
        self.textLabel?.text = nil
        self.detailTextLabel?.text = nil
        self.imageView?.image = nil
       }
    
}
