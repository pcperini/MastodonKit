//
//  String.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 5/31/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import Foundation

extension String {
    func condensed(separator: String = "") -> String {
        let components = self.components(separatedBy: .whitespaces)
        return components.filter { !$0.isEmpty }.joined(separator: separator)
    }
    
    func attributedHTMLString() -> NSAttributedString {
        guard let data = data(using: .utf16) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .defaultAttributes: String.Encoding.utf16.rawValue
                                          ],
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    func plainHTMLString() -> String {
        return self.attributedHTMLString().string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
