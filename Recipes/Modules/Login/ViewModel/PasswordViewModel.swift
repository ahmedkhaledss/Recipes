//
//  passwordViewModel.swift
//  Recipes
//
//  Created by Ahmed Khaled on 6/20/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PasswordViewModel: LoginCredentialViewModel {
    
    var title: String = "Password"
    var errorMessage: String = "Wrong Password !"
    var value: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var isSecureTextEntry: Bool = true
    
    func validate() -> Bool {
        guard validateSize(value.value, size: (6,25)) else {
            return false
        }
        errorValue.accept(nil)
        return true
    }
}
