
import UIKit
import PinLayout
import FlexLayout

class AlertView: UIView {
    
    let rootFlexContainer = UIView()
    
    let cancelButton: UIButton = {
       let button = UIButton()
        button.setTitle("X", for: .normal)
        return button
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Comments"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    let tableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainer() {
        rootFlexContainer.flex.backgroundColor(.lightGray).cornerRadius(8).shadow(offset: CGSize(width: 8, height: 8), radius: 8, opacity: 0.5).marginRight(32).marginLeft(32).define { flex in
            flex.addItem(cancelButton).height(32).width(32)
            flex.addItem(commentsLabel).height(32).width(100%)
            flex.addItem(tableView).backgroundColor(.lightGray).margin(2).minHeight(1)
        }
        addSubview(rootFlexContainer)
        layoutSubviews()
    }
    
    private func layout() {
        rootFlexContainer.pin.left().right().top(200).height(250)
        rootFlexContainer.flex.layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

