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
    }
    
    /// bir tab bar arayüzü oluşturarak üç farklı görünüm denetleyicisini ayrı sekmelere yerleştiren controller
    private func setUpTabs() {
        let characterVC = RMCharacterViewController()
        let episodeVC = RMEpisodeViewController()
        let locationVC = RMLocationViewController()
        let learningVC = RMLearningViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        learningVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: episodeVC)
        let nav3 = UINavigationController(rootViewController: locationVC)
        let nav4 = UINavigationController(rootViewController: learningVC)
        
        nav1.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(systemName: "person"),
            tag: 1)
        
        nav2.tabBarItem = UITabBarItem(
            title: "Locations",
            image: UIImage(systemName: "sparkles.tv.fill"),
            tag: 2)

        nav3.tabBarItem = UITabBarItem(
            title: "Episodes",
            image: UIImage(systemName: "location.north.line"),
            tag: 3)
        
        nav4.tabBarItem = UITabBarItem(
            title: "Learning",
            image: UIImage(systemName: "bookmark.square.fill"),
            tag: 4)

        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
    }
    
}

