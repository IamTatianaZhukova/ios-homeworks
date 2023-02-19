//
//  FeedViewController.swift
//  Navigation
//
//  Created by Татьяна Жукова on 14.02.2023.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Новый пост")

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Открыть", for: .normal)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(actionButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])

        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    @objc func buttonPressed(_ sender: UIButton) {
        let post = PostViewController()
        post.title = "Новый пост"
        navigationController?.pushViewController(post, animated: true)
    }
}
