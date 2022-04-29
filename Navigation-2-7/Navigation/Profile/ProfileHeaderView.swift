//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?

    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let cancelAnimationButton: UIButton = {
        let button = UIButton()
        button.layer.opacity = 0
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(pressCancelAnimationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()

    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here..."
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

    private let secondAvatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "catImage2"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let blackView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        view.alpha = 0.8
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        // view.isHidden = true
        return view
    }()

    private let labelVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    // MARK: Методы

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func tapAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {

            self.blackView.layer.opacity = 0.8
            self.avatarImageView.layer.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.layoutIfNeeded()

        } completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0) {
                self.cancelAnimationButton.layer.opacity = 1
            }
        }
    }

    @objc private func pressCancelAnimationButton() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {

            self.cancelAnimationButton.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.blackView.layer.opacity = 0.0
                self.avatarImageView.layer.position = self.secondAvatarImage.layer.position
                self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
                self.layoutIfNeeded()
            }
        }
    }

    private func layout() {

        [labelVerticalStack, setStatusButton, secondAvatarImage, blackView, avatarImageView, cancelAnimationButton].forEach({ self.addSubview($0) })
        [fullNameLabel, statusLabel, statusTextField].forEach({self.labelVerticalStack.addArrangedSubview($0)})

        let offset: CGFloat = 16

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1),

            cancelAnimationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
            cancelAnimationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset),
            cancelAnimationButton.widthAnchor.constraint(equalToConstant: 40),
            cancelAnimationButton.heightAnchor.constraint(equalTo: cancelAnimationButton.widthAnchor, multiplier: 1),

            secondAvatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
            secondAvatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset),
            secondAvatarImage.heightAnchor.constraint(equalToConstant: 100),
            secondAvatarImage.widthAnchor.constraint(equalTo: secondAvatarImage.heightAnchor, multiplier: 1),

            labelVerticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: offset),
            labelVerticalStack.leadingAnchor.constraint(equalTo: secondAvatarImage.trailingAnchor, constant: offset),
            labelVerticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset),

            setStatusButton.topAnchor.constraint(equalTo: labelVerticalStack.bottomAnchor, constant: offset),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: offset),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -offset),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -offset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            statusTextField.heightAnchor.constraint(equalToConstant: 40)
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
