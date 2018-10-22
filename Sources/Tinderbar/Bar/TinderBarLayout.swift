//
//  TinderBarLayout.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 22/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import Tabman

class TinderBarLayout: TMBarLayout {
    
    private let stackView = UIStackView()
    
    // MARK: Lifecycle
    
    override func layout(in view: UIView) {
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    override func insert(buttons: [TMBarButton], at index: Int) {
        
        addPaddingView(multiplier: 0.25)
        for button in buttons {
            
            let container = UIView()
            stackView.addArrangedSubview(container)
            container.addSubview(button)
            
            container.translatesAutoresizingMaskIntoConstraints = false
            container.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor, multiplier: 0.5).isActive = true
            
            container.backgroundColor = .red
            
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                button.topAnchor.constraint(equalTo: container.topAnchor),
                button.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                button.leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor),
                button.trailingAnchor.constraint(greaterThanOrEqualTo: container.trailingAnchor)
                ])
        }
        addPaddingView(multiplier: 0.25)
    }
    
    override func remove(buttons: [TMBarButton]) {
        
    }
    
    override func focusArea(for position: CGFloat, capacity: Int) -> CGRect {
        return .zero
    }
    
    // MARK: Utility
    
    @discardableResult
    private func addPaddingView(multiplier: CGFloat) -> UIView {
        let view = UIView()
        view.isUserInteractionEnabled = false
        stackView.addArrangedSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor, multiplier: multiplier).isActive = true
        return view
    }
}
