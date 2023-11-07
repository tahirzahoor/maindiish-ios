import Foundation

class TrendingPostsViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private let repository = TrendingPostRepository()
    
    // MARK: - Instance Properties
    
    var filters: [String] {
        repository.filterLabels
    }
    
    var posts: [TrendingPostData] {
        repository.postData
    }
    
}
