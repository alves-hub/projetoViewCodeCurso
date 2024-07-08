//
//  LoginScreen.swift
//  primeiroProjetoViewCodeCurso
//
//  Created by Jefferson Alves on 13/06/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func TappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
        
    }
 
    // Utilizando o lazy nosso elemento deixa de existir até que ele seja chamado/executado
    lazy var LoginLabel: UILabel = {
        let label = UILabel()
        
        // necessario setar como false para que translatesAutoresizingMaskIntoConstraints nao passe valores de Constraints de forma default
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font  = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    } ()
    
    lazy var NameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Usuário:"
        return label
        
    }()
    
    lazy var passWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Senha:"
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Digite seu email:"
        text.autocorrectionType = .no
        text.backgroundColor = .white
        text.layer.borderWidth = 0.5
        text.borderStyle = .roundedRect
        text.keyboardType = .emailAddress
        text.layer.borderColor = UIColor.black.cgColor
        text.textColor = UIColor.black
        return text
    }()
    
    lazy var passWordTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Digite sua senha:"
        text.autocorrectionType = .no
        text.backgroundColor = .white
        text.layer.borderWidth = 0.5
        text.borderStyle = .roundedRect
        text.keyboardType = .decimalPad
        text.isSecureTextEntry = true
        text.layer.borderColor = UIColor.black.cgColor
        text.textColor = UIColor.black
        return text
    }()
    
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .darkGray.withAlphaComponent(0.3)
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    } ()
    
    @objc func tappedLoginButton (_ sender: UIButton) {
        
        print("Button fufanfo show de bola!!")
    }
    
    //Inicializador
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
        addElement()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func conficTextFieldDelegate(delegate:UITextFieldDelegate){
        userTextField.delegate = delegate
        passWordTextField.delegate = delegate
    }
    
    private func addElement(){
        addSubview(LoginLabel)
        addSubview(NameLabel)
        addSubview(userTextField)
        addSubview(passWordTextField)
        addSubview(loginButton)
        addSubview(passWordLabel)
        
    }
    
    //Constraint EqualTo = referencia por um outro elemento equalToConstant = referencia por um valor fixo
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            LoginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            LoginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            NameLabel.topAnchor.constraint(equalTo: LoginLabel.bottomAnchor, constant: 50),
            NameLabel.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            NameLabel.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            
            userTextField.topAnchor.constraint(equalTo: NameLabel.bottomAnchor, constant: 10),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //utilizado para aumentar altura do elemento
            userTextField.heightAnchor.constraint(equalToConstant: 55),
            
            passWordTextField.topAnchor.constraint(equalTo: passWordLabel.bottomAnchor, constant: 10),
            passWordTextField.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            passWordTextField.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            passWordTextField.heightAnchor.constraint(equalTo: userTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: userTextField.heightAnchor),
            
            passWordLabel.topAnchor.constraint(equalTo: userTextField.topAnchor, constant: 80),
            passWordLabel.leadingAnchor.constraint(equalTo: NameLabel.leadingAnchor),
            passWordLabel.trailingAnchor.constraint(equalTo: NameLabel.trailingAnchor)
            
            
            
            
        ])
    }
    
}
