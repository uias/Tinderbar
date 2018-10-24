//
//  TinderBarButtonContainer.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 24/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman

class TinderBarButtonContainer: UIView {
    
    // MARK: Properties
    
    private var xAnchor: NSLayoutConstraint!
    
    // MARK: Init
    
    init(for button: TMBarButton) {
        super.init(frame: .zero)
        initialize(with: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not Supported")
    }
    
    private func initialize(with button: TMBarButton) {
        
        xAnchor = button.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            xAnchor,
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            trailingAnchor.constraint(greaterThanOrEqualTo: button.trailingAnchor)
            ])
    }
}
