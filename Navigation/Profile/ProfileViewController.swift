
import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        view.backgroundColor = .lightGray

        title = "Profile"

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])

    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        profileHeaderView.backgroundColor = .white
//        let profileHeaderViewHeight: CGFloat = 90.0
//        let profileHeaderViewFrame = CGRect(
//            x: 0,
//            y: 0,
//            width: self.view.bounds.width,
//            height: profileHeaderViewHeight
//        )
//
//        profileHeaderView.frame = profileHeaderViewFrame
//
//    }


}
