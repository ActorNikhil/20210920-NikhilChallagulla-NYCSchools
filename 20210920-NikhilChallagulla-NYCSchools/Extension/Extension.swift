//
//  Extension.swift
//  20210920-NikhilChallagulla-NYCSchools
//
//  Created by Nikhil on 9/19/21.
//

import Foundation
import UIKit


extension UILabel {
    
    /// func to set the UIlabel margins 
    func setMargins(margin: CGFloat = 10) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
