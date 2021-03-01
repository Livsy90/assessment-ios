//
//  RoundedButton.swift
//  AssessmentTest
//
//  Created by Artem on 24.12.2020.
//  Copyright © 2020 Михаил Юранов. All rights reserved.
//

import UIKit

@IBDesignable
final class FullFillRoundedButton: UIButton {
    
    // MARK: - Enums
    
    private enum ButtonState {
        case active
        case noActice
    }
    
    // MARK: - Public Properties
    
    @IBInspectable var updatedButtonHeight: CGFloat = 30 {
        didSet {
            heightConstraint?.constant = updatedButtonHeight
        }
    }
    
    // MARK: - Private Properties
    
    private let buttonBackgroundColor: UIColor = .skyBlue
    private let buttonCornerRadius: CGFloat = 4
    private let buttonTextColor: UIColor = .white
    private let buttonFont: UIFont = .systemFont(ofSize: 16, weight: .semibold)
    private let buttonHeight: CGFloat = 44
    private var heightConstraint: NSLayoutConstraint?
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    // MARK: - IB
    
    override func prepareForInterfaceBuilder() {
        setupButton()
    }
    
    // MARK: - Private Methods
    
    private func setupButton() {
        layer.backgroundColor = buttonBackgroundColor.cgColor
        layer.cornerRadius = buttonCornerRadius
        tintColor = buttonTextColor
        titleLabel?.font = buttonFont
        
        heightConstraint = heightAnchor.constraint(equalToConstant: buttonHeight)
        heightConstraint?.isActive = true
    }
    
}

// MARK: - isEnabled changing opacity

extension FullFillRoundedButton {
    
    override var isEnabled: Bool {
        didSet {
            layer.opacity = isEnabled ? 1 : 0.5
        }
    }
    
}
