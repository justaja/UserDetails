
import UIKit
import PinLayout
import FlexLayout

class SecondView: UIView {
    
    let rootFlexContainer = UIView()
    let contentView = UIScrollView()
    var user: User
    
    let tableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    let streetTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Street"
        return label
    }()
    
    let cityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "City"
        return label
    }()
    
    let postcodeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Zipcode"
        return label
    }()
    
    let websiteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Website"
        return label
    }()
    
    let companyDetailsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Company"
        return label
    }()
    
    let postsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Posts (click to see comments)"
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let streetLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let cityLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let postcodeLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let websiteLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    let companyLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(user: User) {
        self.user = user
        super.init(frame: .zero)
        setContainer()
        setupLabels()
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.nameLabel.text = user.name
        self.streetLabel.text = user.address.street
        self.cityLabel.text = user.address.city
        self.postcodeLabel.text = user.address.zipcode
        self.websiteLabel.text = user.website
        self.companyLabel.text = user.company.name
    }
    
    private func setupLabels() {
        setTitleLabel(label: nameTitleLabel)
        setLabel(label: nameLabel)
        setTitleLabel(label: streetTitleLabel)
        setLabel(label: streetLabel)
        setTitleLabel(label: cityTitleLabel)
        setLabel(label: cityLabel)
        setTitleLabel(label: postcodeTitleLabel)
        setLabel(label: postcodeLabel)
        setTitleLabel(label: websiteTitleLabel)
        setLabel(label: websiteLabel)
        setTitleLabel(label: companyDetailsTitleLabel)
        setLabel(label: companyLabel)
        setTitleLabel(label: postsTitleLabel)
    }
    
    private func setLabel(label: UILabel) {
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
    }
    
    private func setTitleLabel(label: UILabel) {
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
    }
    
    func setContainer() {
        rootFlexContainer.flex.backgroundColor(.white).width(100%).define { flex in
            flex.addItem(nameTitleLabel).height(32).marginTop(32)
            flex.addItem(nameLabel).height(32)
            flex.addItem(streetTitleLabel).height(32)
            flex.addItem(streetLabel).height(32)
            flex.addItem(cityTitleLabel).height(32)
            flex.addItem(cityLabel).height(32)
            flex.addItem(postcodeTitleLabel).height(32)
            flex.addItem(postcodeLabel).height(32)
            flex.addItem(websiteTitleLabel).height(32)
            flex.addItem(websiteLabel).height(32)
            flex.addItem(companyDetailsTitleLabel).height(32)
            flex.addItem(companyLabel).height(32)
            flex.addItem(postsTitleLabel).height(32)
            flex.addItem(tableView).minHeight(1).marginTop(8).marginLeft(32).marginRight(32)
        }
        contentView.addSubview(rootFlexContainer)
        addSubview(contentView)
    }
    
    private func layout() {
        contentView.pin.all()
        rootFlexContainer.pin.top().left().right()
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        contentView.contentSize = rootFlexContainer.frame.size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

