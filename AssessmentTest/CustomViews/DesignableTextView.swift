//
//  CustomTextView.swift
//  AssessmentTest
//
//  Created by Artem on 24.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextView: UITextView {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
