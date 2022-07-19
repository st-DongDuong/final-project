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

    enum ColorChange {
        case createAccount
        case login
    }

    var type: ColorChange
    var isValid: Bool {
        return !fullname.isEmpty && !email.isEmpty  && !password.isEmpty
    }

    init(type: ColorChange) {
        self.type = type
    }

    func updateFullName(fullName: String) {
        self.fullname = fullName
    }

    func updateEmail(email: String) {
        self.email = email
    }

    func updatePassword(password: String) {
        self.password = password
    }
}
