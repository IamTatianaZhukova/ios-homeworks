import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    let headerTableView = ProfileTableHeaderView()

    private enum CellReuseID: String {
        case headerCell = "ProfileTableHeaderView_ReuseID"
        case postCell = "PostTabelViewCell_ReuseID"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        setupUI()
        configureUI()

    }

    func setupUI() {
        view.addSubview(tableView)
        setupTableView()
    }

    func configureUI() {
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            headerTableView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500

        tableView.register(ProfileTableHeaderView.self, forCellReuseIdentifier: CellReuseID.headerCell.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.postCell.rawValue)

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerTableView

        } else {
            return nil
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return postProfile.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.postCell.rawValue, for: indexPath) as? PostTableViewCell else {
                        fatalError("could not dequeueReusableCell \(CellReuseID.postCell.rawValue)")
            }
        cell.configure(with: postProfile[indexPath.row])
        return cell
    }


}
