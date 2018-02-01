//
//  ViewController.swift
//  Summer-Atkuri
//
//  Created by Atkuri,Ashok on 1/31/18.
//  Copyright © 2018 Atkuri,Ashok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var TFLow: UITextField!
    @IBOutlet weak var TFHigh: UITextField!
    @IBOutlet weak var LBLAnswer: UILabel!
    @IBOutlet weak var LBLSumWithInc: UILabel!
    @IBOutlet weak var TFSkipValue: UITextField!
    @IBOutlet weak var LBLSumWithoutSkipValue: UILabel!
    @IBOutlet weak var LBLSequence: UILabel!
    
    @IBAction func BTNCompute(_ sender: UIButton) {
        if Int(TFLow.text!) == nil || Int(TFHigh.text!) == nil {
           LBLAnswer.text? = "Please enter a number.."
           LBLSumWithInc.text? = ""
           LBLSumWithoutSkipValue.text? = ""
           LBLSequence.text? = ""
        }else {
            if Int(TFLow.text!)! > Int(TFHigh.text!)! {
                swap()
            }
            LBLAnswer.text? = "The sum is " + (String(sum(Int(TFLow.text!)!, Int(TFHigh.text!)!)))
            LBLSumWithInc.text? = "The sum with increase " + (String(sumWithInc(Int(TFLow.text!)!, Int(TFHigh.text!)!)))
            if Int(TFSkipValue.text!) != nil {
                LBLSumWithoutSkipValue.text? = "The sum with skip values is " + (String(sumWithSkip(Int(TFLow.text!)!, Int(TFHigh.text!)!, Int(TFSkipValue.text!)!)))
            }else{
                LBLSumWithoutSkipValue.text? = "Skip value is not number!"
                LBLSequence.text? = ""
            }
        }
    }
    
    func sum(_ low:Int,_ high:Int) -> Int{
        var sum:Int = 0
        for i in low ... high {
            sum += i
        }
        return sum
    }
    
    func swap(){
        let temp = TFLow.text
        TFLow.text = TFHigh.text
        TFHigh.text = temp
    }
    
    func sumWithInc(_ low:Int,_ high:Int) -> Int{
        var sum:Int = 0, i:Int = low, j:Int = 0
        while i < high {
            sum += i
            j += 1
            i += j
        }
        return sum
    }
    
    func sumWithSkip(_ low:Int,_ high:Int, _ skipValue:Int) -> Int{
        var sum:Int = 0, i:Int = low
        LBLSequence.text = ""
        while i <= high {
            sum += i
            LBLSequence.text?.append(String(i) + " ")
            i += skipValue+1
            }
        return sum
    }
    
}

