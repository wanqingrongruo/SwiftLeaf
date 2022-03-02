//
//  CGPath+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation

/*
 操作 bezierpath 的库
 ClippingBezier
 BezierKit
 */

public extension CGPath {
    /// 判断一个点是否在当前 path 上
    /// - Parameters:
    ///   - point: 点
    ///   - lineWidth: path 对应的线宽, 可以通过这个值来控制响应范围
    ///   - canvasSize: 画布, path 显示的 view 大小或者其他
    /// - Returns: 如果当前点在 path 上即返回 true
    func hitOnPath(point: CGPoint, lineWidth: CGFloat, canvasSize: CGSize) -> Bool {
        UIGraphicsBeginImageContext(canvasSize)

        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            return false
        }

        var isHit = false

        let mode: CGPathDrawingMode = CGPathDrawingMode.stroke

        context.setLineWidth(lineWidth)
        context.saveGState()
        context.addPath(self)

        isHit = context.pathContains(point, mode: mode)
        context.restoreGState()
        UIGraphicsEndImageContext()
        return isHit
    }
}
