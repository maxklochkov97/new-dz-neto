//
//  File.swift
//  Navigation
//
//  Created by Максим Клочков on 01.05.2022.
//

import UIKit

protocol TapAllPhotoCellDelegate: AnyObject {
    func tapAction(photo: UIImage)
    func pressCancelAnimationButton()
}
