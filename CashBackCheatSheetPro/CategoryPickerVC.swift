//
//  CategoryPickerVC.swift
//  CashBackCheatSheetPro
//
//  Created by Ruslan Suvorov on 3/29/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData //>> refactor to modularize

class CategoryPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var categoryArr = [Category]()
    var cardArr = [Card]()
    var rankingCardInCategoryArr = [RankingCardWithinCategory]()
    
    var cardArray: [String] = []
    var fullCardArray: [Card] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        pickerView.delegate = self
        pickerView.dataSource = self
        
//        seedCategories()
//        seedCards()
//        seedRankingCardWithinCategory()
        printEntities()
        
        cardArr = CardModel.shared.getAll()
        categoryArr = CategoryModel.shared.getAll()
        rankingCardInCategoryArr = RankingCardWithinCategoryModel.shared.getAll()

    }
    override func viewWillAppear(_ animated: Bool){
        print("Load")
        pullFunction()
    }
    func pullFunction() {
        cardArray = []
        for i in cardArr {
            self.cardArray.append(i.title!)
        }
        for i in cardArr {
            
            self.fullCardArray.append(i)
            print("self.fullCardArray: ", self.fullCardArray[0].title!)
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        print("categoryArr.count: ", categoryArr.count)
        return categoryArr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        print("categoryArr[row]: ", categoryArr[row])
        return categoryArr[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func printEntities(){
        categoryArr = CategoryModel.shared.getAll()
        print("******** Category seeded with: *********")
        for i in categoryArr {
            print( i.name! )
        }
        cardArr = CardModel.shared.getAll()
        print("******** Card seeded with: *********")
        for i in cardArr {
            print( i.title!, i.annual_fee!, i.cash_back_terms!, i.link_to_apply!, i.other_terms! )
        }
        print("******** Ranks seeded with: ********")
        for i in rankingCardInCategoryArr {
            print("category \(i.category!.name!), rank \(i.rank), card: \(i.card!.title!)")
        }
    }

    func seedCategories(){
        let categories = [
            "Grocery Stores",
            "Restaurants & Coffee",
            "Gas",
            "Pharmacies",
            "Wholesale Clubs",
            "Select Department Stores",
            "Taxi",
            "Other",
        ]
        for i in categories {
            CategoryModel.shared.create( i )
        }

        categoryArr = CategoryModel.shared.getAll()
//        for i in categoryArr {
//            print("category seeded with:", i.name )
//        }
    }
    
    func seedCards(){
        let cards = [
            [
                "card_title": "Amex Preferred",
                "annual_fee": "$95",
                "cash_back_terms": "6% cash back at U.S. supermarkets (on up to $6,000 per year in purchases, then 1%). 3% cash back at U.S. gas stations and at select U.S. department stores, 1% back on other purchases.",
                "link_to_apply": "https://www.americanexpress.com/us/credit-cards/card-application/apply/amex-everyday-preferred-credit-card/25330-10-0?pmccode=",
                "other_terms": "Terms Apply"
                ],
            [
                "card_title": "Discover it",
                "annual_fee": "No annual fee",
                "cash_back_terms": "APR - JUN 2018 - Grocery Stores. Earn 5% Cashback Bonus at Grocery Stores from April - June 2018, on up to $1,500 in purchases when you activate. Earn 5% cash back at different places each quarter like gas stations, grocery stores, restaurants, Amazon.com, or wholesale clubs up to the quarterly maximum each time you activate. Earn 1% unlimited cash back automatically on all other purchases.",
                "link_to_apply": "https://www.discovercard.com/application/apply?srcCde=GAYP&mboxPage=product_consumer_it",
                "other_terms": "A first-year cash back match for new cardmembers"
            ],
            [
                "card_title": "Chase Freedom",
                "annual_fee": "No annual fee",
                "cash_back_terms": "APR - JUN 2018 - Grocery Stores, not including Walmart and Target. Earn 5% cash back on up to $1,500 in combined purchases in bonus categories each quarter you activate",
                "link_to_apply": "https://applynow.chase.com/FlexAppWeb/renderApp.do?SPID=FQYC&CELL=6TKX&PROMO=DF01",
                "other_terms": "0% intro APR for 15 months from account opening on purchases and balance transfers.† Same page link to Pricing and Terms After that, 16.24%–24.99% variable APR."
            ],
            [
                "card_title": "AmEx Blue Cash Everyday",
                "annual_fee": "No annual fee",
                "cash_back_terms": "3% cash back at U.S. supermarkets (on up to $6,000 per year in purchases, then 1%). 2% cash back at U.S. gas stations and at select U.S. department stores, 1% back on other purchases.",
                "link_to_apply": "https://www.americanexpress.com/us/credit-cards/card-application/apply/blue-cash-everyday-credit-card/25330-10-0?pmccode=",
                "other_terms": "APR: 0% for 15 months on purchases and balance transfers, then a variable rate, currently 14.49% to 25.49%."
            ],
            [
                "card_title": "Savor® Dining Rewards",
                "annual_fee": "No annual fee",
                "cash_back_terms": "Earn unlimited 3% cash back on dining, 2% on groceries and 1% on all other purchases",
                "link_to_apply": "https://applynow.capitalone.com/?productId=2739",
                "other_terms": "0% intro APR for 9 months; 15.74% - 24.49% variable APR after that"
            ],

            [ // INDEX 5
                "card_title": "Citi® Double Cash Card",
                "annual_fee": "No annual fee",
                "cash_back_terms": "Earn cash back on your purchases with one of Citi's best cash back credit cards. The Citi Double Cash card lets you earn cash back twice — 1% unlimited on purchases and an additional 1% as you pay for those purchases.",
                "link_to_apply": "https://www.citicards.com/cards/credit/application/flow.action?app=UNSOL&t=t&sc=4T5ZMEH8&m=31A8L10203W&B=M&ID=3000&uc=H28&ProspectID=PR4pg4EY6vJwsZH22S04ezIAgxhuPiRB&intc=7~7~66~1~PDP~1~citi-double-cash-credit-card~4T5ZMEH831A8L10203W&cmv=426&pid=142&walletSegment=C171_02&rCode=I000",
                "other_terms": "Terms Apply"
            ],

            [
                "card_title": "Chase Freedom Unlimited",
                "annual_fee": "No annual fee",
                "cash_back_terms": "Earn unlimited cash back Earn unlimited 1.5% cash back on every purchase – it's automatic. No minimum to redeem for cash back.",
                "link_to_apply": "https://creditcards.chase.com/cash-back-credit-cards/chase-freedom-unlimited?CELL=6TKX&IP3H=Y71UH0&SP4R=FH24R8&F42G=Y538C4",
                "other_terms": "0% intro APR for 12 months from account opening on purchases and balance transfers.† Same page link to Pricing and Terms After that, 14.24%–24.99% variable APR.† Same page link to Pricing and Terms Balance transfer fee is 5% of the amount transferred with a minimum of $5."
            ],

            [
                "card_title": "Wells Fargo Cash Wise Visa Card",
                "annual_fee": "No annual fee",
                "cash_back_terms": "Earn unlimited 1.5% cash rewards on purchases",
                "link_to_apply": "https://www.wellsfargo.com/wf/product/apply?prodSet=APP2K&prodCode=CC-CW&sub_channel=WEB&vendor_code=WF",
                "other_terms": "Terms apply"
            ],


        ]
        
        for i in cards {
            CardModel.shared.create( title: i["card_title"]!, annual_fee: i["annual_fee"]!, cash_back_terms: i["cash_back_terms"]!, link_to_apply: i["link_to_apply"]!, other_terms: i["other_terms"]! )
        }
        
        cardArr = CardModel.shared.getAll()
//        for i in cardArr {
//            print( "card seeded with:", i.title, i.annual_fee, i.cash_back_terms, i.link_to_apply, i.other_terms )
//        }
    }
    
    
    func seedRankingCardWithinCategory() {
        let ranks = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
        
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[0], category: categoryArr[0] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[1], category: categoryArr[0] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[2], category: categoryArr[0] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[3]), card: cardArr[5], category: categoryArr[0] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[4]), card: cardArr[6], category: categoryArr[0] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[5]), card: cardArr[7], category: categoryArr[0] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[4], category: categoryArr[1] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[5], category: categoryArr[1] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[6], category: categoryArr[1] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[3]), card: cardArr[7], category: categoryArr[1] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[0], category: categoryArr[2] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[3], category: categoryArr[2] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[5], category: categoryArr[2] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[3]), card: cardArr[6], category: categoryArr[2] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[4]), card: cardArr[7], category: categoryArr[2] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[5], category: categoryArr[3] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[6], category: categoryArr[3] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[7], category: categoryArr[3] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[5], category: categoryArr[4] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[6], category: categoryArr[4] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[7], category: categoryArr[4] )
        
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[5], category: categoryArr[5] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[6], category: categoryArr[5] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[7], category: categoryArr[5] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[5], category: categoryArr[6] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[6], category: categoryArr[6] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[7], category: categoryArr[6] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[5], category: categoryArr[7] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[6], category: categoryArr[7] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[2]), card: cardArr[7], category: categoryArr[7] )


        var rankingCardInCategoryArr = [RankingCardWithinCategory]()
