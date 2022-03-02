//
//  UIControll+hitTest.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import UIKit

private var AssociatedUIControlHandle: UInt8 = 0

public extension UIControl {

    @objc var hitTestEdgeInsets: UIEdgeInsets {
        get {
            let value: NSValue? = objc_getAssociatedObject(self, &AssociatedUIControlHandle) as? NSValue
            if value != nil {
                return value!.uiEdgeInsetsValue
            }
            return UIEdgeInsets.zero
        }
        set {
            let value = NSValue(uiEdgeInsets: newValue)
            objc_setAssociatedObject(self, &AssociatedUIControlHandle, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if hitTestEdgeInsets == UIEdgeInsets.zero || !isEnabled || isHidden {
            return super.point(inside: point, with: event)
        }
        let relativeFrame: CGRect = bounds
        let hitFrame: CGRect = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}
