//
//  ScenarioViewController.swift
//  AutoInsetter-Playground
//
//  Created by Merrick Sapsford on 11/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class ScenarioViewController<ChildViewControllerType: UIViewController>: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
    
    // MARK: Properties
    
    let scenario: Scenario
    let viewControllers: [UIViewController]
    
    // MARK: Init
    
    init(scenario: Scenario) {
        self.scenario = scenario
        var viewControllers = [UIViewController]()
        for _ in 0 ..< scenario.numberOfPages {
            viewControllers.append(ChildViewControllerType())
        }
        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    // MARK: Lifecycle
    
    override func loadView() {
        super.loadView()
        
        title = scenario.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        dataSource = self
        
        addBar(TMNavigationBar(for: TMBar.ButtonBar()), dataSource: self, at: .top)
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
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItem {
        return TMBarItem(title: "Page Index \(index)")
    }
}