//        for i in rankingCardInCategoryArr {
//            print( "ranking seeded with:", i.rank, i.card?.title, i.category?.name )
//        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
        performSegue(withIdentifier: "cardDetails", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexRow = sender as? Int {
        let cardDetailsVC = segue.destination as! CardDetailsVC
        cardDetailsVC.card_title = "\(self.fullCardArray[indexRow].title!)"
        cardDetailsVC.annual_fee = "\(self.fullCardArray[indexRow].annual_fee!)"
        cardDetailsVC.cash_back_terms = "\(self.fullCardArray[indexRow].cash_back_terms!)"
        cardDetailsVC.link_to_apply = "\(self.fullCardArray[indexRow].link_to_apply!)"
        cardDetailsVC.other_terms = "\(self.fullCardArray[indexRow].other_terms!)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension CategoryPickerVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.cardImage.image = #imageLiteral(resourceName: "AmazonPrime.png")
        

        cell.cardTitleLabel.text = "\(cardArray[indexPath.row])"
        

//        cell.cardImage.image = // PLACEHOLDER FOR THE IMAGE
        
        return cell
    }
}
//func printEntities(){
//    categoryArr = CategoryModel.shared.getAll()
//    print("******** Category seeded with: *********")
//    for i in categoryArr {
//        print( i.name! )
//    }
//    cardArr = CardModel.shared.getAll()
//    print("******** Card seeded with: *********")
//    for i in cardArr {
//        print( i.title!, i.annual_fee!, i.cash_back_terms!, i.link_to_apply!, i.other_terms! )
//    }
//    print("******** Ranks seeded with: ********")
//    for i in rankingCardInCategoryArr {
//        print("category \(i.category!.name!), rank \(i.rank), card: \(i.card!.title!)")
//    }
//}

//******** Category seeded with: *********
//Grocery Stores
//Restaurants & Coffee
//Wholesale Clubs
//Select Department Stores
//Gas
//Other
//Taxi
//Pharmacies

//******** Card seeded with: *********
//Amex Preferred $95 6% cash back at U.S. supermarkets (on up to $6,000 per year in purchases, then 1%) - that means spending $60 a week at U.S. supermarkets could earn over $180 back per year. 3% cash back at U.S. gas stations and at select U.S. department stores, 1% back on other purchases. https://www.americanexpress.com/us/credit-cards/card-application/apply/amex-everyday-preferred-credit-card/25330-10-0?pmccode= Terms Apply
//Discover it $0 Cash back terms for Discover it Link to apply for Discover it Terms Apply

