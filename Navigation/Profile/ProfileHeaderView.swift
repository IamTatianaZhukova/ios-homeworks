import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    private lazy var fullNameLabel: UILabel = {
        let fullName = UILabel()
        fullName.text = "Alina Alinovna"
        fullName.font = UIFont.boldSystemFont(ofSize: 18)
        fullName.textColor = .black
        fullName.translatesAutoresizingMaskIntoConstraints = false
        return fullName
    }()

    lazy var avatarImageView: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.image = UIImage(named: "ProfilePhoto")
        avatarImage.layer.borderWidth = 3.0
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = 75
        avatarImage.isUserInteractionEnabled = true
        avatarImage.contentMode = .scaleToFill
        avatarImage.clipsToBounds = true

        return avatarImage
    }()

    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.text = "Waiting for something..."
        status.textColor = .gray
        status.translatesAutoresizingMaskIntoConstraints = false

        return status
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private lazy var statusTextField: UITextField = {
        let statusText = UITextField()
        statusText.placeholder = "Enter new status"
        statusText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusText.backgroundColor = .white
        statusText.translatesAutoresizingMaskIntoConstraints = false

        return statusText
    }()

    private lazy var viewTextStatus: UIView = {
        let viewText = UIView()
        viewText.layer.borderWidth = 1
        viewText.layer.borderColor = UIColor.black.cgColor
        viewText.layer.cornerRadius = 12
        viewText.backgroundColor = .white
        viewText.translatesAutoresizingMaskIntoConstraints = false
        return viewText
    }()

    private var statusText: String = ""

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.addTarget()
        self.addTargets()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {

        addSubview(fullNameLabel)
        addSubview(avatarImageView)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(viewTextStatus)
        addSubview(statusTextField)

        NSLayoutConstraint.activate([

            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 14),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 14),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),

            viewTextStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 14),
            viewTextStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewTextStatus.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 50),
            viewTextStatus.heightAnchor.constraint(equalToConstant: 40),

            statusTextField.leadingAnchor.constraint(equalTo: viewTextStatus.leadingAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: viewTextStatus.trailingAnchor, constant: -10),
            statusTextField.topAnchor.constraint(equalTo: viewTextStatus.topAnchor, constant: 5),
            statusTextField.bottomAnchor.constraint(equalTo: viewTextStatus.bottomAnchor, constant: -5),

            setStatusButton.topAnchor.constraint(equalTo: viewTextStatus.bottomAnchor, constant: 45),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    private func addTarget () {
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    private func addTargets () {
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }

    @objc private func buttonPressed () {
        statusLabel.text = statusText
    }

    @objc private func statusTextChanged () {
        if statusTextField.text != nil {
            statusText = statusTextField.text!
        }
    }

}
