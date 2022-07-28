//
//  RegistrationAccountViewModel.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/19/22.
//

import Foundation
import UIKit

enum StatusView {
    case createAccount
    case login
}

final class RegistrationAccountViewModel {

    private var fullname: String = ""
    private var email: String = ""
    private var password: String = ""

    var statusView: StatusView

    var isValidRegister: Bool {
        return !fullname.isEmpty && !email.isEmpty  && !password.isEmpty && email.isValidEmail()
    }

    var isValidLogin: Bool {
        return !email.isEmpty  && !password.isEmpty && email.isValidEmail() && password.count >= 6
    }

    init(
        statusView: StatusView
    ) {
        self.statusView = statusView
    }
}

extension RegistrationAccountViewModel {

    func updateFullName(fullName: String) {
        self.fullname = fullName
    }

    func updateEmail(email: String) {
        self.email = email
    }

    func updatePassword(password: String) {
        self.password = password
    }

    func createUser() {
        UserDataStore.shared.setUser(item: User.init(fullname: fullname, email: email, password: password ))
    }

    func login() {
        UserDataStore.shared.login(item: User.init(fullname: fullname, email: email, password: password))
    }
}

struct Account: Codable {
    var email: String
    var password: String
}
