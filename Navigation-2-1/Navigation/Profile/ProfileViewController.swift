//
//  SecondViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 04.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileHV = ProfileHeaderView()

    private var statusText: String?

    let statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.titleShadowColor(for: .normal)

        // Добавлена тень
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Enter text here"
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white

        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Wait for something..."
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let catFaceImage: UIImageView = {
        let image = UIImage(named: "catImage2")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // view.addSubview(mainButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setupLayout()
    }

    @objc private func buttonPressed() {
        print(statusLabel.text ?? "Поле статус пусто...")
        statusLabel.text = statusText
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }

    private func setupLayout() {
        view.addSubview(profileHV)

        // настройка constraint для profileHV
        profileHV.translatesAutoresizingMaskIntoConstraints = false

        profileHV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileHV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileHV.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileHV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // добавление catFaceImage на profileHV
        profileHV.addSubview(catFaceImage)
        catFaceImage.topAnchor.constraint(equalTo: profileHV.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        catFaceImage.leadingAnchor.constraint(equalTo: profileHV.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        catFaceImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        catFaceImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // добавление mainLabel, statusLabel, statusTextField на profileHV
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let textStackView = UIStackView(arrangedSubviews: [mainLabel, statusLabel, statusTextField])
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.distribution = .fillEqually
        textStackView.axis = .vertical
        profileHV.addSubview(textStackView)

        textStackView.centerYAnchor.constraint(equalTo: catFaceImage.centerYAnchor).isActive = true
        textStackView.leadingAnchor.constraint(equalTo: catFaceImage.trailingAnchor, constant: 16).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: profileHV.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true

        // добавление statusButton на profileHV
        profileHV.addSubview(statusButton)
        statusButton.leadingAnchor.constraint(equalTo: profileHV.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        statusButton.trailingAnchor.constraint(equalTo: profileHV.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        statusButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
