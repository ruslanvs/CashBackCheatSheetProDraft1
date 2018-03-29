//
//  CardCell.swift
//  CashBackCheatSheetPro
//
//  Created by Ruslan Suvorov on 3/29/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

protocol CardCellDelegate: class {
    // >> remove if this remains unused
}

class CardCell: UITableViewCell {
    weak var delegate: CardCellDelegate? // >> remove if this remains unused
    
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var cardTitleLabel: UILabel!
    
}
