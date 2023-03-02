//
//  PostViewController.swift
//  Navigation
//
//  Created by Татьяна Жукова on 15.02.2023.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post?


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        let textPost = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(buttonPressed))

        navigationItem.rightBarButtonItem = textPost
    }

    @objc func buttonPressed(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        let navigationController = UINavigationController(rootViewController: infoViewController)
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }

}
