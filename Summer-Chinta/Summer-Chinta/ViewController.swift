//
//  ViewController.swift
//  Summer-Chinta
//
//  Created by Raja Srikar Karthik Chinta on 1/29/18.
//  Copyright © 2018 Raja Srikar Karthik Chinta. All rights reserved.
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
    @IBOutlet weak var TFSkipVal: UITextField!
    @IBOutlet weak var LBLOutput: UILabel!
    @IBOutlet weak var LBLIncrementalSequence: UILabel!
    @IBOutlet weak var LBLSkipSum: UILabel!
    @IBOutlet weak var LBLSkipOutput: UILabel!
    
    @IBAction func BTN(_ sender: Any) {
        if Int(TFLow.text!) == nil || Int(TFHigh.text!) == nil {
            LBLOutput.text="Please enter only numbers!!"
            LBLIncrementalSequence.text=""
            LBLSkipSum.text=""
            LBLSkipOutput.text=""
        }else{
        var low:Int=Int(TFLow.text!)!
        var high:Int=Int(TFHigh.text!)!
        var sum:Int = 0
        var incSeq=[Int]()
        var incSum:Int=0
        var counter:Int = 1
        if low > high {
            TFHigh.text=String(low)
            TFLow.text=String(high)
            low=Int(TFLow.text!)!
            high=Int(TFHigh.text!)!
        }
        for num in low...high{
            sum+=num
        }
            incSeq.append(low)
            while incSeq[incSeq.count-1] <= high{
                incSeq.append(incSeq[incSeq.count-1]+counter)
                counter+=1
            }
            if incSeq[incSeq.count-1]>high {
               incSeq.remove(at: incSeq.count-1)
            }
            for num in incSeq{
                incSum+=num
            }
            if Int(TFSkipVal.text!) == nil || Int(TFSkipVal.text!)!<0 {
                LBLSkipSum.text=""
                LBLSkipOutput.text=""
            }else{
            var skipSeq=[Int]()
            var skipingNum:Int=low
            let skipInput:Int=Int(TFSkipVal.text!)!
            var skipString:String = ""
            var skipSum:Int=0
        while skipingNum<=high{
            skipSum+=skipingNum
           skipSeq.append(skipingNum)
           skipingNum+=skipInput+1
        }

        for num in skipSeq{
            skipString+=String(num)+","
        }
        skipString.remove(at: skipString.index(before: skipString.endIndex))
                LBLSkipSum.text="The sum of values after skipping values \nis: "+String(skipSum)
                LBLSkipOutput.text="The sequence by appending "+String(skipInput)+" to each value is: \n"+skipString
            }
            LBLOutput.text="The sum of values in between "+String(low)+" and "+String(high)+" is: "+String(sum)
            LBLIncrementalSequence.text="The incremental sum of values which \nincrements exponentially  from "+String(low)+" and "+String(high)+" is: "+String(incSum)

        }
    }
    

    
}

