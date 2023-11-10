import Foundation

class TrendingPostsViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private let repository = PostRepository.shared
    
    // MARK: - Instance Properties
    
    var filters: [String] {
        repository.filterLabels
    }
    
    var posts: [PostData] {
        repository.postData
    }
    
}
