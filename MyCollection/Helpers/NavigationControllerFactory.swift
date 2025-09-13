//
//  NavigationControllerFactory.swift
//  MyCollection
//
//  Created by Diogo Izele on 13/09/25.
//

import UIKit

final class NavigationControllerFactory {
    static func create(rootViewController: UIViewController,
                       title: String,
                       leftIcon: UIImage? = nil,
                       rightButton: UIBarButtonItem? = nil) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.navigationBar.isHidden = true
        
        let topBar = TopBarView()
        topBar.translatesAutoresizingMaskIntoConstraints = false
        
        rootViewController.view.addSubview(topBar)
        
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.topAnchor),
            topBar.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            topBar.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),
            topBar.heightAnchor.constraint(equalToConstant: TopBarView.height)
        ])
        
        
        return nav
    }
}
