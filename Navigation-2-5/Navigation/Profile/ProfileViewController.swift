//
//  SecondViewController.swift
//  UINavigationNeto - Ivan
//
//  Created by Максим Клочков on 04.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    // 2-5
    var photoModel = Photo.allPhotos()
    // 2-5
    
    private let postModel: [Post] = Post.allPosts()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifier)

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    private func setupView() {
        self.view.backgroundColor = ColorSet.secondColor

        [self.tableView].forEach({ self.view.addSubview($0)})

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return  postModel.count
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as! PhotoTableViewCell
            cell.configure(photos: photoModel)
            cell.selectionStyle = .none
            cell.delegate = self
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(postModel[indexPath.row])
            cell.selectionStyle = .none
            cell.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else {
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            header.backgroundColor = ColorSet.secondColor
            return header
        } else {
            return nil
        }
    }
}

// MARK: - ButtonDelegate

extension ProfileViewController: CustomCellDelegate {
    func buttonPressed() {
        let newView = AllPhotoViewController()
        navigationController?.pushViewController(newView, animated: true)
    }
}
