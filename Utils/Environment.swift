//
//  Environment.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation
import UIKit

public func isIPad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
}

public func isMacCatalyst() -> Bool {
    #if targetEnvironment(macCatalyst)
    return true
    #else
    return false
    #endif
}

public func isIphone() -> Bool {
    return !(isMacCatalyst() || isIPad())
}
