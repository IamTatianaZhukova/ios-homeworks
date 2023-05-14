import UIKit
import SnapKit

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

        avatarImageView.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(150)
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
        }

        fullNameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(14)
            make.top.equalToSuperview().inset(27)
        }

        statusLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(14)
            make.top.equalTo(fullNameLabel.snp.bottom).offset(20)
        }

        viewTextStatus.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(14)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(fullNameLabel.snp.bottom).offset(50)
            make.height.equalTo(40)
        }

        statusTextField.snp.makeConstraints { make in
            make.left.right.equalTo(viewTextStatus).inset(10)
            make.top.bottom.equalTo(viewTextStatus).inset(5)
        }

        setStatusButton.snp.makeConstraints { make in
            make.top.equalTo(viewTextStatus.snp.bottom).offset(35)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(16)
        }
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
