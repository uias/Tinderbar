//
//  TinderBarButton.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 24/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman

class TinderBarButton: TMBarButton {
    
    // MARK: Defaults
    
    private struct Defaults {
        static let imageSize = CGSize(width: 36, height: 36)
        static let unselectedScale: CGFloat = 0.8
    }
    
    // MARK: Properties
    
    private let imageView = UIImageView()
    
    // MARK: Lifecycle
    
    override func layout(in view: UIView) {
        super.layout(in: view)
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Defaults.imageSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Defaults.imageSize.height)
            ])
    }
    
    override func populate(for item: TMBarItemable) {
        super.populate(for: item)
        
        imageView.image = item.image
    }
    
    override func update(for selectionState: TMBarButton.SelectionState) {
        
        let scale = 1.0 - ((1.0 - selectionState.rawValue) * (1.0 - Defaults.unselectedScale))
        imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
