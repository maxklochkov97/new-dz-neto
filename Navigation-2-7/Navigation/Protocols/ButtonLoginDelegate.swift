//
//  File.swift
//  Navigation
//
//  Created by Максим Клочков on 28.04.2022.
//

import Foundation

protocol ButtonLoginDelegate: AnyObject {
    func loginButtonPressed()
    func wrongLoginAlert()
}
