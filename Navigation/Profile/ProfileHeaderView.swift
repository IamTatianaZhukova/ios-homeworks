import UIKit

class ProfileHeaderView: UIView {

    private let avatarImageView: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.image = UIImage(named: "ProfilePhoto")
        avatarImage.layer.borderWidth = 3.0
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = 75

        return avatarImage
        }()

    private let fullNameLabel: UILabel = {
        let fullName = UILabel()
        fullName.translatesAutoresizingMaskIntoConstraints = false
        fullName.text = "Alina Alinovna"
        fullName.textColor = UIColor.black
        fullName.adjustsFontSizeToFitWidth = true
        fullName.font = UIFont(name: "HelveticaNeue-Bold", size: 19.0)

        return fullName
    }()

    private let statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Waiting for something..."
        status.textColor = UIColor.systemGray
        status.adjustsFontSizeToFitWidth = true
        status.font = UIFont(name: "HelveticaNeue-Regular", size: 14.0)

        return status
    }()

    private let statusTextField: UITextField = {
        let statusText = UITextField()
        statusText.translatesAutoresizingMaskIntoConstraints = false
        statusText.placeholder = "Enter new status"
        statusText.borderStyle = .roundedRect

        return statusText
    }()

    private lazy var setStatusButton: UIButton = {
        let setStatus = UIButton()
        setStatus.translatesAutoresizingMaskIntoConstraints = false
        setStatus.setTitle("Show status", for: .normal)
        setStatus.setTitleColor(.white, for: .normal)
        setStatus.backgroundColor = UIColor.blue
        setStatus.layer.cornerRadius = 4.0
        setStatus.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        setStatus.layer.shadowRadius = 4.0
        setStatus.layer.shadowColor = UIColor.black.cgColor
        setStatus.layer.shadowOpacity = 0.7

        return setStatus
    }()

    override init(frame: CGRect) {
            super.init(frame: frame)
            setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)

        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),

            fullNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 180.0),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),

            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
//            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 66.0),

            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 180.0),
            statusLabel.topAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -59.0)
        ])

        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        setStatusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    @objc func buttonPressed(_ sender: UIButton) {
        guard let statusText = statusLabel.text else { return }
                print("Status text: \(statusText)")
    }
}
