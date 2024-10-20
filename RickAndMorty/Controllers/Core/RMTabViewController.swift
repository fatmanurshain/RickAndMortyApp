//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Fatmanur Şahin on 20.10.2024.
//

import UIKit

final class RMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        // Do any additional setup after loading the view.
    }
    private func setUpTabs() {
        let characterVC = RMCharacterViewController()
        let episodeVC = RMEpisodeViewController()
        let locationVC = RMLocationViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: episodeVC)
        let nav3 = UINavigationController(rootViewController: locationVC)
        
        nav1.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "person"),
            tag: 1)
        
        nav2.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "sparkles.tv.fill"),
            tag: 2)

        nav3.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "location.north.line"),
            tag: 3)

        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3],
            animated: true)
    }
    
}

