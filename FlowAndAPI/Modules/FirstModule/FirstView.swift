
import UIKit
import PinLayout
import FlexLayout

class FirstView: UIView {
    
    let rootFlexContainer = UIView()
    
    var collectionView = CollectionViewBase()
    
    init() {
        super.init(frame: .zero)
        setContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainer() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(collectionView).margin(2).minHeight(1).grow(1)
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
}

