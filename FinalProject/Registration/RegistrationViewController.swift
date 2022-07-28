//
//  RegistrationViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/18/22.
//

import UIKit

final class RegistrationViewController: UIViewController {

    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        configureView()
    }

    private func configureView() {
        loginButton.layer.cornerRadius = 12
        createButton.layer.cornerRadius = 12

    }

    @IBAction func createButtonTouchUpInside(_ sender: Any) {
        let createVC = RegistrationAccountViewController()
        createVC.viewModel = RegistrationAccountViewModel(statusView: .createAccount)
//        createVC.modalPresentationStyle = .fullScreen
        self.present(createVC, animated: true, completion: nil)
    }

    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        let loginVC = RegistrationAccountViewController()
        loginVC.viewModel = RegistrationAccountViewModel(statusView: .login)
//        loginVC.modalPresentationStyle = .
        self.present(loginVC, animated: true, completion: nil)
    }
}
