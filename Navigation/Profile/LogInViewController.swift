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
        password.isSecureTextEntry = true

        return password
    }()

    private var LogInButton: UIButton = {
        var logIn = UIButton()
        logIn.translatesAutoresizingMaskIntoConstraints = false
        logIn.layer.cornerRadius = 10
        logIn.clipsToBounds = true
        logIn.setTitle("Log In", for: .normal)
        logIn.setTitleColor(.white, for: .normal)
        logIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logIn.alpha = 1.0
        logIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)
        logIn.alpha = 0.8
        logIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)
        logIn.alpha = 0.8
        logIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)
        logIn.alpha = 0.8

        return logIn
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
        view.addSubview(LogInButton)

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

            LogInButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 66),
            LogInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            LogInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            LogInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


