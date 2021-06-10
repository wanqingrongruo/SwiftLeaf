//
//  ViewController.swift
//  SwiftLeaf
//
//  Created by wanqingrongruo on 06/10/2021.
//  Copyright (c) 2021 wanqingrongruo. All rights reserved.
//

import UIKit
import SwiftLeaf

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        verifyThrottler()
        verifyDebouncer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func verifyThrottler() {
        let throttler = Throttler(seconds: 1, mode: .trailing)
        for index in 0...9 {
            throttler.throttle {
                print("++++++\(index)")
            }
        }
    }

    func verifyDebouncer() {
        let debouncer = Debouncer(label: "debouncer", interval: 1)
        var sum  = 0
        for index in 0...9 {
            sum += index
            debouncer.call {
                print("----\(sum)")
            }
        }
    }
}

