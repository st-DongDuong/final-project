//  RegistrationAccountViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/19/22.
//

import UIKit

class RegistrationAccountViewController: UIViewController {

    enum StatusView {
        case createAccount
        case login
    }

    var statusView: StatusView = .login
    var viewModel: RegistrationAccountViewModel = RegistrationAccountViewModel(type: .createAccount, listAccount: [])

    convenience init(status: StatusView) {
        self.init(nibName: nil, bundle: nil)
        self.statusView = status
    }

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var lineAccount: UIView!
    @IBOutlet weak var lineLogin: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var fullNameView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureEvent()
    }

    private func configureEvent() {
        fullNameTextField.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passTextFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
    }

    private func configureView() {
        registerButton.layer.cornerRadius = 12
        googleButton.layer.cornerRadius = 12
    }

    @objc func passTextFieldDidChange(_ textField: UITextField) {
        viewModel.updatePassword(password: textField.text ?? "")
        updateRegisterButton()
    }

    @objc  func nameTextFieldDidChange(_ textField: UITextField) {
        viewModel.updateFullName(fullName: textField.text ?? "")
        updateRegisterButton()
    }

    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        viewModel.updateEmail(email: textField.text ?? "" )
        updateRegisterButton()
    }

    private func updateView(status: StatusView ) {
        switch status {
        case .createAccount:
            fullNameView.isHidden = false
            forgotPassword.isHidden = true
            lineAccount.isHidden = false
            lineLogin.isHidden = true
            loginView.isHidden = false
            loginButton.isHidden = false
            createAccount.tintColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
            loginButton.tintColor = UIColor(red: 0.537, green: 0.565, blue: 0.62, alpha: 1)
            lineAccount.backgroundColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
            loginButton.backgroundColor = .clear
            registerButton.setTitle("Registration", for: .normal)
            googleButton.setTitle("Sign up with Google", for: .normal)

        case .login:
            fullNameView.isHidden = true
            lineAccount.backgroundColor = .clear
            lineLogin.isHidden = false
            lineAccount.isHidden = true
            forgotPassword.isHidden  = false
            loginView.backgroundColor = .clear
            createAccount.tintColor =  UIColor(red: 0.537, green: 0.565, blue: 0.62, alpha: 1)
            loginView.tintColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
            loginButton.backgroundColor = .clear
            createAccount.backgroundColor = .clear
            registerButton.setTitle("Login", for: .normal)
            googleButton.setTitle("Login with Google", for: .normal)
        }
    }

    func updateRegisterButton() {
        if viewModel.isValidRegister {
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
            registerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)

        } else {

            registerButton.isEnabled = false
            registerButton.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
            registerButton.setTitleColor(UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1), for: .normal)
        }
    }

    @IBAction func createAccountPage(_ sender: Any) {
        updateView(status: .createAccount)
    }

    @IBAction func loginPage(_ sender: Any) {
        updateView(status: .login)
    }

    @IBAction func loginButton(_ sender: Any) {
        if viewModel.isValidLogin {
        let registerVC = RegistrationViewController()
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }
}
