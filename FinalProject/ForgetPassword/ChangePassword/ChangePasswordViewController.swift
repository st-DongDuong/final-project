//
//  ChangePasswordViewController.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/25/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    var viewModel: ChangePasswordViewModel = ChangePasswordViewModel()

    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var confirmPassWord: UITextField!
    @IBOutlet private weak var newPassWord: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        newPassWord.addTarget(self, action: #selector(newPassTextFieldDidChange(_:)), for: .editingChanged)
        confirmPassWord.addTarget(self, action: #selector(confirmTextFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func submitButtonTouchUpInside(_ sender: Any) {
        if viewModel.isValid {
            let notificateVC = NotificationViewController()
            notificateVC.viewModel = NotificateViewModel(type: .passwordSuccess)
            present(notificateVC, animated: true, completion: .none)
            updateButton()  
        } else {

            return
        }
    }
    private func radiusView() {
        submitButton.layer.cornerRadius = 12
        confirmPassWord.layer.cornerRadius = 12
    }
    @objc func newPassTextFieldDidChange(_ textField: UITextField) {
        viewModel.updatePass(newPass: textField.text ?? "")
        updateButton()
    }

    @objc func confirmTextFieldDidChange(_ textField: UITextField) {
        viewModel.updateConfirm(confirm: textField.text ?? "")
        updateButton()
    }

    func updateButton() {
        if viewModel.isValid {
            newPassWord.layer.borderWidth = 0.5
            newPassWord.layer.borderColor = UIColor.gray.cgColor
            confirmPassWord.layer.borderWidth = 0.5
            confirmPassWord.layer.borderColor = UIColor.gray.cgColor
            submitButton.layer.backgroundColor = UIColor(red: 0.196, green: 0.718, blue: 0.408, alpha: 1).cgColor
            submitButton.isEnabled = true
            submitButton.setTitle("Reset Password", for: .normal)
            submitButton.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        } else {

            submitButton.isEnabled = false
            submitButton.layer.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1).cgColor
            submitButton.setTitle("Submit", for: .normal)
        }
    }
}
