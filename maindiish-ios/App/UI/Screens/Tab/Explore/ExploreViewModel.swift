import Foundation

class ExploreViewModel: ViewModel {
    
    private var repository = TrendingPostRepository()
    
    var data: [TrendingPostData] {
        repository.postData
    }
    
}
