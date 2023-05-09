//
//import UIKit
//
//class ProfileTableHeaderView: UITableViewCell {
//
//    let profileHeaderView = ProfileHeaderView()
//
////    private lazy var newButton: UIButton = {
////        let theNewButton = UIButton()
////        theNewButton.translatesAutoresizingMaskIntoConstraints = false
////        theNewButton.setTitle("Change title", for: .normal)
////        theNewButton.setTitleColor(.white, for: .normal)
////        theNewButton.backgroundColor = UIColor.systemGreen
////        theNewButton.layer.cornerRadius = 4.0
////        theNewButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
////        theNewButton.layer.shadowRadius = 4.0
////        theNewButton.layer.shadowColor = UIColor.black.cgColor
////        theNewButton.layer.shadowOpacity = 0.7
////
////        return theNewButton
////    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        setupUI()
//        setupConstraints()
//    }
//
//       required init?(coder aDecoder: NSCoder) {
//           fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupUI() {
////        addSubview(newButton)
//        addSubview(profileHeaderView)
//    }
//
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
////            profileHeaderView.heightAnchor.constraint(equalToConstant: 260),
//
////            newButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
////            newButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
////            newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 80),
////            newButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//}
