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

        return thePhoto
        }()

    let name: UILabel = {
        let theName = UILabel()
        theName.translatesAutoresizingMaskIntoConstraints = false
        theName.text = "Alina Alinovna"
        theName.textColor = UIColor.black
        theName.adjustsFontSizeToFitWidth = true
        theName.font = UIFont(name: "HelveticaNeue-Bold", size: 19.0)

        return theName
    }()

    private lazy var showStatusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = UIColor.blue
        statusButton.frame = CGRect(
            x: 100.0,
            y: 200.0,
            width: 200.0,
            height: 50.0
        )
        
        return statusButton
    }()

    let status: UILabel = {
        let theStatus = UILabel()
        theStatus.translatesAutoresizingMaskIntoConstraints = false
        theStatus.text = "Waiting for something..."
        theStatus.textColor = UIColor.systemGray
        theStatus.adjustsFontSizeToFitWidth = true
        theStatus.font = UIFont(name: "HelveticaNeue-Regular", size: 14.0)

        return theStatus
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

        view.addSubview(name)

        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180.0).isActive = true
        name.topAnchor.constraint(equalTo: view.topAnchor, constant: 117.0).isActive = true

        view.addSubview(showStatusButton)

        showStatusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        showStatusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0).isActive = true
        showStatusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showStatusButton.bottomAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 41.0).isActive = true

        showStatusButton.layer.cornerRadius = 4.0

        showStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusButton.layer.shadowRadius = 4.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7

        view.addSubview(status)

        status.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180.0).isActive = true
        status.topAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -59.0).isActive = true

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
