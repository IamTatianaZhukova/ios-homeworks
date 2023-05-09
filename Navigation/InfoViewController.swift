//
//  InfoViewController.swift
//  Navigation
//
//  Created by Татьяна Жукова on 16.02.2023.
//

import UIKit
import StorageService

class InfoViewController: UIViewController {

    var post: Post?

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        view.addSubview(actionButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])

        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    @objc func buttonPressed(_ sender: UIButton) {
        let infoAlertController = UIAlertController(title: "Уведомление", message: "Закрыть пост?", preferredStyle: .alert)

        infoAlertController.addAction(UIAlertAction(title: "Да", style: .default, handler: nil))
        infoAlertController.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))

        self.present(infoAlertController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
