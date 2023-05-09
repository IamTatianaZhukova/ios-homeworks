
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with photo: ProfilePhotos) {
        photoImage.image = photo.photo
    }

    private func setupConstraints() {
        addSubview(photoImage)

        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
