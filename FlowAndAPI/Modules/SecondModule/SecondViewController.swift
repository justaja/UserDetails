
import UIKit
import RxSwift
import Moya
import RxCocoa

class SecondViewController: UIViewController {
    
    private let bag = DisposeBag()
    private let postTitleLabel = UILabel()
    private let viewModel: SecondViewModel
    
    var user: User
    
    var mainView: SecondView {
        return view as! SecondView
    }
    
    override func loadView() {
        view = SecondView(user: user)
    }
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        self.user = viewModel.user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        mainView.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.viewModel.getPosts(userId: user.id)
        setTableView()
        bindUI()
    }
    
    func setTableView() {
        let posts = viewModel.posts.asObservable().share()
        
        posts
            .bind(to: mainView.tableView.rx.items) { tableView, index, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" ,for: IndexPath(row: index, section: 0)) as! TableViewCell
                cell.configure(item: item)
                return cell
            }.disposed(by: bag)
    }
    
    func bindUI() {
        mainView.tableView.rx.modelSelected(Post.self).subscribe( onNext: { [viewModel] in
            viewModel.getComments(postId: $0.id)
            let vm = AlertViewModel(postId: $0.id)
            let vc = AlertViewController(viewModel: vm)
            vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(vc, animated: true, completion: nil)
        }).disposed(by: bag)
    }
}

