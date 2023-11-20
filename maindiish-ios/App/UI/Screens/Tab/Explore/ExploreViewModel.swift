import Foundation

class ExploreViewModel: ViewModel {
    
    var isForProfile: Bool = false
    
    var data: [PostData] {
        PostRepository.shared.postData
    }
    
}
