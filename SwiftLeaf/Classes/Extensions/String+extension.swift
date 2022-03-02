//
//  String+extension.swift
//  Created on 2020/12/3
//  Description <#文件描述#>

import Foundation

public extension String {
    // 十六进制字符串转 data => 0x68656c6c6f2c20776f726c64 = hello, world
    func hexStringConverToData() -> Data {
        var hexString = self
        var data = Data()
        while !hexString.isEmpty {
            guard let index = hexString.index(hexString.startIndex, offsetBy: 2, limitedBy: hexString.endIndex) else {
                break
            }
            let unit = String(hexString[..<index])
            hexString = String(hexString[index..<hexString.endIndex])
            var ch: UInt64 = 0
            Scanner(string: unit).scanHexInt64(&ch)
            var char = UInt8(ch)
            data.append(&char, count: 1)
        }

        return data
    }
}

public extension String {
    var deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }

    var int: Int? {
        return Int(self)
    }

    var url: URL? {
        return URL(string: self)
    }

    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }

    func appendingPathComponent(_ str: String) -> String {
        return (self as NSString).appendingPathComponent(str)
    }

    func appendingPathExtension(_ str: String) -> String? {
        return (self as NSString).appendingPathExtension(str)
    }
}
