//
//  TipViewController.swift
//  Tips
//
//  Created by Hollins, Richie on 3/8/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var activeUnderline: UIView!
    @IBOutlet weak var background: UIView!
    
    var oldStoredInput:Int = 0
    var storedInputWithTip:Double = 0
    var rawTip:Double = 0
    var tipPercentage:Double = 0.2
    
    // white status bar!
    override func preferredStatusBarStyle() -> UIStatusBarStyle { return UIStatusBarStyle.LightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        background.backgroundColor = UIColor(red:30/255,green:126/255,blue:229/255,alpha:1)
        updateScreen()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateScreen() {
        rawTip = (Double(oldStoredInput) * tipPercentage)
        storedInputWithTip = (Double(oldStoredInput)) + rawTip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        let formattedTip = rawTip/100
        let formattedCurrencyTip = formatter.stringFromNumber(formattedTip)!
        
        let formattedTotal = storedInputWithTip/100
        let formattedCurrencyTotal = formatter.stringFromNumber(formattedTotal)!

        
        tipLabel.text = "+\(formattedCurrencyTip) "
        totalAmountLabel.text = formattedCurrencyTotal
        
    }

    // change the tip amount
    @IBAction func tapped15Tip(sender: AnyObject) {
        tipPercentage = 0.15
        updateScreen()
        UIView.animateWithDuration(0.33, animations: {
            self.activeUnderline.frame.origin.x = 0
            self.background.backgroundColor = UIColor(red:103/255,green:52/255,blue:186/255,alpha:1)
        })
    }
    @IBAction func tapped20Tip(sender: AnyObject) {
        tipPercentage = 0.2
        updateScreen()
        UIView.animateWithDuration(0.33, animations: {
            self.activeUnderline.frame.origin.x = 125
            self.background.backgroundColor = UIColor(red:30/255,green:126/255,blue:229/255,alpha:1)
        })
    }
    @IBAction func tapped25Tip(sender: AnyObject) {
        tipPercentage = 0.25
        updateScreen()
        
        UIView.animateWithDuration(0.33, animations: {
            self.activeUnderline.frame.origin.x = 250
            self.background.backgroundColor = UIColor(red:0/255,green:212/255,blue:218/255,alpha:1)
        })
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
