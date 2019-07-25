//
//  Storyboarded.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/9/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName: StoryboardName) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName: StoryboardName) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.fileName, bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: id) as! Self
        return vc
    }
}

extension UIViewController: Storyboarded {}
