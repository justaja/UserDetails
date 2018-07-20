
import Foundation
import RxFlow

enum MainStep: Step {
    case firstScreenReady
    case moveToSecondScreenButtonClicked(user: User)
}


