//
//  UIFont+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2021/7/2.
//

import Foundation

// 动态字体的支持
public extension UIFont {
    static let fontTypo = FontTypography()

    struct FontTypography {
        public var display1: UIFont {
            scaled(baseFont: .systemFont(ofSize: 42, weight: .semibold), forTextStyle: .largeTitle, maximumFactor: 1.5)
        }

        public var display2: UIFont {
            scaled(baseFont: .systemFont(ofSize: 36, weight: .semibold), forTextStyle: .largeTitle, maximumFactor: 1.5)
        }

        public var title1: UIFont {
            scaled(baseFont: .systemFont(ofSize: 24, weight: .semibold), forTextStyle: .title1)
        }

        public var title2: UIFont {
            scaled(baseFont: .systemFont(ofSize: 20, weight: .semibold), forTextStyle: .title2)
        }

        public var title3: UIFont {
            scaled(baseFont: .systemFont(ofSize: 18, weight: .semibold), forTextStyle: .title3)
        }

        public var title4: UIFont {
            scaled(baseFont: .systemFont(ofSize: 14, weight: .regular), forTextStyle: .headline)
        }

        public var title5: UIFont {
            scaled(baseFont: .systemFont(ofSize: 12, weight: .regular), forTextStyle: .subheadline)
        }

        public var bodyBold: UIFont {
            scaled(baseFont: .systemFont(ofSize: 16, weight: .semibold), forTextStyle: .body)
        }

        public var body: UIFont {
            scaled(baseFont: .systemFont(ofSize: 16, weight: .light), forTextStyle: .body)
        }

        public var captionBold: UIFont {
            scaled(baseFont: .systemFont(ofSize: 14, weight: .semibold), forTextStyle: .caption1)
        }

        public var caption: UIFont {
            scaled(baseFont: .systemFont(ofSize: 14, weight: .light), forTextStyle: .caption1)
        }

        public var small: UIFont {
            scaled(baseFont: .systemFont(ofSize: 12, weight: .light), forTextStyle: .footnote)
        }
    }
}

private extension UIFont.FontTypography {
    func scaled(baseFont: UIFont, forTextStyle textStyle: UIFont.TextStyle = .body, maximumFactor: CGFloat? = nil) -> UIFont {
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)

        if let maximumFactor = maximumFactor {
            let maximumPointSize = baseFont.pointSize * maximumFactor
            return fontMetrics.scaledFont(for: baseFont, maximumPointSize: maximumPointSize)
        }
        return fontMetrics.scaledFont(for: baseFont)
    }
}

extension UIFont {
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

    func setItalic() -> UIFont {
        if isItalic {
            return self
        } else {
            var symTraits = fontDescriptor.symbolicTraits
            symTraits.insert([.traitItalic])
            let fontDescriptorVar = fontDescriptor.withSymbolicTraits(symTraits)
            return UIFont(descriptor: fontDescriptorVar!, size: 0)
        }
    }

    func removeitalic() -> UIFont {
        if !isItalic {
            return self
        } else {
            var symTraits = fontDescriptor.symbolicTraits
            symTraits.remove([.traitItalic])
            let fontDescriptorVar = fontDescriptor.withSymbolicTraits(symTraits)
            return UIFont(descriptor: fontDescriptorVar!, size: 0)
        }
    }
}
