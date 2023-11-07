import Foundation

struct OnboardingRepository {
    
    // MARK: - Instance Properties
    
    private let imageNames = [
        AssetsImage.onboardFirstPage.rawValue,
        AssetsImage.onboardSecondPage.rawValue,
        AssetsImage.onboardThirdPage.rawValue
    ]
    
    private let titles = [
        GlobalStrings.Title.onboarding1,
        GlobalStrings.Title.onboarding2,
        GlobalStrings.Title.onboarding3
    ]
    
    private let descriptions = [
        GlobalStrings.Message.onboarding1Description,
        GlobalStrings.Message.onboarding2Description,
        GlobalStrings.Message.onboarding3Description
    ]
    
    // MARK: - Public Methods
    
    func onboardingList() -> [OnboardingDetail] {
        var details = [OnboardingDetail]()
        
        for index in titles.indices {
            let imageName = imageNames[index]
            let title = titles[index]
            let description = descriptions[index]
            
            let onboarding = OnboardingDetail(
                imageName: imageName,
                title: title,
                description: description
            )
            
            details.append(onboarding)
        }
        
        return details
    }
}
