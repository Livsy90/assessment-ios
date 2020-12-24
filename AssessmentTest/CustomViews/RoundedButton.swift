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
  
    private let buttonBackgroundColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
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
  
  // MARK: - Public Methods

  func applyOnlyBoarderStyle(color: UIColor) {
    layer.backgroundColor = UIColor.clear.cgColor
    layer.borderWidth = 1
    layer.borderColor = color.cgColor
    tintColor = color
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
