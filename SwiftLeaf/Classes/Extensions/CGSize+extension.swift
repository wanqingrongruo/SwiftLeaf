//
//  CGSize+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

public extension CGSize {
    func multiply(value: CGFloat) -> CGSize {
        return CGSize(width: width * value, height: height * value)
    }

    func even() -> CGSize {
        var size = CGSize(width: ceil(width), height: ceil(height))
        if Int(size.width) % 2 != 0 {
            size.width += 1
        }
        if Int(size.height) % 2 != 0 {
            size.height += 1
        }
        return size
    }

    func videoFitted() -> CGSize {
        let size = roundDown()
        let width = Int(size.width)
        let height = Int(size.height)
        return CGSize(width: width - width % 4, height: height - height % 4)
    }

    func roundDown() -> CGSize {
        var size = CGSize(width: ceil(width), height: ceil(height))
        if Int(size.width) % 2 != 0 {
            size.width -= 1
        }
        if Int(size.height) % 2 != 0 {
            size.height -= 1
        }
        return size
    }
}

