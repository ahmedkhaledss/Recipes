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
}
