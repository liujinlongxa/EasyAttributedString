//
//  EasyAttributedString.swift
//  EasyAttributedString
//
//  Created by Liujinlong on 2018/11/2.
//

import Foundation
import UIKit

public extension String {
    public var eas: EASAdapter {
        return EASAdapter(value: self)
    }
}

public class EASAdapter {
    
    public struct AttributeModel {
        var key: NSAttributedStringKey
        var value: Any?
        var range: NSRange?
    }
    
    public struct ParagraphStyleMolde {
        var key: String
        var value: Any?
        var range: NSRange?
    }

    private var attributeModels = [AttributeModel]()
    private var paragraphStyleModels: [ParagraphStyleMolde] = []
    private var value: String
    init(value: String) {
        self.value = value
    }
    
    public var attributedString: NSAttributedString {
        let mAttributedString = NSMutableAttributedString.init(string: value)
        for model in attributeModels {
            let range = model.range ?? NSRange(location: 0, length: value.count)
            if let value = model.value {
                mAttributedString.addAttribute(model.key, value: value, range: range)
            } else {
                mAttributedString.removeAttribute(model.key, range: range)
            }
        }
        for model in paragraphStyleModels {
            let range = model.range ?? NSRange(location: 0, length: value.count)
            let paragraphStyle = mAttributedString.attribute(.paragraphStyle, at: range.location, longestEffectiveRange: nil, in: range)
            let temp = NSParagraphStyle.default.value(forKey: model.key)
            
            guard let defaultValue = temp else {
                fatalError("Paragrah key is invalid")
            }
            
            if let paragraphStyle = paragraphStyle as? NSParagraphStyle {
                paragraphStyle.setValue(model.value ?? defaultValue, forKey: model.key)
            } else {
                let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
                paragraphStyle.setValue(model.value ?? defaultValue, forKey: model.key)
                mAttributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
            }
        }
        return mAttributedString as NSAttributedString
    }
    
}

public extension EASAdapter {

    public func font(_ font: UIFont?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .font, value: font, range: range)
    }
    
    public func foregroundColor(_ foregroundColor: UIColor?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .foregroundColor, value: foregroundColor, range: range)
    }
    
    public func backgroundColor(_ backgroundColor: UIColor?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .backgroundColor, value: backgroundColor, range: range)
    }
    
    public func ligature(_ ligature: Int?, range: NSRange? = nil) -> EASAdapter {
        return handleIntegerValue(key: .ligature, value: ligature, range: range)
    }
    
    public func kern(_ kern: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleDoubleValue(key: .kern, value: kern, range: range)
    }
    
    public func strikethroughStyle(_ strikethroughStyle: Int?, range: NSRange? = nil) -> EASAdapter {
        return handleIntegerValue(key: .strikethroughStyle, value: strikethroughStyle, range: range)
    }
    
    public func underlineStyle(_ underlineStyle: Int?, range: NSRange? = nil) -> EASAdapter {
        return handleIntegerValue(key: .underlineStyle, value: underlineStyle, range: range)
    }
    
    public func strokeColor(_ strokeColor: UIColor?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .strokeColor, value: strokeColor, range: range)
    }
    
    public func strokeWidth(_ strokeWidth: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleDoubleValue(key: .strokeWidth, value: strokeWidth, range: range)
    }
    
    public func shadow(_ shadow: NSShadow?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .shadow, value: shadow, range: range)
    }
    
    public func textEffect(_ textEffect: NSString?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .textEffect, value: textEffect, range: range)
    }
    
    public func attachment(_ attachment: NSTextAttachment?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .attachment, value: attachment, range: range)
    }
    
    public func link(_ link: NSURL?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .link, value: link, range: range)
    }
    
    public func baselineOffset(_ baselineOffset: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleDoubleValue(key: .baselineOffset, value: baselineOffset, range: range)
    }
    
    public func underlineColor(_ underlineColor: UIColor?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .underlineColor, value: underlineColor, range: range)
    }

    public func strikethroughColor(_ strikethroughColor: UIColor?, range: NSRange? = nil) -> EASAdapter {
        return handleAnyValue(key: .strikethroughColor, value: strikethroughColor, range: range)
    }
    
    public func obliqueness(_ obliqueness: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleDoubleValue(key: .obliqueness, value: obliqueness, range: range)
    }
    
    public func expansion(_ expansion: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleDoubleValue(key: .expansion, value: expansion, range: range)
    }
    
    public func writingDirection(_ writingDirection: [Int]?, range: NSRange? = nil) -> EASAdapter {
        if let writingDirection = writingDirection {
            let value = writingDirection.map({NSNumber(integerLiteral: $0)})
            return handleAnyValue(key: .writingDirection, value: value, range: range)
        } else {
            return handleAnyValue(key: .writingDirection, value: nil, range: range)
        }
    }
    
    public func verticalGlyphForm(_ verticalGlyphForm: Int?, range: NSRange? = nil) -> EASAdapter {
        return handleIntegerValue(key: .verticalGlyphForm, value: verticalGlyphForm, range: range)
    }
    
}

