//
//  InfoViewController.swift
//  Navigation
//
//  Created by Максим Клочков on 05.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 3
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "Назад", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.dismiss(animated: true)
            print("Сообщение в консоль")
        }
        let cancelAlert = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(cancelAlert)
        alert.addAction(okAlert)
        present(alert, animated: true)
    }
}
