//
//  UIApplication+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import Foundation
import UIKit

public extension UIApplication {
    @available(iOS 13.0, *)
    var firstWindowScene: UIWindowScene? {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first
        return window
    }
    
    var compatibleKeyWindow: UIWindow? {
        if #available(iOS 13, *) {
            let window = firstWindowScene?.windows
                .filter({$0.isKeyWindow}).first
            return window
        } else {
            return keyWindow
        }
    }
    
    var compatibleStatusBarFrame: CGRect {
        if #available(iOS 13, *) {
            let frame = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.statusBarManager?.statusBarFrame
            return frame ?? .zero
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }
    
    var isLandscape: Bool {
        if #available(iOS 13, *) {
            let isLandscape = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.interfaceOrientation.isLandscape
            return isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
