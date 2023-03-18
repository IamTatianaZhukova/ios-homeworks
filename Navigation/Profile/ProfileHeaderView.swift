import UIKit


class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

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

    var statusTextField: TextFieldWithPadding = {
        let statusText = TextFieldWithPadding()
        statusText.translatesAutoresizingMaskIntoConstraints = false
        statusText.placeholder = "Enter new status"
        statusText.backgroundColor = UIColor.white
        statusText.layer.cornerRadius = 12.0
        statusText.layer.borderWidth = 1.0
        statusText.layer.borderColor = UIColor.black.cgColor
        statusText.font = UIFont(name: "HelveticaNeue-Regular", size: 15.0)

        return statusText
    }()

    private lazy var setStatusButton: UIButton = {
        let setStatus = UIButton()
        setStatus.translatesAutoresizingMaskIntoConstraints = false
        setStatus.setTitle("Set status", for: .normal)
        setStatus.setTitleColor(.white, for: .normal)
        setStatus.backgroundColor = UIColor.systemBlue
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
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 180.0),
            statusLabel.topAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -72.0),

            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.bottomAnchor, constant: -58),

            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 56.0)

        ])

        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }

    @objc func buttonPressed() {
        guard let newStatusText = statusTextField.text else { return }
        statusLabel.text = newStatusText
        statusLabel.textColor = UIColor.black
        statusTextField.text = ""
    }

}
