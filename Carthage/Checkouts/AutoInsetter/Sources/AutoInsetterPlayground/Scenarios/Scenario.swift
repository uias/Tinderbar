//
//  Scenario.swift
//  AutoInsetter-Playground
//
//  Created by Merrick Sapsford on 11/10/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

enum Scenario: CaseIterable {
    case uiTableView
    case uiTableViewController
    case uiCollectionView
}

extension Scenario {
    
    var title: String {
        switch self {
        case .uiTableView:
            return "UITableView"
        case .uiTableViewController:
            return "UITableViewController"
        case .uiCollectionView:
            return "UICollectionView"
        }
    }
    
    var numberOfPages: Int {
        return 5
    }
}

extension Scenario {
    
    func makeViewController() -> UIViewController {
        switch self {
        case .uiTableView:
            return ScenarioViewController<TableViewTestViewController>.init(scenario: self)
        case .uiCollectionView:
            return ScenarioViewController<CollectionViewTestViewController>.init(scenario: self)
        case .uiTableViewController:
            return ScenarioViewController<UITableViewController>.init(scenario: self)
        }
    }
}
