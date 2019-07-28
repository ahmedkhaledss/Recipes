//
//  LoginViewController.swift
//  Recipes
//
//  Created by Ahmed Khaled on 6/18/19.
//  Copyright © 2019 Ahmed Khaled. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    var coordinator: LoginCoordinator?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var disposeBag = DisposeBag()
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.rx.text.bind(to: loginViewModel.usernameViewModel.value)
        .disposed(by: disposeBag)
        
        loginButton.rx.tap.subscribe { [weak self] in
            self?.loginViewModel.login()
        }.disposed(by: disposeBag)
    }
}
