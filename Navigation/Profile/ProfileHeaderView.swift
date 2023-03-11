import UIKit

class ProfileHeaderView: UIView {

    private let profilePhoto: UIImageView = {
        let thePhoto = UIImageView()
        thePhoto.translatesAutoresizingMaskIntoConstraints = false
        thePhoto.image = UIImage(named: "ProfilePhoto")
        thePhoto.layer.borderWidth = 3.0
        thePhoto.layer.borderColor = UIColor.white.cgColor
        thePhoto.layer.cornerRadius = 75

        return thePhoto
        }()

    private let nameLabel: UILabel = {
        let theName = UILabel()
        theName.translatesAutoresizingMaskIntoConstraints = false
        theName.text = "Alina Alinovna"
        theName.textColor = UIColor.black
        theName.adjustsFontSizeToFitWidth = true
        theName.font = UIFont(name: "HelveticaNeue-Bold", size: 19.0)

        return theName
    }()

    private lazy var showStatusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = UIColor.blue
        statusButton.layer.cornerRadius = 4.0
        statusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        statusButton.layer.shadowRadius = 4.0
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7

        return statusButton
    }()

    private let statusLabel: UILabel = {
        let theStatus = UILabel()
        theStatus.translatesAutoresizingMaskIntoConstraints = false
        theStatus.text = "Waiting for something..."
        theStatus.textColor = UIColor.systemGray
        theStatus.adjustsFontSizeToFitWidth = true
        theStatus.font = UIFont(name: "HelveticaNeue-Regular", size: 14.0)

        return theStatus
    }()

    override init(frame: CGRect) {
            super.init(frame: frame)
            setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        addSubview(profilePhoto)
        addSubview(nameLabel)
        addSubview(showStatusButton)
        addSubview(statusLabel)

        NSLayoutConstraint.activate([
            profilePhoto.widthAnchor.constraint(equalToConstant: 150),
            profilePhoto.heightAnchor.constraint(equalToConstant: 150),
            profilePhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            profilePhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),

            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 180.0),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),

            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
//            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.bottomAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 66.0),

            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 180.0),
            statusLabel.topAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -59.0)
        ])

        showStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        showStatusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    @objc func buttonPressed(_ sender: UIButton) {
        guard let statusText = statusLabel.text else { return }
                print("Status text: \(statusText)")
    }
}
