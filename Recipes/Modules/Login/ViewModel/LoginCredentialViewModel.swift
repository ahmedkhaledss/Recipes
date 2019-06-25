//
//  LoginCredentialViewModel.swift
//  Recipes
//
//  Created by Ahmed Khaled on 6/18/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol LoginCredentialViewModel {
    
    // Properties
    var title: String { get }
    var errorMessage: String { get set }
    
    // Observables
    var value: BehaviorRelay<String?> { get set }
    var errorValue: BehaviorRelay<String?> { get set }
    
    // Validation
    func validate() -> Bool
}

extension LoginCredentialViewModel {
    
    func validateSize(_ value: String?, size: (min: Int, max: Int)) -> Bool {
        if let value = value {
            return (size.min...size.max).contains(value.count)
        }
        else {
            return false
        }
    }
    func validatePattern(_ value: String?, pattern: String) -> Bool {
        let testPredicate = NSPredicate(format:"SELF MATCHES %@", pattern)
        return testPredicate.evaluate(with: value)
    }
}
