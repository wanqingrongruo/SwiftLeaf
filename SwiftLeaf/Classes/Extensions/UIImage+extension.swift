//
//  UIImage+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation
import UIKit

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1), scale: CGFloat = 0.0) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

   static func circleImage(radius: CGFloat, color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: radius, height: radius), false, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(color.cgColor)
        context.fillEllipse(in: CGRect(origin: .zero, size: CGSize(width: radius, height: radius)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
