

import UIKit

class PostTableViewCell: UITableViewCell {

    static let id = "PostTableViewCell"

    private lazy var authorLabel: UILabel = {
        var author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        author.textColor = .black
        author.numberOfLines = 2

        return author
    }()

    private lazy var descriptionLabel: UILabel = {
        var description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        description.textColor = .systemGray
        description.numberOfLines = 0

        return description
    }()

    private lazy var photoView: UIImageView = {
        var photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black

        return photo
    }()

    private lazy var likesLabel: UILabel = {
        var likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black

        return likes
    }()

    private lazy var viewsLabel: UILabel = {
        var views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black

        return views
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }

    func setupUI() {
        self.addSubview(authorLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(photoView)
        self.addSubview(likesLabel)
        self.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            photoView.bottomAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            photoView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            descriptionLabel.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.leftAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            viewsLabel.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(with post: ProfilePost) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        photoView.image = UIImage (named: post.image)
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

}
