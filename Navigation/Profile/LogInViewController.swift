import UIKit

class LogInViewController: UIViewController {

    private let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "Logo")

        return logo
    }()

    private var loginTextField: TextFieldWithPadding = {
        var login = TextFieldWithPadding()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .systemGray6
        login.tintColor = UIColor(named: "accentColor")
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.layer.cornerRadius = 10
        login.placeholder = "Email or phone"
        login.textColor = .black
        login.font = UIFont(name: "systemFont", size: 16)
        login.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        return login
    }()

    private var passwordTextField: TextFieldWithPadding = {
        var password = TextFieldWithPadding()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .systemGray6
        password.tintColor = UIColor(named: "accentColor")
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 10
        password.placeholder = "Password"
        password.textColor = .black
        password.font = UIFont(name: "systemFont", size: 16)
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        return password
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true

        view.backgroundColor = .white


        setupConstraints()

    }

    private func setupConstraints() {
        view.addSubview(logoImage)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)

        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),

            loginTextField.bottomAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.bottomAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


