//
//  MessagesTabViewController.swift
//  Tinderbar
//
//  Created by Merrick Sapsford on 24/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class MessagesTabViewController: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
    
    enum Tab: String, CaseIterable {
        case messages
        case feed
    }
    
    private let tabItems = Tab.allCases.map({ BarItem(for: $0) })
    private lazy var viewControllers = tabItems.compactMap({ $0.makeViewController() })
    
    let bar = MessagesBar.make()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        addBar(bar, dataSource: self, at: .top)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bar.layer.masksToBounds = false
        bar.layer.shadowColor = UIColor.black.cgColor
        bar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        bar.layer.shadowOpacity = 0.1
        bar.layer.shadowPath = UIBezierPath(rect: bar.bounds).cgPath
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
    
    // MARK: TMBarDataSource
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        return tabItems[index]
    }
}

private class BarItem: TMBarItemable {
    
    let tab: MessagesTabViewController.Tab
    
    init(for tab: MessagesTabViewController.Tab) {
        self.tab = tab
    }
    
    var title: String? {
        return tab.rawValue.capitalized
    }
    var image: UIImage? {
        return nil
    }
    
    func makeViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Messages", bundle: nil)
        let viewControllerId: String
        switch tab {
        case .messages:
            viewControllerId = "MessagesViewController"
        case .feed:
            viewControllerId = "MessagesFeedViewController"
        }
        
        return storyboard.instantiateViewController(withIdentifier: viewControllerId)
    }
}
