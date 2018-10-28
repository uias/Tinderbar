//
//  AutoInsetter.swift
//  AutoInset
//
//  Created by Merrick Sapsford on 16/01/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

/// Engine that provides Auto Insetting to UIViewControllers.
public final class AutoInsetter {
    
    // MARK: Properties
    
    private var currentContentInsets = [UIScrollView: UIEdgeInsets]()
    private var currentContentOffsets = [UIScrollView: CGPoint]()
    
    /// Whether auto-insetting is enabled.
    public var isEnabled: Bool = true
    
    // MARK: Init
    
    public init() {}
    
    // MARK: Insetting
    
    /// Inset a child view controller by a set of required insets.
    ///
    /// - Parameters:
    ///   - childViewController: Child view controller to inset.
    ///   - requiredInsetSpec: The required inset specification.
    public func inset(_ childViewController: UIViewController?,
                      requiredInsetSpec: AutoInsetSpec) {
        guard let childViewController = childViewController, isEnabled else {
            return
        }
        
        if #available(iOS 11, *) {
            if requiredInsetSpec.additionalRequiredInsets != childViewController.additionalSafeAreaInsets {
                childViewController.additionalSafeAreaInsets = requiredInsetSpec.additionalRequiredInsets
            }
        }
        
        childViewController.forEachEmbeddedScrollView { (scrollView) in
            
            if #available(iOS 11.0, *) {
                scrollView.contentInsetAdjustmentBehavior = .never
            }
            
            let requiredContentInset = calculateActualRequiredContentInset(for: scrollView,
                                                                           from: requiredInsetSpec,
                                                                           in: childViewController)
            
            // dont update if we dont need to
            if scrollView.contentInset != requiredContentInset {
                
                let isTopInsetChanged = requiredContentInset.top != scrollView.contentInset.top
                let topInsetDelta = requiredContentInset.top - scrollView.contentInset.top

                scrollView.contentInset = requiredContentInset
                scrollView.scrollIndicatorInsets = requiredContentInset
                                
                // only update contentOffset if the top contentInset has updated.
                if isTopInsetChanged {
                    var contentOffset = self.currentContentOffsets[scrollView] ?? .zero
                    
                    // Calculate the user 'delta' - the amount that the user has scrolled
                    // the scroll view before insetting.
                    var userDelta = scrollView.contentOffset.y - contentOffset.y
                    if userDelta > 0 { // If offset delta exists compare to insets to ensure it is user.
                        userDelta += contentOffset.y + scrollView.contentInset.top
                    }
    
                    contentOffset.y -= topInsetDelta
                    self.currentContentOffsets[scrollView] = contentOffset
                    
                    if userDelta > 0 { // apply user delta
                        contentOffset.y += userDelta
                    }
                    
                    scrollView.contentOffset = contentOffset
                }
            }
        }
    }
    
    private func reset(_ childViewController: UIViewController,
                       from requiredInsetSpec: AutoInsetSpec) {
        
        if #available(iOS 11, *) {
            childViewController.additionalSafeAreaInsets = .zero
        }
        
        childViewController.forEachEmbeddedScrollView { (scrollView) in
            if #available(iOS 11, *) {
                scrollView.contentInsetAdjustmentBehavior = .automatic
            }
            scrollView.contentInset = .zero
            scrollView.contentOffset = .zero
            scrollView.scrollIndicatorInsets = .zero
        }
    }
}

// MARK: - Utilities
private extension AutoInsetter {
    
    /// Calculate the actual inset values to use for a scroll view.
    ///
    /// - Parameters:
    ///   - scrollView: Scroll view.
    ///   - requiredInsets: Required TabmanBar insets.
    ///   - viewController: The view controller that contains the scroll view.
    /// - Returns: Actual contentInset values to use.
    func calculateActualRequiredContentInset(for scrollView: UIScrollView,
                                             from requiredInsetSpec: AutoInsetSpec,
                                             in viewController: UIViewController) -> UIEdgeInsets {
        viewController.view.layoutIfNeeded()
        
        let requiredContentInset = requiredInsetSpec.allRequiredInsets
        let previousContentInset = currentContentInsets[scrollView] ?? .zero
        
        // Calculate top / bottom insets relative to view position in child vc.
        var proposedContentInset: UIEdgeInsets
        
        if isEmbeddedViewController(viewController) { // Embedded VC is always full canvas
            proposedContentInset = requiredContentInset
            
        } else { // Standard View controller
            
            let relativeSuperview = viewController.view
            let relativeFrame = viewController.view.convert(scrollView.frame, from: relativeSuperview)
            let relativeTopInset = max(requiredContentInset.top - relativeFrame.minY, 0.0)
            let bottomInsetMinY = viewController.view.bounds.height - requiredContentInset.bottom
            let relativeBottomInset = abs(min(bottomInsetMinY - relativeFrame.maxY, 0.0))
            let originalContentInset = scrollView.contentInset
            
            proposedContentInset = UIEdgeInsets(top: relativeTopInset,
                                                left: originalContentInset.left,
                                                bottom: relativeBottomInset,
                                                right: originalContentInset.right)
        }
        
        currentContentInsets[scrollView] = proposedContentInset
                
        var actualRequiredContentInset = proposedContentInset
        
        // Take into account any custom insets for top / bottom
        if scrollView.contentInset.top != 0.0 {
            let customTopInset = scrollView.contentInset.top - previousContentInset.top
            actualRequiredContentInset.top += customTopInset
        }
        if scrollView.contentInset.bottom != 0.0 {
            let customBottomInset = scrollView.contentInset.bottom - previousContentInset.bottom
            actualRequiredContentInset.bottom += customBottomInset
        }
        
        return actualRequiredContentInset
    }
    
    /// Check whether a view controller is an 'embedded' view controller type (i.e. UITableViewController)
    ///
    /// - Parameters:
    ///   - viewController: The view controller.
    ///   - success: Execution if view controller is not embedded type.
    func isEmbeddedViewController(_ viewController: UIViewController) -> Bool {
        if (viewController is UITableViewController) || (viewController is UICollectionViewController) {
            return true
        }
        return false
    }
}
