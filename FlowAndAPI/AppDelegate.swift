
import UIKit
import RxFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator = Coordinator()
    
    lazy var mainFlow = {
        return MainFlow()
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        Flows.whenReady(flow: mainFlow) { [weak window] (flowRoot) in
            window?.rootViewController = flowRoot
        }
        
        coordinator.coordinate(flow: mainFlow, withStepper: OneStepper(withSingleStep: MainStep.firstScreenReady))
        return true
    }
    
}

