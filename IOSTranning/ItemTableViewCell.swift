//
//  ItemTableViewCell.swift
//  IOSTranning
//
//  Created by twer on 6/9/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UITextView!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
//    @IBOutlet weak var imageComponent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
