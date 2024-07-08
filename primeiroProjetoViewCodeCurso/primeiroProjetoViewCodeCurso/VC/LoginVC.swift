//
//  ViewController.swift
//  primeiroProjetoViewCodeCurso
//
//  Created by Jefferson Alves on 13/06/24.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
       loginScreen = LoginScreen()
       view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginScreen?.delegate(delegate: self)
        loginScreen?.conficTextFieldDelegate(delegate: self)
        
    }
}

extension LoginVC: LoginScreenProtocol {
    func TappedLoginButton() {
        print("Passou na VC")
    }
    
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let user: String = loginScreen?.userTextField.text ?? ""
        let password: String = loginScreen?.passWordTextField.text ?? ""
        
        if user.isEmpty || password.isEmpty {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.3)
            print("pust deu ruim")
        }else {
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
            print("pust deu bom")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
