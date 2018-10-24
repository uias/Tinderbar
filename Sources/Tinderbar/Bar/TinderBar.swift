//
//  TinderBar.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 22/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import Tabman

class TinderBar {
    
    static func make() -> TMBar {
        let bar = TMBarView<TinderBarLayout, TinderBarButton, TMBarIndicator.None>()
        
        bar.isScrollEnabled = false
        
        bar.buttons.customize { (button) in
            button.tintColor = TinderColors.primaryTint
            button.unselectedTintColor = TinderColors.unselectedGray
        }
        
        // Wrap in a 'navigation bar'.
        let navigationBar = TMSystemBar(for: bar)
        navigationBar.backgroundStyle = .flat(color: .white)
        return navigationBar
    }
}
