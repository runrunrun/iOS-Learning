//
//  CollectionViewCell.swift
//  Parallax
//
//  Created by Hari Kunwar on 9/5/18.
//  Copyright © 2018 Learning. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    weak var titleLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.adjustsImageWhenAncestorFocused = true
        clipsToBounds = false
        setupOverlayView()
    }
    
    private func setupOverlayView() {
        let parentView = imageView.overlayContentView

        let titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.textColor = UIColor.red
        parentView.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 40).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 40).isActive = true
        titleLabel.rightAnchor.constraint(lessThanOrEqualTo: parentView.rightAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: parentView.bottomAnchor, constant: 10).isActive = true
        self.titleLabel = titleLabel
    }
}
