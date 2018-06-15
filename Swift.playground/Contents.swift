//: Playground - noun: a place where people can play

import UIKit

extension UILabel {
    @discardableResult func fontSizeScale(_ scale: CGFloat, originalSize: CGFloat?, delta: CGFloat?) -> CGFloat {
        let pointSize = originalSize ?? font.pointSize
        let scaledSize = pointSize.scale(scale, delta: delta ?? pointSize, roundingRule: nil)
        font = font.withSize(scaledSize)
        return scaledSize
    }
}

extension CGFloat {
    func scale(_ scale: CGFloat, delta originDelta: CGFloat = 4, roundingRule: FloatingPointRoundingRule? = nil) -> CGFloat {
        let delta: CGFloat = scale >= 1.0 ? originDelta : self >= originDelta ? originDelta : self
        let base = self - delta
        let result = base + scale * delta
        if let rule = roundingRule {
            return result.rounded(rule)
        }
        return result
    }
}

