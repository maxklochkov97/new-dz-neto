//
//  FeedPost.swift
//  Navigation
//
//  Created by Максим Клочков on 05.04.2022.
//

import UIKit

struct Post {
    let author: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int

    static func allPosts() -> [Post] {
        var posts = [Post]()

        posts.append(Post(author: "Автор", description: "Описание", image: UIImage(named: "catImage")!, likes: 1, views: 1))
        posts.append(Post(author: "Автор2", description: "Если стать котику на хвостик, он скажет: АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА", image: UIImage(named: "catImage")!, likes: 1, views: 1))
        posts.append(Post(author: "Автор3", description: "Описание", image: UIImage(named: "catImage")!, likes: 1, views: 1))
        posts.append(Post(author: "Автор4", description: "Если стать котику на хвостик, он скажет: АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА", image: UIImage(named: "catImage")!, likes: 1, views: 1))

        return posts
    }
}


