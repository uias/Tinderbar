//
//  MessagesMessageCell.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 28/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

class MessagesMessageCell: UITableViewCell {
    
    static let reuseIdentifier = "MessagesMessageCell"
    
    @IBOutlet private weak var avatarView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarView.backgroundColor = TinderColors.unselectedGray
        messageLabel.textColor = .lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarView.layer.cornerRadius = avatarView.bounds.size.width / 2
    }
}
