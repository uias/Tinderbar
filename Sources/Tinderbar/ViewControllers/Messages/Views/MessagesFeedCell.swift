//
//  MessagesFeedCell.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 28/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

class MessagesFeedCell: UITableViewCell {
    
    static let reuseIdentifier = "MessagesFeedCell"
    
    @IBOutlet private weak var avatarView: UIView!
    @IBOutlet private weak var contentImageView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var actionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentImageView.backgroundColor = TinderColors.unselectedGray
        avatarView.backgroundColor = TinderColors.unselectedGray
        actionLabel.textColor = .lightGray
        dateLabel.textColor = .lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarView.layer.cornerRadius = avatarView.bounds.size.width / 2
    }
}
