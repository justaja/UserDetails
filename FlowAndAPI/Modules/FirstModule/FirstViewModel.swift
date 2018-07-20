
import Foundation
import RxFlow
import RxSwift

class FirstViewModel: Stepper {
    
    var apiClient: ApiClient
    var users = Variable<[User]>([])
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func moveToSecondVC(user: User) {
        self.step.accept(MainStep.moveToSecondScreenButtonClicked(user: user))
    }
    
    func getUsers() {
        users.value = apiClient.getUsers()
    }
    
}
