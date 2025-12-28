//
//  TinderBar.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 22/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import Tabman

@MainActor
final class TinderBar {

    typealias BarType = TMBarView<TinderBarLayout, TinderBarButton, TMBarIndicator.None>
    
    static func make() -> TMBar {
        let bar = BarType()
        
        bar.scrollMode = .swipe
        
        bar.buttons.customize { (button) in
            button.tintColor = TinderColors.primaryTint
            button.unselectedTintColor = TinderColors.unselectedGray
        }
        
        // Wrap in a 'navigation bar'.
        let navigationBar = bar.systemBar()
        navigationBar.backgroundStyle = .flat(color: .white)
        return navigationBar
    }
}
