//
//  Data+extension.swift
//  Created on 2020/12/3
//  Description <#文件描述#>

import Foundation

public extension Data {

    // 转data为 16 进制的字符串
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
