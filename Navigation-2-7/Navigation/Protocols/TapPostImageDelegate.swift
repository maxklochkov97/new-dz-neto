//
//  File.swift
//  Navigation
//
//  Created by Максим Клочков on 01.05.2022.
//

import UIKit

protocol TapPostImageDelegate: AnyObject {
    func postImagePressed(author: String, description: String, image: UIImage)
}
