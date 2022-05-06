//
//  PhotoModel.swift
//  Navigation
//
//  Created by Максим Клочков on 22.04.2022.
//

import UIKit

struct Photo {
    var imageName: String

    static func allPhotos() -> [Photo] {
        var photos = [Photo]()
        photos.append(Photo(imageName: "ph1"))
        photos.append(Photo(imageName: "ph2"))
        photos.append(Photo(imageName: "ph3"))
        photos.append(Photo(imageName: "ph4"))
        photos.append(Photo(imageName: "ph5"))
        photos.append(Photo(imageName: "ph6"))
        photos.append(Photo(imageName: "ph7"))
        photos.append(Photo(imageName: "ph8"))
        photos.append(Photo(imageName: "ph9"))
        photos.append(Photo(imageName: "ph10"))
        photos.append(Photo(imageName: "ph1"))
        photos.append(Photo(imageName: "ph2"))
        photos.append(Photo(imageName: "ph3"))
        photos.append(Photo(imageName: "ph4"))
        photos.append(Photo(imageName: "ph5"))
        photos.append(Photo(imageName: "ph6"))
        photos.append(Photo(imageName: "ph7"))
        photos.append(Photo(imageName: "ph8"))
        photos.append(Photo(imageName: "ph9"))
        photos.append(Photo(imageName: "ph10"))
        return photos
    }
}
