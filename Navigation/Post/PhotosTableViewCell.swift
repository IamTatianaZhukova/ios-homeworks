
import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let imagesSize = (UIScreen.main.bounds.width - 48) / 4

    struct ViewModel {
        var imageOne: UIImage?
        var imageTwo: UIImage?
        var imageThree: UIImage?
        var imageFour: UIImage?
    }

    let photosLabel: UILabel = {
        let photos = UILabel()
        photos.translatesAutoresizingMaskIntoConstraints = false
        photos.text = "Photos"
        photos.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photos.textColor = .black

        return photos
    }()

    let arrowImageView: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.image = UIImage(systemName: "arrow.right")
        arrowImage.tintColor = .black

        return arrowImage
    }()

    let photo1ImageView: UIImageView = {
        let photo1 = UIImageView()
        photo1.translatesAutoresizingMaskIntoConstraints = false
        photo1.layer.cornerRadius = 6
        photo1.clipsToBounds = true

        return photo1
    }()

    let photo2ImageView: UIImageView = {
        let photo2 = UIImageView()
        photo2.translatesAutoresizingMaskIntoConstraints = false
        photo2.layer.cornerRadius = 6
        photo2.clipsToBounds = true

        return photo2
    }()

    let photo3ImageView: UIImageView = {
        let photo3 = UIImageView()
        photo3.translatesAutoresizingMaskIntoConstraints = false
        photo3.layer.cornerRadius = 6
        photo3.clipsToBounds = true

        return photo3
    }()

    let photo4ImageView: UIImageView = {
        let photo4 = UIImageView()
        photo4.translatesAutoresizingMaskIntoConstraints = false
        photo4.layer.cornerRadius = 6
        photo4.clipsToBounds = true

        return photo4
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8

        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with viewModel: ViewModel){
        photo1ImageView.image = viewModel.imageOne
        photo2ImageView.image = viewModel.imageTwo
        photo3ImageView.image = viewModel.imageThree
        photo4ImageView.image = viewModel.imageFour
    }

    private func setupConstraints() {
        addSubview(photosLabel)
        addSubview(arrowImageView)
        addSubview(stackView)
        [photo1ImageView, photo2ImageView, photo3ImageView, photo4ImageView].forEach {
            stackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            arrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),

            stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            photo1ImageView.widthAnchor.constraint(equalToConstant: imagesSize),
            photo1ImageView.heightAnchor.constraint(equalToConstant: imagesSize),

            photo2ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo2ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),

            photo3ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo3ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),

            photo4ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo4ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor)
        ])
    }

}
