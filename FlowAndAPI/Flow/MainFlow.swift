
import Foundation
import RxFlow

class MainFlow: Flow {
    
    let apiClient = ApiClient()
    
    var root: UIViewController {
        return self.rootViewController
    }
    
    private var rootViewController: UINavigationController = UINavigationController()
    
    func navigate(to step: Step) -> [Flowable] {
        guard let step = step as? MainStep else {
            return Flowable.noFlow
        }
        
        switch step {
        case .firstScreenReady:
            return navigateToFirstScreen()
        case .moveToSecondScreenButtonClicked(let user):
            return navigateToSecondScreen(user: user)
        }
    }
    
    private func navigateToFirstScreen() -> [Flowable] {
        let viewModel = FirstViewModel(apiClient: apiClient)
        let viewController = FirstViewController(viewModel: viewModel)
        rootViewController.pushViewController(viewController, animated: true)
        return [Flowable(nextPresentable: viewController, nextStepper: viewModel)]
    }
    
    private func navigateToSecondScreen(user: User) -> [Flowable] {
        let viewModel = SecondViewModel(user: user)
        let viewController = SecondViewController(viewModel: viewModel)
        rootViewController.pushViewController(viewController, animated: true)
        return Flowable.noFlow
    }
    
}
