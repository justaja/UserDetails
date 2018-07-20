
import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    private let bag = DisposeBag()
    private let viewModel: FirstViewModel
    
    var mainView: FirstView {
        return view as! FirstView
    }
    
    override func loadView() {
        view = FirstView()
    }
    
    init(viewModel: FirstViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        viewModel.getUsers()
        bindUI()
        setCollectionView()
    }
    
    private func setCollectionView() {
        let usersObservable = self.viewModel.users.asObservable().share()
        usersObservable
            .bind(to: mainView.collectionView.rx.items) { collectionView, index, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell" ,for: IndexPath(row: index, section: 0)) as! CollectionViewCell
                cell.configure(item: item)
                return cell
            }.disposed(by: bag)
    }

    func bindUI() {
        mainView.collectionView.rx.modelSelected(User.self).subscribe( onNext: { [viewModel] in
            viewModel.moveToSecondVC(user: $0)
        }).disposed(by: bag)
    }
}

