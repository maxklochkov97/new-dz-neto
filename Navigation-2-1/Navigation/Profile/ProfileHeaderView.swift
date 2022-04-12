//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?

    // MARK: Свойства

    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4

        // Добавлена тень
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Enter text here..."
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addPadding(.left(5))
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Wait for something..."
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "catImage2"))
        imageView.frame = .zero
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let labelVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    let infoHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        return stack
    }()

    // MARK: Методы

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func drawSelf() {
        self.addSubview(infoHorizontalStack)
        self.addSubview(setStatusButton)
        self.infoHorizontalStack.addArrangedSubview(avatarImageView)
        self.infoHorizontalStack.addArrangedSubview(labelVerticalStack)
        self.labelVerticalStack.addArrangedSubview(fullNameLabel)
        self.labelVerticalStack.addArrangedSubview(statusLabel)
        self.labelVerticalStack.addArrangedSubview(statusTextField)

        NSLayoutConstraint.activate([
            self.infoHorizontalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.infoHorizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.infoHorizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0),

            self.setStatusButton.topAnchor.constraint(equalTo: self.infoHorizontalStack.bottomAnchor, constant: 15),
            self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText ?? ""
        print(statusLabel.text ?? "Поле статус пусто...")
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
