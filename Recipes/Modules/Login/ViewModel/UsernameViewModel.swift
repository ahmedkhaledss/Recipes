//
//  UsernameViewModel.swift
//  Recipes
//
//  Created by Ahmed Khaled on 6/19/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UsernameViewModel: LoginCredentialViewModel {
    
    var title: String = "Username"
    var errorMessage: String = "Wrong Email !"
    var value: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    func validate() -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@([A-Za-z0-9.-]{2,64})+\\.[A-Za-z]{2,64}"
        guard validatePattern(value.value, pattern:emailPattern) else {
            errorValue.accept(errorMessage)
            return false
        }
        errorValue.accept(nil)
        return true
    }
}
