//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Татьяна Жукова on 21.03.2023.
//

import UIKit

class ProfileTableHederView: UIView {

    let profileHeaderView = ProfileHeaderView()

    private lazy var newButton: UIButton = {
        let theNewButton = UIButton()
        theNewButton.translatesAutoresizingMaskIntoConstraints = false
        theNewButton.setTitle("Change title", for: .normal)
        theNewButton.setTitleColor(.white, for: .normal)
        theNewButton.backgroundColor = UIColor.systemGreen
        theNewButton.layer.cornerRadius = 4.0
        theNewButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        theNewButton.layer.shadowRadius = 4.0
        theNewButton.layer.shadowColor = UIColor.black.cgColor
        theNewButton.layer.shadowOpacity = 0.7

        return theNewButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        profileHeaderView.backgroundColor = .lightGray
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()

        newButton.addTarget(self, action: #selector(newButtonPressed), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



       private func setupConstraints() {
           addSubview(newButton)
           addSubview(profileHeaderView)

           NSLayoutConstraint.activate([
               profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
               profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
               profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
               profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

               newButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
               newButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
               newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 80),
               newButton.heightAnchor.constraint(equalToConstant: 50)
           ])
       }

       @objc func newButtonPressed() {
           guard let newStatusText = profileHeaderView.statusTextField.text else { return }
           profileHeaderView.statusTextField.text = newStatusText
           profileHeaderView.statusTextField.text = ""
       }

}
