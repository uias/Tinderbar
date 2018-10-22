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
        
        let paddedStackView = UIStackView()
        view.addSubview(paddedStackView)
        paddedStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paddedStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paddedStackView.topAnchor.constraint(equalTo: view.topAnchor),
            paddedStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            paddedStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        addPaddingView(multiplier: 0.25, to: paddedStackView)
        paddedStackView.addArrangedSubview(stackView)
        addPaddingView(multiplier: 0.25, to: paddedStackView)
    }
    
    override func insert(buttons: [TMBarButton], at index: Int) {
        
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
    }
    
    override func remove(buttons: [TMBarButton]) {
        
    }
    
    override func focusArea(for position: CGFloat, capacity: Int) -> CGRect {
        let range = buttonIndexRange(from: position, minimum: 0, maximum: capacity - 1)
        guard stackView.arrangedSubviews.count > range.upperBound else {
            return .zero
        }
        
        let lowerView = stackView.arrangedSubviews[range.lowerBound]
        let upperView = stackView.arrangedSubviews[range.upperBound]
        
        let lowerViewFrame = view.convert(lowerView.frame, from: stackView)
        let upperViewFrame = view.convert(upperView.frame, from: stackView)
        
        let interpolation = interpolatedRect(between: lowerViewFrame,
                                             and: upperViewFrame,
                                             position: position)
        
        return CGRect(x: lowerViewFrame.origin.x + interpolation.origin.x,
                      y: 0.0,
                      width: lowerViewFrame.size.width + interpolation.size.width,
                      height: view.bounds.size.height)
    }
    
    // MARK: Utility
    
    @discardableResult
    private func addPaddingView(multiplier: CGFloat, to stack: UIStackView) -> UIView {
        let view = UIView()
        view.isUserInteractionEnabled = false
        stack.addArrangedSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor, multiplier: multiplier).isActive = true
        return view
    }
    
    // MARK: Maths
    
    private func buttonIndexRange(from position: CGFloat, minimum: Int, maximum: Int) -> Range<Int> {
        guard maximum > minimum else {
            return 0 ..< 0
        }
        let lower = floor(position)
        let upper = ceil(position)
        let minimum = CGFloat(minimum)
        let maximum = CGFloat(maximum)
        
        return Int(max(minimum, min(maximum, lower))) ..< Int(min(maximum, max(minimum, upper)))
    }
    
    private func interpolatedRect(between frame: CGRect, and other: CGRect, position: CGFloat) -> CGRect {
        var integral: Float = 0.0
        let progress = CGFloat(modff(Float(position), &integral))
        
        return CGRect(x: (other.origin.x - frame.origin.x) * progress,
                      y: (other.origin.y - frame.origin.y) * progress,
                      width: (other.size.width - frame.size.width) * progress,
                      height: (other.size.height - frame.size.height) * progress)
    }
}
