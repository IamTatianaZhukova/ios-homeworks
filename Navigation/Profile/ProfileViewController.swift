import UIKit

class ProfileViewController: UIViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        view.backgroundColor = .lightGray

        title = "Profile"

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()

        newButton.addTarget(self, action: #selector(newButtonPressed), for: .touchUpInside)

    }

    private func setupConstraints() {
        view.addSubview(newButton)

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 80),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
