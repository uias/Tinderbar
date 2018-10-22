//
//  EmbeddedScrollViewTests.swift
//  AutoInsetterTests
//
//  Created by Merrick Sapsford on 18/01/2018.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import XCTest
@testable import AutoInsetter

class EmbeddedScrollViewTests: XCTestCase {
    
    // MARK: Lifecycle
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Tests
    
    func testDetectsEmbeddedScrollViews() {
        let viewController = UIViewController()
        let tableView = UITableView()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        viewController.view.addSubview(tableView)
        viewController.view.addSubview(collectionView)
        
        let embeddedScrollViews = viewController.embeddedScrollViews
        XCTAssert(embeddedScrollViews.count == 2)
    }
    
    func testDetectsNoEmbeddedScrollViews() {
        let viewController = UIViewController()
        
        let embeddedScrollViews = viewController.embeddedScrollViews
        XCTAssertTrue(embeddedScrollViews.isEmpty)
    }
    
    func testDetectsEmbeddedViewControllerScrollViews() {
        let tableViewController = UITableViewController()
        
        let embeddedScrollViews = tableViewController.embeddedScrollViews
        XCTAssert(embeddedScrollViews.count == 1)
    }
}
