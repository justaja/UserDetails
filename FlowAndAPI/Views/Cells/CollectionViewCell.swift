
import FlexLayout
import PinLayout
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let rootFlexContainer = UIView()
    let identifier = "CollectionViewCell"
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        return label
    }()
    
    let phoneTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let phoneLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setContainer()
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabels() {
        setTitleLabel(label: nameTitleLabel)
        setLabel(label: nameLabel)
        setTitleLabel(label: emailTitleLabel)
        setLabel(label: emailLabel)
        setTitleLabel(label: phoneTitleLabel)
        setLabel(label: phoneLabel)
    }
    
    private func setLabel(label: UILabel) {
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11)
    }
    
    private func setTitleLabel(label: UILabel) {
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    func setupCell() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.layer.masksToBounds = true
    }
    
    private func setContainer() {
        rootFlexContainer.flex.backgroundColor(UIColor.random()).alignContent(.center).width(100%).addItem().define { flex in
            flex.addItem(nameTitleLabel).height(16).marginTop(32)
            flex.addItem(nameLabel).height(16)
            flex.addItem(emailTitleLabel).height(16)
            flex.addItem(emailLabel).height(16)
            flex.addItem(phoneTitleLabel).height(16)
            flex.addItem(phoneLabel).height(16)
        }
        addSubview(rootFlexContainer)
        layoutSubviews()
    }
    
    private func layout() {
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func configure(item: User) {
        nameLabel.text = item.name
        emailLabel.text = item.email
        phoneLabel.text = item.phone
        setNeedsLayout()
    }
}
