//
//  OnboardingCell.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/16/22.
//

import UIKit

final class OnboardingCell: UICollectionViewCell {

    @IBOutlet private weak var descriptLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageCellView: UIImageView!

    func updateOnboardingCell(data: OnboardingCellData) {
        imageCellView.image = data.imageCell
        titleLabel.text = data.title
        descriptLabel.text = data.descript
    }
}

struct OnboardingCellData {
    var imageCell: UIImage?
    var title: String
    var descript: String
}
