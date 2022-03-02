//
//  CMTime+extension.swift
//  SwiftLeaf
//
//  Created by roni on 2022/3/2.
//

import CoreMedia

public extension CMTime {
    init(seconds: Float64) {
        self.init(value: seconds.isNaN ? 0 : CMTimeValue(seconds * 1000), timescale: 1000)
    }

    static func oneSecond() -> CMTime {
        return CMTime(value: 1, timescale: 1)
    }

    static func halfSecond() -> CMTime {
        return CMTime(value: 1, timescale: 2)
    }

    func multiply(percent: CGFloat) -> CMTime {
        if percent == 1 {
            return self
        }
        if percent == 0 {
            return CMTime.zero
        }
        let value = CMTimeMultiplyByFloat64(self, multiplier: Float64(percent))
        return value
    }

    func videoPrecision() -> CMTime {
        let seconds = CMTimeGetSeconds(self)
        return CMTime(seconds: seconds)
    }

    func add(time: CMTime) -> CMTime {
        return CMTimeAdd(self, time)
    }

    func subtract(time: CMTime) -> CMTime {
        return CMTimeSubtract(self, time)
    }

    func cgFloatValue() -> CGFloat {
        if timescale == 0 || value == 0 {
            return 0
        }
        return CGFloat(CMTimeGetSeconds(self))
    }

    func timeIntervalValue() -> TimeInterval {
        if timescale == 0 {
            return 0
        }
        return TimeInterval(CMTimeGetSeconds(self))
    }

    func divide(time: CMTime) -> Float {
        if self == CMTime.zero || time == CMTime.zero {
            return 0
        }
        if self.value == 0 || time.value == 0 {
            return 0
        }
        return Float(cgFloatValue() / time.cgFloatValue())
    }

    var formattedString: String {
        let totalSeconds = self.seconds
        if totalSeconds.isNaN {
            return ""
        }

        let hours: Int = Int(totalSeconds / 3600)
        let minutes: Int = Int(totalSeconds.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds: Int = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        let secondsFraction: Double = totalSeconds - Double(Int(totalSeconds))

        var result: String
        if hours > 0 {
            result = String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            result = String(format: "%02i:%02i", minutes, seconds)
        }
        if secondsFraction > 0 {
            result += String(format: ".%01i", Int(secondsFraction * 10.0))
        }
        if result.hasPrefix("00") {
            return String(result[result.index(result.startIndex, offsetBy: 1)...])
        }
        return result
    }

    var formattedNormalString: String {
        let totalSeconds = self.seconds
        let hours: Int = Int(totalSeconds / 3600)
        let minutes: Int = Int(totalSeconds.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds: Int = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        let secondsFraction: Double = totalSeconds - Double(Int(totalSeconds))

        var result: String
        if hours > 0 {
            result = String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            result = String(format: "%02i:%02i", minutes, seconds)
        }
        if secondsFraction > 0 {
            result += String(format: ".%01i", Int(secondsFraction * 10.0))
        }
        return result
    }

    var formattedSecondString: String {
        let totalSeconds = self.seconds
        let hours: Int = Int(totalSeconds / 3600)
        let minutes: Int = Int(totalSeconds.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds: Int = Int(totalSeconds.truncatingRemainder(dividingBy: 60))

        var result: String
        if hours > 0 {
            result = String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            result = String(format: "%02i:%02i", minutes, seconds)
        }
        return result
    }

    var shortFormattedString: String {
        var formattedString = self.formattedString
        if formattedString.hasPrefix("0:") {
            formattedString = String(formattedString.dropFirst(2))
        }
        if formattedString.hasPrefix("00.") {
            formattedString = String(formattedString.dropFirst(1))
        }
        if formattedString.hasSuffix(".0") {
            formattedString = String(formattedString.dropLast(2))
        }
        return formattedString
    }
}

