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
    var likes: Int
    var views: Int

    static func allPosts() -> [Post] {
        var posts = [Post]()

        posts.append(Post(author: "Длинное описание, тестим что будет если раскрыть полностью пост ......... Опа, а тут полный заголовок =) И описание тоже =)", description: "Описание", image: UIImage(named: "catImage")!, likes: 1, views: 1))
        posts.append(Post(author: "Автор2 тест описания на 2 строки будет находиться тут", description: "Если стать котику на хвостик, он скажет: АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА", image: UIImage(named: "catImage")!, likes: 2, views: 1))
        posts.append(Post(author: "Автор3 и это очень длинный автор, аж на 2 строки", description: "Описание", image: UIImage(named: "catImage")!, likes: 3, views: 1))
        posts.append(Post(author: "Автор4", description: "Если стать котику на хвостик, он скажет: АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА-АААА", image: UIImage(named: "catImage")!, likes: 4, views: 1))

        return posts
    }
}


