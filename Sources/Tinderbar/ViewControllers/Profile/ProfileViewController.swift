//
//  ProfileViewController.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 22/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var contentView: UIView!
    private let contentViewMaskLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.mask = contentViewMaskLayer
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentViewMaskLayer.frame = contentView.bounds
        contentViewMaskLayer.path = contentViewMaskPath(in: contentView.bounds).cgPath
    }
}

private extension ProfileViewController {
    
    private func contentViewMaskPath(in frame: CGRect) -> UIBezierPath {
        
        let curveOffset = frame.size.height / 6
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: frame.maxX, y: frame.minY))
        path.addLine(to: CGPoint(x: frame.maxX, y: frame.maxY - curveOffset))
        path.addQuadCurve(to: CGPoint(x: frame.minX, y: frame.maxY - curveOffset),
                          controlPoint: CGPoint(x: frame.maxX / 2, y: frame.maxY))
        path.close()
        return path
    }
}

@IBDesignable class ProfileActionButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = TinderColors.unselectedGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.size.width / 2.0
    }
}
