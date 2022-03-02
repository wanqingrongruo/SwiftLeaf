//
//  NSMutableAttributedString+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation
import CoreText

public extension NSAttributedString {
    /// Helper for splitting an attributed string up into lines
    /// Modified solution from https://stackoverflow.com/questions/4421267/how-to-get-text-from-nth-line-of-uilabel
    func splitIntoLines(forWidth width: CGFloat, height: CGFloat = .greatestFiniteMagnitude, keepNewlines: Bool = false) -> [NSAttributedString] {
        let frameSetter: CTFramesetter = CTFramesetterCreateWithAttributedString(self as CFAttributedString)
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: width, height: height))
        
        let frame: CTFrame = CTFramesetterCreateFrame(frameSetter, CFRange(), path, nil)
        // Can't do a simple 'as' here but this cast never fails. Guard is just here to make the code pretty
        guard let lines = CTFrameGetLines(frame) as? [CTLine] else { return [] }
        return lines.map {
            let lineRange = CTLineGetStringRange($0)
            let lineString = attributedSubstring(from: NSRange(location: lineRange.location, length: lineRange.length))
            // CTFrameGetLines leaves the newline character at the end of the line.
            // We might want to strip this
            if lineString.string.last == "\n" && !keepNewlines {
                return attributedSubstring(from: NSRange(location: lineRange.location, length: lineRange.length - 1))
            }
            return lineString
        }
    }
    
    func trimmingTrailingSpaces() -> NSAttributedString {
        let mutableString = NSMutableAttributedString(attributedString: self)
        mutableString.trimTrailingSpaces()
        return mutableString
    }
}

extension NSMutableAttributedString {
    func trimTrailingSpaces() {
        while string.last == " " {
            deleteCharacters(in: NSRange(location: string.count - 1, length: 1))
        }
    }
}
