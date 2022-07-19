//
//  RegistrationViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/18/22.
//

import UIKit
class RegistrationViewController: UIViewController {

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

    @IBAction func createButton(_ sender: Any) {
        let createVC = RegistrationAccountViewController(status: .createAccount)
        navigationController?.pushViewController(createVC, animated: true)
    }

    @IBAction func loginButton(_ sender: Any) {
        let loginVC = RegistrationAccountViewController(status: .login)
        if let sheet = loginVC.sheetPresentationController {
            sheet.detents = [ .medium() ] // present lên nửa or full
        }

        self.present(loginVC, animated: true, completion: nil)
    }
}
