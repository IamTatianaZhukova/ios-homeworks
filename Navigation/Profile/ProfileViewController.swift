
import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    private enum CellReuseID: String {
        case headerCell = "ProfileHeaderView_ReuseID"
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
        ])
    }

    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000

        tableView.register(ProfileHeaderView.self, forCellReuseIdentifier: CellReuseID.headerCell.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.postCell.rawValue)

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postProfile.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.headerCell.rawValue, for: indexPath) as? ProfileHeaderView else {
                fatalError("could not dequeueReusableCell \(CellReuseID.headerCell.rawValue)")
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.postCell.rawValue, for: indexPath) as? PostTableViewCell else {
                fatalError("could not dequeueReusableCell \(CellReuseID.postCell.rawValue)")
            }
            cell.configure(with: postProfile[indexPath.row - 1])
            return cell
        }
    }
}
