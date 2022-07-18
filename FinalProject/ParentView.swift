//
//  ParentView.swift
//  FinalProject
//
//  Created by Dong Duong V. on 7/16/22.
//
import Foundation
import UIKit

open class ParentView: UIView {

    open var bundle: Bundle? {
        return Bundle.main
    }

    open var xibName: String {
        return String(describing: type(of: self))
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        loadNib()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func loadNib() {
        var xib: String?
        if bundle?.path(forResource: xibName, ofType: "nib") != nil {
            xib = xibName
        }

        if let xib = xib, let view = bundle?.loadNibNamed(xib, owner: self)?.first as? UIView {
            addSubview(view)
            view.frame = bounds
            constrainToEdges(view)
        }
    }
}

extension UIView {
    func constrainToEdges(_ subview: UIView, insets: UIEdgeInsets = .zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        subview.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
