//
//  LogInViewController.swift
//  Navigation
//
//  Created by Максим Клочков on 18.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var logInView: LogInView = {
        let view = LogInView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupView() {
        self.view.backgroundColor = .white
        
        [self.logInView].forEach({ self.view.addSubview($0)})

        NSLayoutConstraint.activate([
            self.logInView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.logInView.heightAnchor.constraint(equalToConstant: 240),
            self.logInView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.logInView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
