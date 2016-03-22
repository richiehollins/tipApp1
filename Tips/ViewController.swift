//
//  ViewController.swift
//  Tips
//
//  Created by Hollins, Richie on 3/6/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var blueOval: UIImageView!
    
    var storedInput:Int = 0 // the full, non-formatted numbers entered.
    
    @IBAction func tapped1(sender: AnyObject) {tappedNumber(1)}
    @IBAction func tapped2(sender: AnyObject) {tappedNumber(2)}
    @IBAction func tapped3(sender: AnyObject) {tappedNumber(3)}
    @IBAction func tapped4(sender: AnyObject) {tappedNumber(4)}
    @IBAction func tapped5(sender: AnyObject) {tappedNumber(5)}
    @IBAction func tapped6(sender: AnyObject) {tappedNumber(6)}
    @IBAction func tapped7(sender: AnyObject) {tappedNumber(7)}
    @IBAction func tapped8(sender: AnyObject) {tappedNumber(8)}
    @IBAction func tapped9(sender: AnyObject) {tappedNumber(9)}
    @IBAction func tapped0(sender: AnyObject) {tappedNumber(0)}
    
    // white status bar!
    override func preferredStatusBarStyle() -> UIStatusBarStyle { return UIStatusBarStyle.LightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountLabel.text = "$0.00"
        blueOval.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedNumber(num:Int) {
        storedInput = storedInput * 10 + num
        //print(storedInput)
        
        UIView.animateWithDuration(0.33, animations: {
            self.blueOval.alpha = 1
        })
        
        updateBillAmountLabel(storedInput)
    }
    
    func updateBillAmountLabel(amount:Int) {
        let storedInputDouble = Double("\(storedInput)")!
        //print(storedInputDouble)
        let formattedInput = Double(storedInputDouble/100)
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        //print(formatter.stringFromNumber(formattedInput)!)
        let formattedCurrencyBillAmount = formatter.stringFromNumber(formattedInput)!
        
        billAmountLabel.text = formattedCurrencyBillAmount
    }


    @IBAction func tappedDelete(sender: AnyObject) {
        let storedInputString = String("\(storedInput)")
        let storedInputStringLength = storedInputString.characters.count // get length of the storedInput to avoid errors
        if ( storedInputStringLength == 1 ) {
            storedInput = 0
            UIView.animateWithDuration(0.33, animations: {
                self.blueOval.alpha = 0
            })
        }
        else {
            let storedInputStringMinusOne = storedInputString.substringToIndex(storedInputString.endIndex.predecessor())
            let storedInputIntMinusOne:Int? = Int(storedInputStringMinusOne)
            storedInput = storedInputIntMinusOne!
        }
        
        updateBillAmountLabel(storedInput)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondScene = segue.destinationViewController as! TipViewController
        secondScene.oldStoredInput = storedInput
    }
    
}

