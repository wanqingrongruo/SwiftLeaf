//
//  NSObject+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation

public extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}
