//
//  FeedPostViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 05.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let post = Post()

    private let postButtonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Читать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let postButtonSecond: UIButton = {
        let button = UIButton()
        button.setTitle("Читать пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let buttonVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
    }

    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.postTitle = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }

    private func drawSelf() {
        self.view.backgroundColor = .lightGray
        self.view.addSubview(buttonVerticalStack)
        [postButtonOne, postButtonSecond].forEach {self.buttonVerticalStack.addArrangedSubview($0)}

        NSLayoutConstraint.activate([
            self.buttonVerticalStack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.buttonVerticalStack.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.buttonVerticalStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.postButtonOne.heightAnchor.constraint(equalToConstant: 50),
            self.postButtonSecond.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
