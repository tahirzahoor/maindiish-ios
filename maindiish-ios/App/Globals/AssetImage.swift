import Foundation
import UIKit

enum AssetsImage: String {
    
    case onboardingNonSelectedIndicator = "onboarding_non_selected_page_indicator"
    case onboardingCurrentPageIndicator = "onboarding_current_page_indicator"
    case onboardingLetsGoButton = "onboarding_lets_go"
    case onboardingNextButton = "onboarding_next"
    case onboardingSkipButton = "onboarding_skip"
    case onboardFirstPage = "onboarding#1"
    case onboardSecondPage = "onboarding#2"
    case onboardThirdPage = "onboarding#3"
    case googleIntegration = "google_integration_icon"
    case eyesOff = "eye-off"
    case unchecked = "unchecked_icon"
    case checked = "checked"
    case eyesOn = "eye-on"
    case flashOn = "flash_on"
    case flashOff = "flash_off"
    case flashAuto = "flash_auto"
    
    var image: UIImage {
        UIImage(named: rawValue) ?? UIImage()
    }
}
