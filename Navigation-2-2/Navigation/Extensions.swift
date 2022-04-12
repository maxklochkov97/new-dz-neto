//
//  Extensions.swift
//  Navigation
//
//  Created by Максим Клочков on 12.04.2022.
//

// Реализация оступа в UITextField

import UIKit

extension UITextField {

    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }

    func addPadding(_ padding: PaddingSide) {

        self.leftViewMode = .always
        self.layer.masksToBounds = true


        switch padding {

        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always

        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always

        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}


//func drawSelf() {
//    self.addSubview(mainVerticalStack)
//
//    self.mainVerticalStack.addArrangedSubview(infoHorizontalStack)
//    self.mainVerticalStack.addArrangedSubview(setStatusButton)
//    self.mainVerticalStack.addArrangedSubview(changeTitleButton)
//
//
//    self.infoHorizontalStack.addArrangedSubview(avatarImageView)
//    self.infoHorizontalStack.addArrangedSubview(labelVerticalStack)
//    self.labelVerticalStack.addArrangedSubview(fullNameLabel)
//    self.labelVerticalStack.addArrangedSubview(statusLabel)
//    self.labelVerticalStack.addArrangedSubview(statusTextField)
//
//    NSLayoutConstraint.activate([
//        self.mainVerticalStack.topAnchor.constraint(equalTo: self.topAnchor),
//        self.mainVerticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//        self.mainVerticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//        self.mainVerticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//
//
//        self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0),
//        self.statusTextField.heightAnchor.constraint(equalToConstant: 40),
//        self.changeTitleButton.heightAnchor.constraint(equalToConstant: 50),
//        self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
//    ])
//}
