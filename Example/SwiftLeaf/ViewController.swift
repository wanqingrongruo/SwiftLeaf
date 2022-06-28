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

    let keyboard = KeyboardObserver()

    override func viewDidLoad() {
        super.viewDidLoad()

        verifyThrottler()
        verifyDebouncer()
        observeKeyboard()
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

extension ViewController {
    func observeKeyboard() {
        keyboard.observe { [weak self] (event) -> Void in
            guard let self = self else {
                return
            }
            switch event.type {
            case .willShow, .willHide, .willChangeFrame:
                if event.type == .willHide {
                    self.hideKeyBoard(event: event)
                } else {
                    self.showKeybord(event: event)
                }
            default:
                break
            }
        }
    }

    func hideKeyBoard(event: KeyboardEvent) {
       // do something
    }

    func showKeybord(event: KeyboardEvent) {
        _ = event.keyboardFrameEnd
        // do something
    }
}

