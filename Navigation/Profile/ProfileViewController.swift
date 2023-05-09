import UIKit

class ProfileViewController: UIViewController {

    let profileHV = ProfileHeaderView()

    private var photoBooks: [PhotosTableViewCell.ViewModel] = [
        PhotosTableViewCell.ViewModel(imageOne: UIImage(named: "01"), imageTwo: UIImage(named: "02"), imageThree: UIImage(named: "03"), imageFour: UIImage(named: "04"))
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "tableId")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photosId")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultId")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var imageViewBig: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = profileHV.avatarImageView.image
        image.isHidden = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 110
        image.layer.borderWidth = 6
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()

    private lazy var viewBlur: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var closeImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.closeImageView), for: .touchUpInside)
        button.setImage(.init(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.isHidden = true
        return button
    }()

    private var imageWidthConstaint: NSLayoutConstraint?
    private var imageHeightConstaint: NSLayoutConstraint?

    private var isImageViewBigIncreased = false

    override func viewDidLoad() {
        super.viewDidLoad()

        #if DEBUG
        tableView.backgroundColor = .systemGray
        #else
        tableView.backgroundColor = .white
        #endif

        setupUI()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true
    }

    private func setupUI() {
        view.addSubview(tableView)
        view.addSubview(viewBlur)
        view.addSubview(imageViewBig)
        view.addSubview(closeImageButton)
    }

    private func setupConstraints() {
        self.imageWidthConstaint = self.imageViewBig.widthAnchor.constraint(equalToConstant: 100)
        self.imageHeightConstaint = self.imageViewBig.heightAnchor.constraint(equalToConstant: 100)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            viewBlur.topAnchor.constraint(equalTo: view.topAnchor),
            viewBlur.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBlur.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewBlur.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            closeImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            imageViewBig.widthAnchor.constraint(equalToConstant: 250),
            imageViewBig.heightAnchor.constraint(equalToConstant: 250),
            imageViewBig.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageViewBig.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }

    private func layoutZoomImage(completion: @escaping () -> Void) {
        imageWidthConstaint?.constant = isImageViewBigIncreased ? 100 : view.bounds.width
        imageHeightConstaint?.constant = isImageViewBigIncreased ? 100 : view.bounds.width

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
            self.viewBlur.alpha = 0.8
            self.imageViewBig.center = self.view.center
            self.viewBlur.isHidden = false
            self.imageViewBig.isHidden = false
        } completion: { _ in
            completion()
            self.closeImageButton.isHidden = false
        }
    }

    private func animateCloseView(completion: @escaping () -> Void) {
        imageWidthConstaint?.constant = isImageViewBigIncreased ? view.bounds.width : 250
        imageHeightConstaint?.constant = isImageViewBigIncreased ? view.bounds.width : 250

        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut) {
            self.imageViewBig.frame.origin.x = CGFloat(0)
            self.imageViewBig.frame.origin.y = CGFloat(0)
            self.view.layoutIfNeeded()
            self.closeImageButton.isHidden = true
            self.viewBlur.alpha = 0.0
        } completion: { _ in
            completion()
            self.imageViewBig.isHidden = true
            self.viewBlur.isHidden = true
            self.tableView.isUserInteractionEnabled = true
        }
    }


    @objc func zoomPicture(_ gestureRecognizer: UITapGestureRecognizer) {

        self.tableView.isUserInteractionEnabled = false // делает таблицу неактивной

        let abs1 = self.view.safeAreaLayoutGuide.layoutFrame.origin.y
        tableView.setContentOffset(CGPoint(x: 0, y: -abs1), animated: true)

        let completion: () -> Void = { [weak self] in
            self?.tableView.isUserInteractionEnabled = true
        }
        self.layoutZoomImage(completion: completion)
    }

    @objc func closeImageView() {
        let completion: () -> Void = { [weak self] in
            self?.tableView.isUserInteractionEnabled = true
        }
        self.animateCloseView(completion: completion)
    }

    @objc func showPhotosViewController() {
        let showPhotosViewController = PhotosViewController()
        navigationController?.pushViewController(showPhotosViewController, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? ProfileHeaderView else { return nil }

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.zoomPicture(_:)))
            header.avatarImageView.addGestureRecognizer(tapGestureRecognizer)

            return header
        }
        return nil
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if section == 0 {
           return 1
        }

        if section == 1 {
            return postProfile.count
        }

        return 0
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "photosId", for: indexPath) as? PhotosTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)

                return cell
            }

            cell.selectionStyle = .none
            let photo = self.photoBooks[indexPath.row]
            cell.setup(with: photo)

            return cell
        }

        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableId", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)

                return cell
            }

            cell.selectionStyle = .none
            let post = postProfile[indexPath.row]
            cell.configure(with: post)

            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            showPhotosViewController()
        }
    }
}
