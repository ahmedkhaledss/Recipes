//
//  LoginModel.swift
//  Recipes
//
//  Created by Ahmed Khaled on 6/18/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
