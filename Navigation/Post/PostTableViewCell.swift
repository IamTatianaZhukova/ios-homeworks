

import UIKit

class PostTableViewCell: UITableViewCell {

    static let id = "PostTableViewCell"

    private lazy var authorLabel: UILabel = {
        var author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.text = "nickname"
        author.font = UIFont.boldSystemFont(ofSize: 16)
        author.textColor = .black
        author.numberOfLines = 2

        return author
    }()

    private lazy var descriptionLabel: UILabel = {
        var description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "Text"
        description.font = UIFont(name: "systemFont", size: 14)
        description.textColor = .systemGray
        description.numberOfLines = 0

        return description
    }()

    private lazy var photoView: UIImageView = {
        var photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "Photo1")
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        photo.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)

        return photo
    }()

    private lazy var likesLabel: UILabel = {
        var likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.text = "Likes: 520"
        likes.font = UIFont(name: "systemFont", size: 16)
        likes.textColor = .black

        return likes
    }()

    private lazy var viewsLabel: UILabel = {
        var views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.text = "Views: 1005"
        views.font = UIFont(name: "systemFont", size: 16)
        views.textColor = .black

        return views
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        photoView.image = nil
        authorLabel.text = ""
        descriptionLabel.text = ""
        viewsLabel.text = ""
        likesLabel.text = ""
    }

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

    func configure(with post: ProfilePost) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        photoView.image = post.image
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

    func setupUI() {
        addSubview(authorLabel)
        addSubview(descriptionLabel)
        addSubview(photoView)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            photoView.topAnchor.constraint(equalTo: authorLabel.topAnchor, constant: 16),
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            photoView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: leftAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
