//
//  MessagesBar.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 24/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman

class MessagesBar {
    
    typealias BarType = TMBarView<TMHorizontalBarLayout, TMLabelBarButton, TMBarIndicator.None>
    
    static func make() -> BarType {
        let bar = BarType()
        
        bar.layout.contentMode = .fit
        bar.buttons.customize { (button) in
            button.selectedTintColor = TinderColors.primaryTint
            button.tintColor = TinderColors.unselectedGray
            button.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        }
        
        bar.backgroundView.style = .flat(color: .white)
        
        return bar
    }
}

