//
//  EmbeddedChildTestViewController.swift
//  AutoInsetterPlayground
//
//  Created by Merrick Sapsford on 16/03/2019.
//  Copyright © 2019 UI At Six. All rights reserved.
//

import UIKit

class EmbeddedChildTestViewController: UIViewController {
    
    let child = TableViewTestViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if swift(>=4.2)
        addChild(child)
        #else
        addChildViewController(child)
        #endif
        view.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 200.0),
            view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
            ])
        
        child.view.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    }
}
