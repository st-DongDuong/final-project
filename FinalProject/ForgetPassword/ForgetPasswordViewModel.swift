//
//  File.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/22/22.
//

import Foundation
final class ForgetPasswordViewModel {

    var email: String = ""

    var isValidEmail: Bool {
        return !email.isEmpty && email.isValidEmail()
    }

    func updateEmail(email: String) {
        self.email = email
    }

    func getNewEmail() {
        UserDataStore.shared.setUser(item: User(fullname: "", email: email, password: ""))
    }
}

extension ForgetPasswordViewModel {
    func updateEmail(_ email: String) {
        self.email = email
    }
}
