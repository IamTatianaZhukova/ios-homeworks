
import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        view.backgroundColor = .lightGray
        title = "Profile"
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()

    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }

}

