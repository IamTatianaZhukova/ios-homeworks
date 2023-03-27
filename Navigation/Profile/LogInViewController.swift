import UIKit

class LogInViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }

    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }

    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }

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
        login.keyboardType = UIKeyboardType.default
        login.returnKeyType = UIReturnKeyType.done
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
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done

        return password
    }()

    private var logInButton: UIButton = {
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

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true

        view.backgroundColor = .white


        setupConstraints()

    }

    private func setupConstraints() {
        view.addSubview(logoImage)
        view.addSubview(logInButton)
        view.addSubview(scrollView)
        view.addSubview(contentView)
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

            logInButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 66),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),

            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16.0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
    }

    @objc func logInButtonPressed() {
        let profile = ProfileViewController()
        navigationController?.pushViewController(profile, animated: true)
    }

    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}
