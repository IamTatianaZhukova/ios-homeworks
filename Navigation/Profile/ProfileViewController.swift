//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Татьяна Жукова on 19.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        title = "Profile"

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.backgroundColor = .white
        profileHeaderView.frame = CGRect(
            x: 0,
            y: 0,
            width: 1000,
            height: 90
        )

        view.addSubview(profileHeaderView)
    }

}
