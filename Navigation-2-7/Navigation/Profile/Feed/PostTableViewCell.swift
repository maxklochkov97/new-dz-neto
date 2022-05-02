//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Максим Клочков on 19.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    weak var tapPostImageDelegate: TapPostImageDelegate?

    private var modelPostFull = Post(author: "", description: "", image: UIImage(named: "catImage")!, likes: 1, views: 1)

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.text = "nameLabel"
        return label
    }()
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.text = "descriptionLabel"
        return label
    }()
    
    private var likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.isUserInteractionEnabled = true
        label.text = "likeLabel"
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        label.text = "viewsLabel"
        label.isUserInteractionEnabled = true

        return label
    }()

    private let labelVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.spacing = 0
        return stack
    }()

    private let mainLabelVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupGestures() {
        let tapLikeLabelGesture = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likeLabel.addGestureRecognizer(tapLikeLabelGesture)

        let tapPostImageViewGesture = UITapGestureRecognizer(target: self, action: #selector(postImageViewAction))
        postImageView.addGestureRecognizer(tapPostImageViewGesture)
    }

    @objc private func postImageViewAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            
            self.modelPostFull.views += 1
            self.viewsLabel.text = "views \(self.modelPostFull.views)"
            self.tapPostImageDelegate?.postImagePressed(author: self.modelPostFull.author, description: self.modelPostFull.description, image: self.modelPostFull.image)
        }
    }

    @objc private func likeAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {

            self.modelPostFull.likes += 1
            self.likeLabel.text = "likes \(self.modelPostFull.likes)"
        }
    }
    
    func setupCell(_ model: Post) {
        modelPostFull = model
        authorLabel.text = model.author
        postImageView.image = model.image
        descriptionLabel.text = model.description
        likeLabel.text = "likes \(String(model.likes))"
        viewsLabel.text = "views \(String(model.views))"
    }
    
    private func layout() {
        [whiteView, postImageView, authorLabel, mainLabelVerticalStack].forEach { contentView.addSubview($0) }

        [descriptionLabel, labelVerticalStack].forEach({ mainLabelVerticalStack.addArrangedSubview($0) })

        [likeLabel, viewsLabel].forEach({ labelVerticalStack.addArrangedSubview($0) })

        let offsetView: CGFloat = 0
        let offsetLabel: CGFloat = 16
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offsetView),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offsetView),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offsetView),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offsetView),

            authorLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: offsetLabel),
            authorLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: offsetLabel),
            authorLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -offsetLabel),

            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: offsetLabel),
            postImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: offsetView),
            postImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -offsetView),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1),

            mainLabelVerticalStack.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: offsetLabel),
            mainLabelVerticalStack.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: offsetLabel),
            mainLabelVerticalStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -offsetLabel),
            mainLabelVerticalStack.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -offsetLabel)
        ])
    }
}
