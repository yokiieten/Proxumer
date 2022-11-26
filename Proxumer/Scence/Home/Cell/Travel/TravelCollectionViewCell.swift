//
//  TravelCollectionViewCell.swift
//  Proxumer
//
//  Created by Sahassawat on 26/11/2565 BE.
//

import UIKit

class TravelCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setBoder(vaule: Bool) {
        self.borderColor = vaule ? .red : .green
    }

}
