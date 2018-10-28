//
//  TinderBarLayout.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 22/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import Tabman

class TinderBarLayout: TMBarLayout {
    
    // MARK: Defaults
    
    private struct Defaults {
        static let contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 10, right: 0)
    }
    
    // MARK: Properties
    
    private let stackView = UIStackView()
    private var containers = [TinderBarButtonContainer]()
    
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
        
        // Add two padding views to the leading/trailing edge of the main content stack view.
        // These views are 0.25 times the width of the content layout guide (1/4 of the view width).
        addPaddingView(multiplier: 0.25, to: paddedStackView)
        paddedStackView.addArrangedSubview(stackView)
        addPaddingView(multiplier: 0.25, to: paddedStackView)
        
        // Apply a default content inset.
        contentInset = Defaults.contentInset
    }
    
    override func insert(buttons: [TMBarButton], at index: Int) {
        
        for button in buttons {
            
            let container = TinderBarButtonContainer(for: button)
            stackView.addArrangedSubview(container)
            containers.append(container)
            
            // Make button containers 1/2 the width of the layout guide (view width).
            container.widthAnchor.constraint(equalTo: layoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        }
    }
    
    override func remove(buttons: [TMBarButton]) {
        fatalError("TODO")
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
        
        // Create an interpolated rect between the view that is detected as 'lower' (leading)
        // and the view that is 'upper' (trailing) for the current position.
        let interpolation = interpolatedRect(between: lowerViewFrame,
                                             and: upperViewFrame,
                                             position: position)
        
        // Update the offsets in the container.
        // This adjusts the 'center x' constraint of the button in the container, so that it is offsetted
        // correctly. Results in -1.0 when offsetted to the left, 0.0 when focussed and 1.0 when offsetted to the right.
        // This is then interpreted for the button width and increments/decrements the constraint constant appropriately.
        updateContainerOffsets(for: position)
        
        return CGRect(x: lowerViewFrame.origin.x + interpolation.origin.x,
                      y: 0.0,
                      width: lowerViewFrame.size.width + interpolation.size.width,
                      height: view.bounds.size.height)
    }
    
    private func updateContainerOffsets(for position: CGFloat) {
        for (index, container) in containers.enumerated() {
            let index = CGFloat(index)
            let positionDelta = max(-1.0, min(1.0, position - index))
            container.offsetDelta = positionDelta
        }
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
