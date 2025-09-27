//
//  MainTabBarController.swift
//  MyCollection
//
//  Created by Diogo Izele on 13/09/25.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        
        let homeVC = DIContainer.shared.makeHomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: setupIcon(named: "house-solid-full"), tag: 0)
        
        let collectionVC = CollectionsViewController()
        collectionVC.tabBarItem = UITabBarItem(title: "Coleções", image: setupIcon(named: "layer-group-solid-full"), tag: 1)
        
        let statisticsVC = StatisticsViewController()
        statisticsVC.tabBarItem = UITabBarItem(title: "Estatísticas", image: setupIcon(named: "chart-simple-solid-full"), tag: 2)
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Perfil", image: setupIcon(named: "user-solid-full"), tag: 3)
    
        setupUI()
        
        viewControllers = [
            NavigationControllerFactory.create(rootViewController: homeVC, title: "MyCollection"),
            NavigationControllerFactory.create(rootViewController: collectionVC, title: "MyCollection"),
            NavigationControllerFactory.create(rootViewController: statisticsVC, title: "MyCollection"),
            NavigationControllerFactory.create(rootViewController: profileVC, title: "MyCollection")
        ]
    }
    
    private func setupIcon(named: String) -> UIImage {
        let size = CGSize(width: 24, height: 24)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            UIImage(named: named)?.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    private func setupUI() {
        tabBar.tintColor = .primary
        tabBar.unselectedItemTintColor = .secondary
        
        let line = UIView()
        line.backgroundColor = UIColor.systemGray5
        line.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(line)
        
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: tabBar.topAnchor),
            line.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
