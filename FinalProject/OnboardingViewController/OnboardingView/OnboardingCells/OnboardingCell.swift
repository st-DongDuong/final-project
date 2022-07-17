//
//  OnboardingCell.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/16/22.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCellView: UIImageView!

    override func awakeFromNib() {
    super.awakeFromNib()
    }

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
