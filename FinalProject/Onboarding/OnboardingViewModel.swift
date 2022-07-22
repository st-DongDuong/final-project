//
//  OnboardingViewModel.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/18/22.
//

import Foundation
import UIKit

final class OnboardingViewModel {

    var onboardata: [Onboardatas] =
    [
    Onboardatas(imageOnboard: UIImage(named: "img-onboarding-first"),
                title: "Nearby restaurants",
                discript: """
                You don't have to go far to find a good restaurant,
                we have provided all the restaurants that is near you
                """),
    Onboardatas(imageOnboard: UIImage(named: "img-onboarding-second"),
                title: "Select the Favorites Menu",
                discript: "Now eat well, don't leave the house,You can choose your favorite food only with one click"),
    Onboardatas(imageOnboard: UIImage(named: "img-onboarding-third"),
                title: "Good food at a cheap price",
                discript: "You can eat at expensive restaurants with affordable price")
    ]
}

extension OnboardingViewModel {
    func numberOfSection() -> Int {
        1
    }

    func numberPage() -> Int {
        return onboardata.count
    }

    func dataForItems(at indexPath: IndexPath) -> OnboardingCellData {
        let item = onboardata[indexPath.item]
        return OnboardingCellData(imageCell: item.imageOnboard, title: item.title, descript: item.discript)
    }
}

struct Onboardatas {
    var imageOnboard: UIImage?
    var title: String
    var discript: String
}
