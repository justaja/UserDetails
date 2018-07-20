
import UIKit
import RxSwift
import Moya
import RxCocoa

class AlertViewController: UIViewController {
    
    private let bag = DisposeBag()
    private let postTitleLabel = UILabel()
    private let viewModel: AlertViewModel
    
    var mainView: AlertView {
        return view as! AlertView
    }
    
    override func loadView() {
        view = AlertView()
    }
    
    init(viewModel: AlertViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments:"
        mainView.tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: "CommentsTableViewCell")
        viewModel.getComments()
        setTableView()
        bindUI()
    }
    
    func setTableView() {
        
        let comments = viewModel.comments.asObservable().share()
        
        comments
            .bind(to: mainView.tableView.rx.items) { tableView, index, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell" ,for: IndexPath(row: index, section: 0)) as! CommentsTableViewCell
                cell.configure(item: item)
                return cell
            }.disposed(by: bag)
    }
    
    func bindUI() {
        
        mainView.cancelButton.rx.tap.subscribe( onNext: {
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: bag)
    }

}

