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

    let nameLabel: UILabel = {
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

    let statusLabel: UILabel = {
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
        view.addSubview(nameLabel)
        view.addSubview(showStatusButton)

        showStatusButton.layer.cornerRadius = 4.0
        showStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusButton.layer.shadowRadius = 4.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        view.addSubview(statusLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePhoto.widthAnchor.constraint(equalToConstant: 150),
            profilePhoto.heightAnchor.constraint(equalToConstant: 150),
            profilePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 106.0),

            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180.0),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 117.0),

            showStatusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            showStatusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            showStatusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showStatusButton.bottomAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 41.0),

            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180.0),
            statusLabel.topAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -59.0)
        ])
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

    @objc func buttonPressed(_ sender: UIButton) {
        guard let statusText = statusLabel.text else { return }
                print("Status text: \(statusText)")
    }

}
