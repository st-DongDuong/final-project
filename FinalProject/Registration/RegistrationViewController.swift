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
        configureView()
        navigationController?.isNavigationBarHidden = true
    }

    private func configureView() {
        loginButton.layer.cornerRadius = 12
        loginButton.clipsToBounds = true
        createButton.layer.cornerRadius = 12
        createButton.clipsToBounds = true
    }
}
