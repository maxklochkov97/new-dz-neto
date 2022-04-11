//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Максим Клочков on 06.04.2022.
//

import UIKit

// Реализация оступа в UITextField
extension UITextField {

    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }

    func addPadding(_ padding: PaddingSide) {

        self.leftViewMode = .always
        self.layer.masksToBounds = true


        switch padding {

        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always

        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always

        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

class ProfileHeaderView: UIView {

    private var statusText: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.titleShadowColor(for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let statusTextField: UITextField = {
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

    func setupLayout() {

        // добавление catFaceImage на profileHV
        self.addSubview(catFaceImage)
        catFaceImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        catFaceImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        catFaceImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        catFaceImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

        // добавление mainLabel, statusLabel, statusTextField на profileHV
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let textStackView = UIStackView(arrangedSubviews: [mainLabel, statusLabel, statusTextField])
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.distribution = .fillEqually
        textStackView.axis = .vertical
        self.addSubview(textStackView)

        textStackView.centerYAnchor.constraint(equalTo: catFaceImage.centerYAnchor).isActive = true
        textStackView.leadingAnchor.constraint(equalTo: catFaceImage.trailingAnchor, constant: 16).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        // добавление statusButton на profileHV
        self.addSubview(statusButton)
        statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        statusButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16).isActive = true
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText ?? ""
        print(statusLabel.text ?? "Поле статус пусто...")
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
