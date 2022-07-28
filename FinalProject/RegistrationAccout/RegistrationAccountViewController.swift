//  RegistrationAccountViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/19/22.
//

import UIKit

final class RegistrationAccountViewController: UIViewController {

    var viewModel: RegistrationAccountViewModel?

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var loginView: UIView!
    @IBOutlet private weak var forgotPassword: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var createAccount: UIButton!
    @IBOutlet private weak var googleButton: UIButton!
    @IBOutlet private weak var lineAccount: UIView!
    @IBOutlet private weak var lineLogin: UIView!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var fullNameTextField: UITextField!
    @IBOutlet private weak var fullNameView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureEvent()
        updateView()

    }

    private func configureEvent() {
        fullNameTextField.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passTextFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
    }

    private func configureView() {
        registerButton.layer.cornerRadius = 12
        googleButton.layer.cornerRadius = 12
        containerView.layer.cornerRadius = 36
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    @objc func passTextFieldDidChange(_ textField: UITextField) {
        viewModel?.updatePassword(password: textField.text ?? "")
        updateRegisterButton()
    }

    @objc  func nameTextFieldDidChange(_ textField: UITextField) {
        viewModel?.updateFullName(fullName: textField.text ?? "")
        updateRegisterButton()
    }

    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        viewModel?.updateEmail(email: textField.text ?? "" )
        updateRegisterButton()
    }

    private func updateView() {
        switch viewModel?.statusView {
        case .createAccount:
            fullNameView.isHidden = false
            forgotPassword.isHidden = true
            lineAccount.isHidden = false
            lineLogin.isHidden = true
            loginView.isHidden = false
            loginButton.isHidden = false
            createAccount.setTitleColor(UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1), for: .normal)
            loginButton.setTitleColor(UIColor(red: 0.537, green: 0.565, blue: 0.62, alpha: 1), for: .normal)
            lineAccount.backgroundColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
            loginButton.backgroundColor = .clear
            registerButton.setTitle("Registration", for: .normal)
            googleButton.setTitle("Sign up with Google", for: .normal)
            emailTextField.text = ""
            passwordTextField.text = ""
            fullNameTextField.text = ""

        case .login:

            fullNameView.isHidden = true
            lineAccount.backgroundColor = .clear
            lineLogin.isHidden = false
            lineAccount.isHidden = true
            forgotPassword.isHidden  = false
            loginView.backgroundColor = .clear
            loginButton.setTitleColor(UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1), for: .normal)
            createAccount.setTitleColor(UIColor(red: 0.537, green: 0.565, blue: 0.62, alpha: 1), for: .normal)
            loginButton.backgroundColor = .clear
            createAccount.backgroundColor = .clear
            registerButton.setTitle("Login", for: .normal)
            googleButton.setTitle("Login with Google", for: .normal)
            emailTextField.text = ""
            passwordTextField.text = ""

        default:
                break
        }
    }

    private func updateRegisterButton() {
        switch viewModel?.statusView {
        case .createAccount:
            if viewModel?.isValidRegister == true {
                registerButton.isEnabled = true
                registerButton.backgroundColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
                registerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)

            } else {

                registerButton.isEnabled = false
                registerButton.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
                registerButton.setTitleColor(UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1), for: .normal)
            }

        case .login:
            if viewModel?.isValidLogin == true {
                registerButton.isEnabled = true
                registerButton.backgroundColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1)
                registerButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)

            } else {

                registerButton.isEnabled = false
                registerButton.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
                registerButton.setTitleColor(UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1), for: .normal)
            }

        default:
                break
        }
    }

    @IBAction func createAccountPageButtonTouchUpInside(_ sender: Any) {
        viewModel?.statusView = .createAccount
        updateView()
    }

    @IBAction func loginPageButtonTouchUpInside(_ sender: Any) {
        viewModel?.statusView = .login
        updateView()
    }

    @IBAction func forgotPassButtonTouchUpInside(_ sender: Any) {
        let forgotPassVC = ForgetPasswordViewController()
        present(forgotPassVC, animated: true, completion: .none)
    }

    @IBAction func registerButtonTouchUpInside(_ sender: Any) {
        switch viewModel?.statusView {
        case .createAccount:
                if viewModel?.isValidRegister == true {
                    viewModel?.createUser()
                }

        case .login:
                if viewModel?.isValidLogin == true {
                    viewModel?.login()
                }

        case .none:
                break
        }
    }
}
