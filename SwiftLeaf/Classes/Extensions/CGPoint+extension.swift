//
//  CGPoint+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation
import UIKit
import Darwin

extension CGPoint {
    mutating func offsetBy(point: CGPoint) {
        self.x = self.x + point.x
        self.y = self.y + point.y
    }

    /// 四舍五入
    mutating func round() {
        self.x = Darwin.round(self.x)
        self.y = Darwin.round(self.y)
    }

    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    var isNaN: Bool {
        return self.x.isNaN || self.y.isNaN
    }

    var isZero: Bool {
        return self.x.isZero && self.y.isZero
    }

    func offset(by point: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + point.x, y: self.y + point.y)
    }
}
