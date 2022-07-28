//
//  NotificateViewModel.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/25/22.
//

import Foundation
final class NotificateViewModel {

    enum NotificateScreen {
        case emailSuccess
        case passwordSuccess
    }

    var type: NotificateScreen

    init(type: NotificateScreen) {
        self.type = type
    }
}
