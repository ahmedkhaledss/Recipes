//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Ahmed Khaled on 6/20/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel {
    
    var model: LoginModel
    var firebaseManager = FirebaseManager()
    private let disposeBag = DisposeBag()
    
    var usernameViewModel = UsernameViewModel()
    var passwordViewModel = PasswordViewModel()
    
    // Observables
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var isSuccess: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var errorMessage: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    init(model: LoginModel = LoginModel(username: "", password: "")) {
        self.model = model
        subscripeToCredentials()
    }
    
    private func subscripeToCredentials() {
        usernameViewModel.value
            .asObservable()
            .subscribe(onNext: {[unowned self] username in
                self.model.username = username ?? ""
                print(username ?? "j")
            })
            .disposed(by: disposeBag)
        passwordViewModel.value
            .asObservable()
            .subscribe(onNext: { [unowned self] password in
                self.model.password = password ?? ""
            })
            .disposed(by: disposeBag)
    }
    
    func validateCredentials() -> Bool {
        return usernameViewModel.validate() && passwordViewModel.validate()
    }
    
    func login() {
        if validateCredentials() {
            if let username = usernameViewModel.value.value, let password = passwordViewModel.value.value {
                firebaseManager.login(username: username, password: password, onSuccess: {
                    //TODO: navigate to home using coordinator
                    
                }) { error in
                    //TODO: display error
                }
            }
        }
        else {
            //TODO: display error
        }
    }
}
