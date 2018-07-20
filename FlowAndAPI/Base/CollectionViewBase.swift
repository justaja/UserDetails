
import UIKit

class CollectionViewBase: UICollectionView {
    
    let flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        return flowLayout
    }()
    
    let itemSize = Int(UIScreen.main.bounds.width / 2) - 10
    
    init() {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        setUpItemSize(width: itemSize, height: itemSize)
        backgroundColor = .white
        register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpItemSize(width: Int, height: Int) {
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
}
