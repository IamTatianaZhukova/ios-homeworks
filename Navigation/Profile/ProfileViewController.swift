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

        self.view.addSubview(profileHeaderView)
        view.backgroundColor = .lightGray

        title = "Profile"

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.backgroundColor = .white
        let profileHeaderViewHeight: CGFloat = 90.0
        let profileHeaderViewFrame = CGRect(
            x: 0,
            y: 0,
            width: self.view.bounds.width,
            height: profileHeaderViewHeight
        )

        profileHeaderView.frame = profileHeaderViewFrame

    }


}
