
import UIKit

class PhotosViewController: UIViewController {

    private enum Constants {
        static let numberOfItemsInLine: CGFloat = 3
    }

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "defaultID")

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupConstraints()
        setupUI()
    }

    private func setupUI() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultID", for: indexPath)

            return cell
        }

        cell.setup(with: photoGallery[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let insert = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0

        let wight = collectionView.frame.width - (Constants.numberOfItemsInLine - 1) * interItemSpacing - insert.left - insert.right
        let itemWight = floor(wight / Constants.numberOfItemsInLine)

        return CGSize(width: itemWight, height: itemWight)
    }
}
