//
//  HomeCoordinator.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/10/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var parentCoordinator: ApplicationCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController.instantiate(storyboardName: .home)
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
