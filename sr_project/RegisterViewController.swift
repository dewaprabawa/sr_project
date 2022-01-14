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
        textField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        textField.keyboardType = UIKeyboardType.default
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.setRoundedBoxShadow()
        return textField;
    }()
    
    lazy private var emailTextField: UITextField = {
        var textField = UITextField();
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email", attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        )
        textField.keyboardType = UIKeyboardType.default
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.setRoundedBoxShadow()
        return textField
    }()
    
    
    lazy private var passwordTextField: UITextField = {
        var textField = UITextField();
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password", attributes: [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        )
        textField.keyboardType = UIKeyboardType.default
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.setRoundedBoxShadow()
        return textField
    }()
    
    lazy private var registerButton: UIButton = {
        var btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        let mySelectedAttributedTitle = NSAttributedString(string: "Buat Akun",
                                                           attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
        btn.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
        btn.setRoundedBoxShadow(color: UIColor.systemYellow, radius: 10, opacity: 0.2)
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
        setupBackgroundColor()
        setTextFieldDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: .UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .UIResponder.keyboardWillShowNotification , object: nil)
    }
    
    func setTextFieldDelegate(){
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setupBackgroundColor(){
        view.backgroundColor = UIColor.systemGray6
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            usernameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            usernameTextField.heightAnchor.constraint(equalToConstant:40),
                ])
        
        
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant:40)
        ])
        
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant:40)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    
    @objc func dismissKeyboard(){
        contentView.endEditing(true)
    }
    
    @objc
    func keyboardWillAppear(notification: NSNotification?) {

        guard let keyboardFrame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardHeight: CGFloat
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }

    }

    
}


extension RegisterViewController : UITextFieldDelegate {
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == self.usernameTextField){
            scrollView.scrollToTop()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.usernameTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.passwordTextField.becomeFirstResponder()
        default:
            self.passwordTextField.resignFirstResponder()
        }
    }
    
}

extension UITextField {
    func setRoundedBoxShadow(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.2
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = leftPadding
        self.leftViewMode = .always
        self.backgroundColor = UIColor.white
        self.layer.shadowOffset = CGSize(width: -1, height: 4)
    }
}


extension UIButton {
    func setRoundedBoxShadow(color backgroundColor: UIColor, radius borderRadius: CGFloat, opacity shadowOpacity: Float){
        self.layer.cornerRadius = borderRadius
        self.clipsToBounds = false
        self.layer.shadowOpacity = shadowOpacity
        self.backgroundColor = backgroundColor
        self.layer.shadowOffset = CGSize(width: -1, height: 4)
    }
}


extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top + keyboardFrame.cgRectValue.height)
        setContentOffset(desiredOffset, animated: true)
   }
}
