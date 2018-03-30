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
        let categories = ["Grocery Stores", "Restaurants & Coffee", "Wholesale Clubs", "Select Department Stores", "Gas", "Other", "Taxi", "Pharmacies"]
        for i in categories {
            CategoryModel.shared.create( i )
        }

        categoryArr = CategoryModel.shared.getAll()
        for i in categoryArr {
            print("category seeded with:", i.name )
        }
    }
    
    func seedCards(){
        let cards = [
            [
                "card_title": "Amex Preferred",
                "annual_fee": "$95",
                "cash_back_terms": "6% cash back at U.S. supermarkets (on up to $6,000 per year in purchases, then 1%) - that means spending $60 a week at U.S. supermarkets could earn over $180 back per year. 3% cash back at U.S. gas stations and at select U.S. department stores, 1% back on other purchases.",
                "link_to_apply": "https://www.americanexpress.com/us/credit-cards/card-application/apply/amex-everyday-preferred-credit-card/25330-10-0?pmccode=",
                "other_terms": "Terms Apply"
                ],
            [
                "card_title": "Discover it",
                "annual_fee": "$0",
                "cash_back_terms": "Cash back terms for Discover it",
                "link_to_apply": "Link to apply for Discover it",
                "other_terms": "Terms Apply"
            ],
        ]
        
        for i in cards {
            CardModel.shared.create( title: i["card_title"]!, annual_fee: i["annual_fee"]!, cash_back_terms: i["cash_back_terms"]!, link_to_apply: i["link_to_apply"]!, other_terms: i["other_terms"]! )
        }
        
        cardArr = CardModel.shared.getAll()
        for i in cardArr {
            print( "card seeded with:", i.title, i.annual_fee, i.cash_back_terms, i.link_to_apply, i.other_terms )
        }
    }
    
    
    func seedRankingCardWithinCategory() {
        let ranks = [ 0, 1 ]
        
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[0], category: categoryArr[0] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[1], category: categoryArr[0] )
        
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[0], category: categoryArr[1] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[1], category: categoryArr[1] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[0], category: categoryArr[2] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[1], category: categoryArr[2] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[0], category: categoryArr[3] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[1], category: categoryArr[3] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[0], category: categoryArr[4] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[1], category: categoryArr[4] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[0], category: categoryArr[5] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[1], category: categoryArr[5] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[0], category: categoryArr[6] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[1], category: categoryArr[6] )

        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[1]), card: cardArr[0], category: categoryArr[7] )
        RankingCardWithinCategoryModel.shared.create( rank: Int16(ranks[0]), card: cardArr[1], category: categoryArr[7] )

        var rankingCardInCategoryArr = [RankingCardWithinCategory]()
        for i in rankingCardInCategoryArr {
            print( "ranking seeded with:", i.rank, i.card?.title, i.category?.name )
        }
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

