//
//  SplashViewController.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/10/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    var coordinator: ApplicationCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.coordinator?.startLoginScenario()
        }
    }

}
