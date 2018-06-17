//: Playground - noun: a place where people can play

import UIKit

extension UILabel {
    func fontSizeScale(_ scale: CGFloat, originalSize: CGFloat, delta: CGFloat? = nil) {
        let scaledSize = originalSize.scale(scale, delta: delta ?? originalSize, roundingRule: nil)
        font = font.withSize(scaledSize)
    }

    func fontSizeScale(_ scale: CGFloat, delta: CGFloat? = nil) {
        font = font.pointSizeScaled(scale, delta: delta)
    }
}

extension UIFont {
    func pointSizeScaled(_ scale: CGFloat, delta: CGFloat? = nil) -> UIFont {
        let scaledSize = pointSize.scale(scale, delta: delta ?? pointSize)
        return withSize(scaledSize)
    }
    
    class func systemFont(ofSize size: CGFloat, scale: CGFloat) -> UIFont {
        return self.systemFont(ofSize: size.scale(scale, delta: size))
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


let label = UILabel()
let scale: CGFloat = 320 / 414
label.font = UIFont.systemFont(ofSize: 14)
label.font.pointSize

// 使用 UILabel.fontSizeScale
label.fontSizeScale(scale)
label.font.pointSize

// 使用 UILabel.fontSizeScale
label.fontSizeScale(scale, originalSize: 14)
label.font.pointSize

// 使用 UIFont.systemFont(ofSize size: CGFloat, scale: CGFloat)
label.font = UIFont.systemFont(ofSize: 14, scale: scale)
label.font.pointSize

// 使用 UIFont.pointSizeScaled (直接給 size)
label.font = UIFont.systemFont(ofSize: 14).pointSizeScaled(scale)
label.font.pointSize

// 使用 UIFont.pointSizeScaled (label.font)
label.font = UIFont.systemFont(ofSize: 14)
label.font = label.font.pointSizeScaled(scale)
label.font.pointSize

let textField = UITextField()

// 使用 UIFont.pointSizeScaled
textField.font = UIFont.systemFont(ofSize: 14)
textField.font = textField.font?.pointSizeScaled(scale)
textField.font?.pointSize
