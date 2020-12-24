//
//  UIView+adds.swift
//  AssessmentTest
//
//  Created by Artem on 24.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit


extension UIView {
    
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        
        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        
        return nil
    }
    
}

extension UIView {
  
  /// Hide keyboard when tap on view
  func hideKeyboardOnTap() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
    tapGesture.cancelsTouchesInView = false
    
    self.addGestureRecognizer(tapGesture)
  }
    
}
