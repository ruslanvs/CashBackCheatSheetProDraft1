//
//  CategoryPickerVC.swift
//  CashBackCheatSheetPro
//
//  Created by Ruslan Suvorov on 3/29/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class CategoryPickerVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var categoryArr = [Category]()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        seedCategories()
        pickerView.delegate = self
        pickerView.dataSource = self
//        let card = Card()
//        let rankingCardWithinCategory = RankingCardWithinCategory()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("categoryArr.count: ", categoryArr.count)
        return categoryArr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("categoryArr[row]: ", categoryArr[row])
        return categoryArr[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    

    func seedCategories(){
//        let categories = ["Grocery Stores", "Restaurants & Coffee", "Wholesale Clubs", "Select Department Stores", "Gas", "Other", "Taxi", "Pharmacies"]
//        for i in categories {
//            CategoryModel.shared.create( i )
//    }
        categoryArr = CategoryModel.shared.getAll()

//        print("category seeded with:", categoryArr )
        for i in categoryArr {
            print("category seeded with:", i.name )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cardDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cardDetailsVC = segue.destination as! CardDetailsVC
        cardDetailsVC.card_title = "Blue Cash Preferred® Card from American Express"
        cardDetailsVC.annual_fee = "$95"
        cardDetailsVC.cash_back_terms = "6% cash back at U.S. supermarkets (on up to $6,000 per year in purchases, then 1%) - that means spending $60 a week at U.S. supermarkets could earn over $180 back per year. 3% cash back at U.S. gas stations and at select U.S. department stores, 1% back on other purchases."
        cardDetailsVC.link_to_apply = "https://www.americanexpress.com/us/credit-cards/card-application/apply/amex-everyday-preferred-credit-card/25330-10-0?pmccode="
        cardDetailsVC.other_terms = "Terms Apply"
    }
    
}

extension CategoryPickerVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        cell.cardImage.image = #imageLiteral(resourceName: "AmazonPrime.png")
        cell.cardTitleLabel.text = "AmexPreferred"
//        cell.cardImage.image = // PLACEHOLDER FOR THE IMAGE
        
        return cell
    }
}




