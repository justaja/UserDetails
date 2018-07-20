
import Foundation
import RxSwift
import RxFlow

struct SecondViewModel {
    
    var apiClient: ApiClient = ApiClient()
    var user: User
    var posts = Variable<[Post]>([])
    var comments = Variable<[Comment]>([])

    init(user: User) {
        self.user = user
    }
    
    func getPosts(userId: Int) {
        posts.value = apiClient.getPostsForUser(userId: userId)
    }
    
    func getComments(postId: Int) {
        comments.value = apiClient.getCommentsForPost(postId: postId)
    }
}
