//
//  AVPlayer+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import AVFoundation
import UIKit

public extension AVPlayerItem {

    var bufferProgress: Double {
        return currentBufferDuration / totalDuration
    }

    var currentBufferDuration: Double {
        guard let range = loadedTimeRanges.first else { return 0 }
        return Double(CMTimeGetSeconds(CMTimeRangeGetEnd(range.timeRangeValue)))
    }

    var currentDuration: Double {
        return Double(CMTimeGetSeconds(currentTime()))
    }

    var playProgress: Double {
        return currentDuration / totalDuration
    }

    var totalDuration: Double {
        return Double(CMTimeGetSeconds(asset.duration))
    }
}

public extension AVPlayer {

    var bufferProgress: Double {
        return currentItem?.bufferProgress ?? -1
    }

    var currentBufferDuration: Double {
        return currentItem?.currentBufferDuration ?? -1
    }

    var currentDuration: Double {
        return currentItem?.currentDuration ?? -1
    }

    var currentImage: UIImage? {
        guard
            let playerItem = currentItem,
            let cgImage = try? AVAssetImageGenerator(asset: playerItem.asset).copyCGImage(at: currentTime(), actualTime: nil)
            else { return nil }

        return UIImage(cgImage: cgImage)
    }

    var playProgress: Double {
        return currentItem?.playProgress ?? -1
    }

    var totalDuration: Double {
        return currentItem?.totalDuration ?? 0
    }

    convenience init(asset: AVURLAsset) {
        self.init(playerItem: AVPlayerItem(asset: asset))
    }

}

