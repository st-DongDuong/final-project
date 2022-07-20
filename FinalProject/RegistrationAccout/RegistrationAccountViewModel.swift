//
//  RegistrationAccountViewModel.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/19/22.
//

import Foundation
import UIKit

final class RegistrationAccountViewModel {

    private var fullname: String = ""
    private var email: String = ""
    private var password: String = ""
    var type: ColorChange

    var listAccount: [Account] = []

    enum ColorChange {
        case createAccount
        case login
    }

    var isValidRegister: Bool {
        return !fullname.isEmpty && !email.isEmpty  && !password.isEmpty
    }

    var isValidLogin: Bool {
        return !email.isEmpty  && !password.isEmpty
    }

    init(type: ColorChange, listAccount: [Account] ) {
        self.type = type
        self.listAccount =
                [
                    Account(email: "dong123@gmail.com", password: "123123"),
                    Account(email: "dong123123@gmail.com", password: "123123123")
                ]
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

    func loginCheck() -> Bool {
        for account in listAccount {
            if account.email == email && account.password == password && password.count >= 6 {
                self.fullname = email
                return true
            }
        }
        return false
    }
}

struct Account {
    var email: String
    var password: String
}
