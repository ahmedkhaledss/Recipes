//
//  StoryboardName.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/9/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation
enum StoryboardName: String {
    case splash
    case login
    case home
    
    var fileName: String {
        return self.rawValue.prefix(1).uppercased() + self.rawValue.dropFirst()
    }
}
