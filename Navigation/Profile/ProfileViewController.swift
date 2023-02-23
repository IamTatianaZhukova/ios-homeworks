//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Татьяна Жукова on 19.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    let profilePhoto: UIImageView = {
        let thePhoto = UIImageView()
        thePhoto.translatesAutoresizingMaskIntoConstraints = false
        thePhoto.image = UIImage(named: "ProfilePhoto")
        thePhoto.layer.borderWidth = 3.0
        thePhoto.layer.borderColor = UIColor.white.cgColor
        thePhoto.layer.cornerRadius = 75
        thePhoto.clipsToBounds = true

        return thePhoto
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        title = "Profile"

        view.addSubview(profilePhoto)

        profilePhoto.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profilePhoto.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profilePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 106.0).isActive = true

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
