//
//  ApplicationCoordinator.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/9/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let splashViewController = SplashViewController.instantiate(storyboardName: .splash)
        splashViewController.coordinator = self
        window.rootViewController = splashViewController
        window.makeKeyAndVisible()
    }
    
    func startLoginScenario() {
        childCoordinators = []
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parentCoordinator = self
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
    
    func finishLoginScenario() {
        childCoordinators = []
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.parentCoordinator = self
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}
