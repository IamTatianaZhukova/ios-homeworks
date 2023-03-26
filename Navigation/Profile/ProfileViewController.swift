
import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        view.backgroundColor = .lightGray
        title = "Profile"
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()
        setupTable()
    }

    private lazy var postTabView: UITableView = {
        let postTab = UITableView(frame: .zero, style: .plain)
        postTab.dataSource = self
        postTab.delegate = self
        postTab.translatesAutoresizingMaskIntoConstraints = false
        
        return postTab
    }()

    func setupTable() {
        postTabView.delegate = self
        postTabView.dataSource = self
    }

    private func setupConstraints() {
        view.addSubview(postTabView)

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 20),

            postTabView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            postTabView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTabView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
            2
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postProfile.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            guard let cell = postTabView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
            let post = postProfile[indexPath.row]
            cell.configure(with: post)

            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return profileHeaderView
        } else {
            return nil
        }
    }

}
