//
//  AttributedStringExtension.swift
//  JLEasyAttributedString
//
//  Created by Liujinlong on 2018/11/5.
//

import Foundation

extension NSAttributedString {
    public var eas: EASAdapter {
        return EASAdapter(value: self)
    }
}
