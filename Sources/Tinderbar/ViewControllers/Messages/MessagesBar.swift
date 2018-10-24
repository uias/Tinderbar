//
//  MessagesBar.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 24/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import Tabman

class MessagesBar {
    
    static func make() -> TMBar {
        let bar = TMBarView<TMHorizontalBarLayout, TMLabelBarButton, TMBarIndicator.None>()
        
        bar.layout.contentMode = .fit
        
        return bar
    }
}

