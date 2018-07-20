
import Foundation


class ApiClient {
    
    let usersUrlString = "https://jsonplaceholder.typicode.com/users"
    let postsPerUserUrlString = "https://jsonplaceholder.typicode.com/posts?userId="
    let commentsPerPostUrlString = "https://jsonplaceholder.typicode.com/comments?postId="
    
    func getUsers() -> [User] {
        let url = URL(string: usersUrlString)!
        let jsonData = try! Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        guard let users = try? jsonDecoder.decode(Array<User>.self, from: jsonData) else { return [] }
        return users
    }
    
    func getPostsForUser(userId: Int) -> [Post] {
        let url = URL(string: postsPerUserUrlString + "\(userId)")!
        let jsonData = try! Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        guard let posts = try? jsonDecoder.decode(Array<Post>.self, from: jsonData) else { return [] }
        return posts
    }
    
    func getCommentsForPost(postId: Int) -> [Comment] {
        let url = URL(string: commentsPerPostUrlString + "\(postId)")!
        let jsonData = try! Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        guard let comments = try? jsonDecoder.decode(Array<Comment>.self, from: jsonData) else { return [] }
        return comments
    }
}
