//
//  CardDetailsVC.swift
//  CashBackCheatSheetPro
//
//  Created by Ruslan Suvorov on 3/29/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class CardDetailsVC: UIViewController {
    
    var card_title: String?
    var annual_fee: String?
    var cash_back_terms: String?
    var link_to_apply: String?
    var other_terms: String?

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var OtherTermsOutlet: UILabel!
    @IBOutlet weak var linkToApplyOutlet: UILabel!
    @IBOutlet weak var cashBackOutlet: UILabel!
    @IBOutlet weak var cardTitleOutlet: UILabel!
    @IBOutlet weak var annualFeeOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("card_title: ", card_title!)
        cardTitleOutlet.text = card_title!
        print("cash_back_terms: ", cash_back_terms!)
        cashBackOutlet.text = cash_back_terms!
        print("annual_fee: ", annual_fee!)
        annualFeeOutlet.text = annual_fee!
        print("link_to_apply: ", link_to_apply!)
        linkToApplyOutlet.text = link_to_apply!
        print("other_terms: ", other_terms!)
        OtherTermsOutlet.text = other_terms!
        imageOutlet.image = #imageLiteral(resourceName: "AmazonPrime.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
