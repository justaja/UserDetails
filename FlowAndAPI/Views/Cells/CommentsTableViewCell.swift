
import UIKit
import FlexLayout

class CommentsTableViewCell: UITableViewCell {
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.flex.define { (flex) in
            flex.addItem().direction(.column).backgroundColor(.lightGray).minHeight(32).define { flex in
                flex.addItem(authorLabel).width(100%)
                flex.addItem(titleLabel).width(100%).marginTop(4)
                flex.addItem(bodyLabel).width(100%).marginTop(4)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: Comment) {
        titleLabel.text = item.name
        bodyLabel.text = item.body
        authorLabel.text = item.email
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return contentView.frame.size
    }
}
