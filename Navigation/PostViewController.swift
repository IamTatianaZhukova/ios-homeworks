//
//  PostViewController.swift
//  Navigation
//
//  Created by Татьяна Жукова on 15.02.2023.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post?
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Прочитать пост", for: .normal)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = .systemIndigo

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
        let infoViewController = InfoViewController()

        InfoViewController().modalTransitionStyle = .coverVertical
        InfoViewController().modalPresentationStyle = .pageSheet

        present(infoViewController, animated: true)
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
