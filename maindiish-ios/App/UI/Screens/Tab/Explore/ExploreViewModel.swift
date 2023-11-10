import Foundation

class ExploreViewModel: ViewModel {
    
    var data: [PostData] {
        PostRepository.shared.postData
    }
    
}
