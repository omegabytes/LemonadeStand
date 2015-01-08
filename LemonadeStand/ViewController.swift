//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Alex Gaesser on 12/30/14.
//  Copyright (c) 2014 AlexGaesser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var fundsLabel: UILabel!
    @IBOutlet weak var numberOfLemonsLabel: UILabel!
    @IBOutlet weak var numberOfIceCubesLabel: UILabel!
    @IBOutlet weak var numberOfLemonsToBuyLabel: UILabel!
    @IBOutlet weak var numberOfIceCubesToBuyLabel: UILabel!
    @IBOutlet weak var numberOfLemonsToMixLabel: UILabel!
    @IBOutlet weak var numberOfIceCubesToMixLabel: UILabel!
    @IBOutlet weak var statusFieldLabel: UILabel!

    var funds = 10
    var lemons = Ingredient()
    var iceCubes = Ingredient()
    var customer:[Customer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        lemons.amount = 1
        lemons.price = 2
        lemons.purchaseAmount = 0
        lemons.mixAmount = 0
        lemons.purchaseCost = lemons.purchaseAmount * lemons.price
        
        iceCubes.amount = 1
        iceCubes.price = 1
        iceCubes.purchaseAmount = 0
        iceCubes.mixAmount = 0
        iceCubes.purchaseCost = iceCubes.purchaseAmount * iceCubes.price
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IBActions
 
    @IBAction func buyLemonsButton(sender: AnyObject) {
        if funds <= 0 {
            showAlertWithText(header: "No Money", message: "You're out of cash!")
        }
        else {
            funds -= 2
            fundsLabel.text = "$\(funds)"
            lemons.purchaseAmount += 1
            numberOfLemonsToBuyLabel.text = "\(lemons.purchaseAmount)"
            lemons.amount += 1
            numberOfLemonsLabel.text = "\(lemons.amount) Lemon(s)"
        }

    }
   
    @IBAction func sellLemonsButton(sender: AnyObject) {
        if lemons.purchaseAmount <= 0 {
            showAlertWithText(header: "No Lemons", message: "You don't have any more lemons.")
        }
        else {
            funds += 2
            fundsLabel.text = "$\(funds)"
            lemons.purchaseAmount -= 1
            numberOfLemonsToBuyLabel.text = "\(lemons.purchaseAmount)"
            lemons.amount -= 1
            numberOfLemonsLabel.text = "\(lemons.amount) Lemon(s)"
        }
    }
    
    @IBAction func buyIceButton(sender: AnyObject) {
        if funds <= 0 {
            showAlertWithText(header: "No Money", message: "You're out of cash!")
        }
        else {
            funds -= 1
            fundsLabel.text = "$\(funds)"
            iceCubes.purchaseAmount += 1
            numberOfIceCubesToBuyLabel.text = "\(iceCubes.purchaseAmount)"
            iceCubes.amount += 1
            numberOfIceCubesLabel.text = "\(iceCubes.amount) Ice Cube(s)"
        }
    }
    
    @IBAction func sellIceButton(sender: AnyObject) {
        if iceCubes.purchaseAmount <= 0 {
            showAlertWithText(header: "No Ice Cubes", message: "You don't have any more ice.")
        }
        else {
            funds += 1
            fundsLabel.text = "$\(funds)"
            iceCubes.purchaseAmount -= 1
            numberOfIceCubesToBuyLabel.text = "\(iceCubes.purchaseAmount)"
            iceCubes.amount -= 1
            numberOfIceCubesLabel.text = "\(iceCubes.amount) Ice Cube(s)"
        }
    }
    
    @IBAction func addLemonsToMixButton(sender: AnyObject) {
        if lemons.amount <= 0 {
            showAlertWithText(header: "Unable to add", message: "You don't have any more lemons.")
        }
        else {
            lemons.amount -= 1
            numberOfLemonsLabel.text = "\(lemons.amount) Lemon(s)"
            lemons.mixAmount += 1
            numberOfLemonsToMixLabel.text = "\(lemons.mixAmount)"
        }
    }
    
    @IBAction func removeLemonsFromMixButton(sender: AnyObject) {
        if lemons.mixAmount <= 0 {
            showAlertWithText(header: "Unable to remove", message: "No lemons left in the mix.")
        }
        else {
            lemons.mixAmount -= 1
            numberOfLemonsToMixLabel.text = "\(lemons.mixAmount)"
            lemons.amount += 1
            numberOfLemonsLabel.text = "\(lemons.amount) Lemon(s)"
        }
    }
    
    @IBAction func addIceToMixButton(sender: AnyObject) {
        if iceCubes.amount <= 0 {
            showAlertWithText(header: "Unable to add", message: "You don't have any more ice.")
        }
        else {
            iceCubes.amount -= 1
            numberOfIceCubesLabel.text = "\(iceCubes.amount) Ice Cube(s)"
            iceCubes.mixAmount += 1
            numberOfIceCubesToMixLabel.text = "\(iceCubes.mixAmount)"
        }
    }
    
    @IBAction func removeIceFromMixButton(sender: AnyObject) {
        if iceCubes.mixAmount <= 0 {
            showAlertWithText(header: "Unable to remove", message: "No ice left in the mix.")
        }
        else {
            iceCubes.mixAmount -= 1
            numberOfIceCubesToMixLabel.text = "\(iceCubes.mixAmount)"
            iceCubes.amount += 1
            numberOfIceCubesLabel.text = "\(iceCubes.amount) Ice Cube(s)"
            
        }
    }
    
    @IBAction func startDayButton(sender: AnyObject) {
        if lemons.mixAmount == 0 && iceCubes.mixAmount == 0 {
            showAlertWithText(header: "Unable to Start Day", message: "You have nothing to sell!")
        }
        else {
            var beverageRatio = self.drinkRatio(iceCubes.mixAmount, lemons: lemons.mixAmount)
            customerGenerator()
            var tastePreference = customerTasteProfile()
            compareAndCalculate(tastePreference, lemonade: beverageRatio)
            
            
        }
    }
    
    

    func showAlertWithText (header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
        func drinkRatio (ice : Int, lemons : Int) -> Double {
        
        var ratio = Double(lemons)/Double(ice)
            println(ratio)
        
        return ratio
    }
    
    func customerGenerator () {
        let numberOfCustomers = Int(arc4random_uniform(UInt32(9)))
        println("The number of customers is \(numberOfCustomers)")
        
//        for tasteIndex in customer {
//            let tasteIndex = 1.0 / Double(arc4random_uniform(UInt32(9)))
//        println("The taste index is \(tasteIndex)")
//            
//        }
        
        for var i = 0; i <= numberOfCustomers; i++ {
        let tasteIndex = 1 / Double(arc4random_uniform(UInt32(9)))
            
            customer[i].tasteProfile = tasteIndex
            println("The taste index is \(tasteIndex)")
            
        }

        }
    
    func customerTasteProfile () -> Double {
        var customerPreference = 0.0
        
        for var j = 0; j < customer.count; j++ {
            if customer[j].tasteProfile >= 0 && customer[j].tasteProfile < 0.4 {
                var customerPreference = 0.9
            }
            else if customer[j].tasteProfile >= 0.4 && customer[j].tasteProfile < 0.6 {
                var customerPreference = 1
            }
            else if customer[j].tasteProfile >= 0.6 && customer[j].tasteProfile <= 1 {
                var customerPreference = 1.1
            }
        }
        return customerPreference
    }
    
    func compareAndCalculate (preference: Double, lemonade: Double) {
        if (preference == 0.9 && lemonade > 1) || (preference == 1 && lemonade == 1) || (preference == 1.1 && lemonade < 1) {
            statusFieldLabel.text = "Paid $1!"
            funds += 1
        }
        else {
            statusFieldLabel.text = "The customer wasn't satisfied."
        }

    }
    
}











