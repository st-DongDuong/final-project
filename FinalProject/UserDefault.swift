//
//  UserDefault.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/26/22.
//

import UIKit
import Foundation
import Darwin

class UserDefault {

    static let shared = UserDefault()
    private init() {}
    private let standard = UserDefaults.standard
    func setValue(_ value: Any?, forKey: String) {
        standard.set(value, forKey: forKey)
    }

    func getValue(forKey: String) -> Any? {
        standard.value(forKey: forKey)
    }

    func saveObject<T: Codable>(_ value: T?, forKey: String) {
        let encoder = JSONEncoder()
        if let data: Data = try? encoder.encode(value) {
        standard.set(data, forKey: forKey)
        }
    }

    func saveObjects<T: Codable>(_ value: [T]?, forKey: String) {
        let encoder = JSONEncoder()
        if let data: Data = try? encoder.encode(value) {
            standard.set(data, forKey: forKey)
        }
    }

    func getObject<T: Codable>(type: T.Type, key: String) -> T? {
        let decoder = JSONDecoder()
        if let data = standard.value(forKey: key) as? Data {
            let result = try? decoder.decode(T.self, from: data)
            return result
        }
        return nil
    }

    func getObjects<T: Codable>(type: T.Type, key: String) -> [T] {
        let decoder = JSONDecoder()
        if let data = standard.value(forKey: key) as? Data {
            let result = try? decoder.decode([T].self, from: data)
            return result ?? []
        }
        return []
    }
}
