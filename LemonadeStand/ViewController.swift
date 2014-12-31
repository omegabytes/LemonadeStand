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

    var funds = 10


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func buyLemonsButton(sender: AnyObject) {
    }
   
    @IBAction func sellLemonsButton(sender: AnyObject) {
    }
    
    @IBAction func buyIceButton(sender: AnyObject) {
    }
    
    @IBAction func sellIceButton(sender: AnyObject) {
    }
    
    @IBAction func addLemonsToMixButton(sender: AnyObject) {
    }
    
    @IBAction func removeLemonsFromMixButton(sender: AnyObject) {
    }
    
    @IBAction func addIceToMixButton(sender: AnyObject) {
    }
    
    @IBAction func removeIceFromMixButton(sender: AnyObject) {
    }
    
    @IBAction func startDayButton(sender: AnyObject) {
    }

    
    
    
    
    
}