// MARK: - Paragraph Style
extension EASAdapter {
    
    func handleParagraphStyle(anyValue: Any?, key: String, range: NSRange?) -> EASAdapter {
        let model = ParagraphStyleMolde(key: key, value: anyValue, range: range)
        paragraphStyleModels.append(model)
        return self
    }
    
    public func lineSpacing(_ lineSpacing: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: lineSpacing, key: "lineSpacing", range: range)
    }
    
    public func paragraphSpacing(_ paragraphSpacing: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: paragraphSpacing, key: "paragraphSpacing", range: range)
    }
    
    public func alignment(_ alignment: NSTextAlignment?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: alignment?.rawValue, key: "alignment", range: range)
    }
    
    public func firstLineHeadIndent(_ firstLineHeadIndent: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: firstLineHeadIndent, key: "firstLineHeadIndent", range: range)
    }
    
    public func headIndent(_ headIndent: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: headIndent, key: "headIndent", range: range)
    }
    
    public func tailIndent(_ tailIndent: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: tailIndent, key: "tailIndent", range: range)
    }
    
    public func lineBreakMode(_ lineBreakMode: NSLineBreakMode?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: lineBreakMode?.rawValue, key: "lineBreakMode", range: range)
    }
    
    public func minimumLineHeight(_ minimumLineHeight: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: minimumLineHeight, key: "minimumLineHeight", range: range)
    }
    
    public func maximumLineHeight(_ maximumLineHeight: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: maximumLineHeight, key: "maximumLineHeight", range: range)
    }
    
    public func baseWritingDirection(_ baseWritingDirection: NSWritingDirection?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: baseWritingDirection?.rawValue, key: "baseWritingDirection", range: range)
    }
    
    public func lineHeightMultiple(_ lineHeightMultiple: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: lineHeightMultiple, key: "lineHeightMultiple", range: range)
    }
    
    public func paragraphSpacingBefore(_ paragraphSpacingBefore: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: paragraphSpacingBefore, key: "paragraphSpacingBefore", range: range)
    }
    
    public func hyphenationFactor(_ hyphenationFactor: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: hyphenationFactor, key: "hyphenationFactor", range: range)
    }
    
    public func defaultTabInterval(_ defaultTabInterval: Double?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: defaultTabInterval, key: "defaultTabInterval", range: range)
    }
    
    @available(iOS 9.0, *)
    public func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool?, range: NSRange? = nil) -> EASAdapter {
        return handleParagraphStyle(anyValue: allowsDefaultTighteningForTruncation, key: "allowsDefaultTighteningForTruncation", range: range)
    }

}

// MARK: - Private Method
extension EASAdapter {
    func handleAnyValue(key: NSAttributedStringKey, value: Any?, range: NSRange?) -> EASAdapter {
        if let value = value {
            let model = AttributeModel(key: key, value: value, range: range)
            attributeModels.append(model)
        } else {
            attributeModels.removeAll(where: {$0.key == key && $0.range == range})
        }
        return self
    }
    
    func handleDoubleValue(key: NSAttributedStringKey, value: Double?, range: NSRange?) -> EASAdapter {
        if let value = value {
            let model = AttributeModel(key: key, value: NSNumber(floatLiteral: value), range: range)
            attributeModels.append(model)
        } else {
            attributeModels.removeAll(where: {$0.key == key && $0.range == range})
        }
        return self
    }
    
    func handleIntegerValue(key: NSAttributedStringKey, value: Int?, range: NSRange?) -> EASAdapter {
        if let value = value {
            let model = AttributeModel(key: key, value: NSNumber(integerLiteral: value), range: range)
            attributeModels.append(model)
        } else {
            attributeModels.removeAll(where: {$0.key == key && $0.range == range})
        }
        return self
    }

}

extension NSNumber {
    convenience init?(anyValue: Any?) {
        guard let numberValue = anyValue else {
            return nil
        }
        
        if let value = numberValue as? Int {
            self.init(value: value)
        } else if let value = numberValue as? Int8 {
            self.init(value: value)
        } else if let value = numberValue as? Int16 {
            self.init(value: value)
        } else if let value = numberValue as? Int32 {
            self.init(value: value)
        } else if let value = numberValue as? Int64 {
            self.init(value: value)
        } else if let value = numberValue as? UInt8 {
            self.init(value: value)
        } else if let value = numberValue as? UInt16 {
            self.init(value: value)
        } else if let value = numberValue as? UInt32 {
            self.init(value: value)
        } else if let value = numberValue as? UInt64 {
            self.init(value: value)
        } else if let value = numberValue as? Float {
            self.init(value: value)
        } else if let value = numberValue as? Double {
            self.init(value: value)
        } else if let value = numberValue as? Int {
            self.init(value: value)
        } else if let value = numberValue as? UInt {
            self.init(value: value)
        } else {
            return nil
        }
    }
}
