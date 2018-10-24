//
//  RootTabViewController.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 22/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class RootTabViewController: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
    
    enum Tab: String, CaseIterable {
        case profile
        case matches
        case messages
    }
    
    private let tabItems = Tab.allCases.map({ BarItem(for: $0) })
    private lazy var viewControllers = tabItems.compactMap({ $0.makeViewController() })
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        addBar(TMSystemBar(for: TinderBar()), dataSource: self, at: .top)
    }
    
    // MARK: PageboyViewControllerDataSource
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        return tabItems[index]
    }
}

private class BarItem: TMBarItemable {
    
    let tab: RootTabViewController.Tab
    
    init(for tab: RootTabViewController.Tab) {
        self.tab = tab
    }
    
    var title: String? {
        return tab.rawValue.capitalized
    }
    
    var image: UIImage? {
        return UIImage(named: "ic_\(tab.rawValue)")
    }
    
    func makeViewController() -> UIViewController? {
        let storyboardName: String
        switch tab {
        case .profile:
            storyboardName = "Profile"
        case .matches:
            storyboardName = "Matches"
        case .messages:
            storyboardName = "Messages"
        }
        
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()
    }
}
