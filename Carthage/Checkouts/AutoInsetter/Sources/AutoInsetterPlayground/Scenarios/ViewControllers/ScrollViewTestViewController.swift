//
//  ScrollViewTestViewController.swift
//  AutoInsetterPlayground
//
//  Created by Merrick Sapsford on 16/03/2019.
//  Copyright © 2019 UI At Six. All rights reserved.
//

import UIKit

class ScrollViewTestViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        
        label.numberOfLines = 0
        label.text = makeText()
        
        scrollView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            label.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: label.bottomAnchor)
            ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     
        let contentInset = scrollView.contentInset.left + scrollView.contentInset.right
        label.preferredMaxLayoutWidth = scrollView.bounds.size.width - contentInset
    }
}

extension ScrollViewTestViewController {

    private func makeText() -> String {
        return  """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis commodo odio aenean sed. Lectus quam id leo in vitae turpis massa. Vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Laoreet suspendisse interdum consectetur libero id. Ultricies mi quis hendrerit dolor magna eget. Scelerisque fermentum dui faucibus in ornare quam viverra orci. Lacus luctus accumsan tortor posuere ac ut consequat semper viverra. Volutpat diam ut venenatis tellus in metus vulputate eu. In hac habitasse platea dictumst vestibulum. Arcu cursus vitae congue mauris rhoncus. Diam quis enim lobortis scelerisque fermentum dui faucibus. Tempus egestas sed sed risus pretium. Lectus sit amet est placerat in. Facilisi morbi tempus iaculis urna id volutpat lacus laoreet. Iaculis urna id volutpat lacus laoreet. Tristique magna sit amet purus gravida quis blandit.

        Sem fringilla ut morbi tincidunt augue interdum velit. Turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie. Non consectetur a erat nam at lectus urna duis. Ornare aenean euismod elementum nisi quis. Vitae et leo duis ut. Lacus luctus accumsan tortor posuere ac ut. Sollicitudin nibh sit amet commodo. Sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. At volutpat diam ut venenatis tellus in metus vulputate eu. At auctor urna nunc id cursus metus aliquam eleifend. Sed viverra ipsum nunc aliquet bibendum enim facilisis gravida.
        """
    }
}
