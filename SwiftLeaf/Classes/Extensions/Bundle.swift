//
//  Bundle.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation

public extension Bundle {
    var displayName: String {
        let name = object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        return name ?? object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
    }

    var releaseVersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    var buildVersionNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
}
