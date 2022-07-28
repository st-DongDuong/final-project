//
//  ChangePasswordViewModel.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/25/22.
//

import Foundation

final class ChangePasswordViewModel {
    var newPass: String = ""
    var confirm: String = ""

    var isValid: Bool {
        return !newPass.isEmpty && !confirm.isEmpty && newPass == confirm
    }

    func updatePass(newPass: String) {
        self.newPass = newPass
    }

    func updateConfirm(confirm: String) {
        self.confirm = confirm
    }
}

struct User: Codable {
    var fullname: String
    var email: String
    var password: String
}
