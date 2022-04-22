//
//  PhotosModel.swift
//  Navigation
//
//  Created by Максим Клочков on 22.04.2022.
//

import UIKit

struct Photo {
    let image: UIImage

    static func allPhotos() -> [Photo] {
        var photos = [Photo]()

        [Photo(image: UIImage(named: "ph1")!),
         Photo(image: UIImage(named: "ph2")!),
         Photo(image: UIImage(named: "ph3")!),
         Photo(image: UIImage(named: "ph4")!),
        ].forEach({ photos.append($0) })

        return photos
    }
}
