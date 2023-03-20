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
        login.placeholder = "Email or phone"
        login.textColor = .black
        login.font = UIFont(name: "systemFont", size: 16)
        login.keyboardType = UIKeyboardType.default
        login.returnKeyType = UIReturnKeyType.done

        return login
    }()

    private var passwordTextField: TextFieldWithPadding = {
        var password = TextFieldWithPadding()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        password.textColor = .black
        password.font = UIFont(name: "systemFont", size: 16)
        password.isSecureTextEntry = true
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done

        return password
    }()

    private let loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.tintColor = UIColor(named: "accentColor")
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15

        return stackView
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
        loginStackView.addArrangedSubview(loginTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        view.addSubview(loginStackView)

        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),

            loginStackView.bottomAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),

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
