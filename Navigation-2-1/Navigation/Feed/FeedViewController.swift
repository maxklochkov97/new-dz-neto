//
//  FeedPostViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 05.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let post = Post()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        makeButton()

    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Читать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 3
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.postTitle = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }

}
