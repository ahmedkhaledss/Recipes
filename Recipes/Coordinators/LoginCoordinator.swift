//
//  LoginCoordinator.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/10/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    var parentCoordinator: ApplicationCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate(storyboardName: .login)
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: false)
    }
}
