//
//  ViewController.swift
//  sr_project
//
//  Created by OS Live Server on 13/11/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    lazy private var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)])
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.next
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField;
    }()
    
    lazy private var emailTextField: UITextField = {
        var textField = UITextField();
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email", attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        )
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.go
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    
    lazy private var passwordTextField: UITextField = {
        var textField = UITextField();
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        )
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.go
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    lazy private var registerButton: UIButton = {
        var btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.backgroundColor = UIColor.systemYellow.cgColor
        btn.layer.cornerRadius = 8
        btn.setTitle("Buat Akun", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        let mySelectedAttributedTitle = NSAttributedString(string: "Click Here",
                                                           attributes: [NSAttributedString.Key.foregroundColor : UIColor.green])
        return btn
    }()
    
    lazy private var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy private var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupView()
    }
    
    
    func setupScrollView(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0).isActive = true
        
        
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 100).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupView(){
        // Do any additional setup after loading the view.
        // add the scroll view to self.view
        contentView.addSubview(usernameTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            usernameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            usernameTextField.heightAnchor.constraint(equalToConstant:40)
        ])
        
        
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -15),
        ])
        
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.heightAnchor.constraint(equalToConstant:40)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
}


extension RegisterViewController : UITextFieldDelegate {
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
