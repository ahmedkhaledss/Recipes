//
//  LoginService.swift
//  Recipes
//
//  Created by Ahmed Khaled on 7/27/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    func login(username: String, password: String, onSuccess:  @escaping () -> (), onFailure: @escaping (Error?) -> ()) {
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let error = error {
                onFailure(error)
            }
            else if let _ = result {
                onSuccess()
            }
            else {
                onFailure(nil)
            }
        }
    }
    
    func register(username: String, password: String, onSuccess:  @escaping () -> (), onFailure: @escaping (Error?) -> ()) {
        Auth.auth().createUser(withEmail: username, password: password) {
            result, error in
            if let error = error {
                onFailure(error)
            }
            else if let _ = result {
                onSuccess()
            }
            else {
                onFailure(nil)
            }
        }
    }
}
