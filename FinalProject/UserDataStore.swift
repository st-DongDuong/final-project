//
//  UserEmail.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/26/22.
//

import Foundation

protocol UserDataStoreType {
    func getUsers() -> [User]
    func setUser(item: User)
}

final class UserDataStore: UserDataStoreType {
    static let shared = UserDataStore()
    private init() {}
    private let standard = UserDefault.shared
    let kUser = "kUser"
    let kLogin = "kLogin"

    func getUsers() -> [User] {
        let user = standard.getObjects(type: User.self, key: kUser)
        return user
    }

    func setUser(item: User) {
        //        var result: [User] = standard.getObjects(type: User.self, key: kUser) // cho biến lặp qua mảng user
        var result: [User] = getUsers()
        let userByEmail = result.first { user in
            user.email == item.email
        }

        if userByEmail != nil {
            print("Email already exist")

        } else {
            print("create account succed")
            result.append(item)
            standard.saveObjects(result, forKey: kUser)
        }
    }
    func login(item: User) {
        let results = getUsers()
        if let _ =  results.first(where: {$0.email == item.email && $0.password == item.password}) {
            print("Login succed")
        } else {
            print("Login faile")
        }

    }
}
