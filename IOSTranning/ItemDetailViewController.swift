//
//  ItemDetailViewController.swift
//  IOSTranning
//
//  Created by twer on 6/23/15.
//  Copyright (c) 2015 twer. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UITextView!
    @IBOutlet weak var itemDescription: UITextView!
    
    var itemTableViewCell:ItemTableViewCell!
    
    override func viewDidLoad() {
        itemImage.image = itemTableViewCell.imageComponent.image
        itemTitle.text = itemTableViewCell.titleLabel.text
        itemDescription.text = itemTableViewCell.descriptionLabel.text
    }
}
