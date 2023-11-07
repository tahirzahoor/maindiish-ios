import Foundation

class OnboardingViewModel: ViewModel {
    
    // MARK: - Instance Properties
    
    private let repository = OnboardingRepository()
    
    var onboardings: [OnboardingDetail]
    
    override init() {
        onboardings = repository.onboardingList()
        super.init()
    }
    
}
