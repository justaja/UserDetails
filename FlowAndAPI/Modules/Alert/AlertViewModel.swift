
import Foundation
import RxSwift
import RxFlow

struct AlertViewModel {
    
    var apiClient: ApiClient = ApiClient()
    var comments = Variable<[Comment]>([])
    var postId: Int
    
    init(postId: Int) {
        self.postId = postId
    }
    
    func getComments() {
        comments.value = apiClient.getCommentsForPost(postId: postId)
    }
}
