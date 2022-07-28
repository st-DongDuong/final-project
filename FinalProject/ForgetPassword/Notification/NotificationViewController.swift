//
//  NotificationViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/25/22.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet private weak var resubmitButton: UIButton!
    @IBOutlet private weak var confirmLabel: UILabel!
    @IBOutlet private weak var descriptLabel: UILabel!
    @IBOutlet private weak var backButton: UIButton!

    var viewModel = NotificateViewModel(type: .emailSuccess)

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 12
        backButton.clipsToBounds = true
        configView()
    }

    private func configView() {
        switch viewModel.type {
        case.emailSuccess:
            backButton.setTitle("Back email", for: .normal)
            descriptLabel.text = "Please check your email for create a new password"
            confirmLabel.text = "Can't get email?"
            resubmitButton.isHidden = false

        case .passwordSuccess:
                backButton.setTitle("Sign in", for: .normal)
                descriptLabel.text = "Congratulations your password has been changed "
            confirmLabel.isHidden = true
                resubmitButton.isHidden = true
        }
    }

    @IBAction func backEmailButtonTouchUpInside(_ sender: Any) {
        let changePass = ChangePasswordViewController()
        present(changePass, animated: true, completion: .none)
    }
}
