//
//  TrackTableViewCell.swift
//  AppleMusic
//
//  Created by Sergey on 03.01.2021.
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
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      //  button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
       // button.setImage(#imageLiteral(resourceName: "pause"), for: .selected)
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
