//
//  StringExtension.swift
//  EasyAttributedString
//
//  Created by Liujinlong on 2018/11/5.
//

import Foundation
public extension String {
    public var eas: EASAdapter {
        return EASAdapter(value: self)
    }
}
