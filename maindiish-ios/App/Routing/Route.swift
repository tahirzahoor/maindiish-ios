import UIKit

enum Route {

    case splash
    case onboarding
    case home
    case login
    case signup
    case createUsername(viewModel: SignUpViewModel? = nil)
    case forgotPassword
    case typeCode
    case setNewPassword
    case mainTab
    case explore
    case trending
    case postDetail(data: PostData)
    case createBlog
    case reviewPost(_ data: PostData)
    case imagesView(_ imageData: [Data], tappedIndex: Int)
    case captureVideo(_ configuration: MediaCaptureConfiguration? = nil, confirmationDelegate: ConfirmMediaDelegate)
    case confirmMediaCaptured(_ mediaType: MediaCaptureConfiguration.MediaType, _ completion: ((Bool) -> Void)?)
    case createBrief(_ mediaType: MediaCaptureConfiguration.MediaType)
    case reviewBrief(_ data: BriefData)
    case search
    case profile(id: String)
    case settings
    case editProfile
    case changePassword
    case savedItems
    case webView(url: URL?)
    case blockedAccounts
    case briefs
    case textBased(_ type: HTMLFile)
    case inbox
    case chat(_ user: User)
    
    func controller() -> UIViewController {
        switch self {
            case .splash:
                let viewModel = SplashViewModel()
                let splashViewController = SplashViewController.instantiate(from: .Main, viewModel: viewModel)
                return splashViewController
            case .onboarding:
                let viewModel = OnboardingViewModel()
                let onboardingViewController = OnboardingViewController.instantiate(from: .Main, viewModel: viewModel)
                return onboardingViewController
            case .home:
                let viewModel = WelcomeViewModel()
                let controller = WelcomeViewController.instantiate(from: .Main, viewModel: viewModel)
                return controller
            case .login:
                let viewModel = LoginViewModel()
                let controller = LoginViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .signup:
                let viewModel = SignUpViewModel()
                let controller = SignUpViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .createUsername(let SignUpVM):
                let viewModel = SignUpVM ?? SignUpViewModel()
                let controller = CreateUserNameViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .forgotPassword:
                let viewModel = ForgotPasswordViewModel()
                let controller = ForgotPasswordViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .typeCode:
                let viewModel = TypeCodeViewModel()
                let controller = TypeCodeViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .setNewPassword:
                let viewModel = SetNewPasswordViewModel()
                let controller = SetNewPasswordViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .mainTab:
                let viewModel = MainTabViewModel()
                let controller = MainTabViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .explore:
                let viewModel = ExploreViewModel()
                let controller = ExploreViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .trending:
                let viewModel = TrendingPostsViewModel()
                let controller = TrendingPostsViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .postDetail(let data):
                let viewModel = PostDetailViewModel(data: data)
                let controller = PostDetailViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .createBlog:
                let viewModel = CreateBlogViewModel()
                let controller = CreateBlogViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .reviewPost(let data):
                let viewModel = ReviewPostViewModel(data)
                let controller = ReviewPostViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .imagesView(let imagesData, let selectedIndex):
                let viewModel = ImagesViewModel(imagesData, selectedItemIndex: selectedIndex)
                let controller = ImagesViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .captureVideo(let configuration, let delegate):
            let viewModel = VideoCaptureViewModel(delegate: delegate)
                let controller = VideoCaptureViewController.instantiate(from: .PopUp, viewModel: viewModel)
                if let configuration = configuration {
                    controller.config = configuration
                }
                return controller
            case .confirmMediaCaptured(let mediaType, let completion):
                let viewModel = ConfirmMediaCapturedViewModel(mediaType: mediaType)
                viewModel.completion = completion
                let controller = ConfirmMediaCapturedViewController.instantiate(from: .PopUp, viewModel: viewModel)
                return controller
            case .createBrief(let mediaType):
                let viewModel = CreateBriefViewModel(mediaType: mediaType)
                let controller = CreateBriefViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .reviewBrief(let brief):
                let viewModel = ReviewBriefViewModel(brief: brief)
                let controller = ReviewBriefViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .search:
                let viewModel = SearchViewModel()
                let controller = SearchViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .profile(let id):
                let viewModel = ProfileViewModel(id: id)
                let controller = ProfileViewController.instantiate(from: .Profile, viewModel: viewModel)
                return controller
            case .settings:
                let viewModel = SettingsViewModel()
                let controller = SettingsViewController.instantiate(from: .Profile, viewModel: viewModel)
            
                return controller
            
            case .editProfile:
                let viewModel = EditProfileViewModel()
                let controller = EditProfileViewController.instantiate(from: .Profile, viewModel: viewModel)
                return controller
            
            case .changePassword:
                let viewModel = ChangePasswordViewModel()
                let controller = ChangePasswordViewController.instantiate(from: .Profile, viewModel: viewModel)
                
                return controller
            
            case .savedItems:
                let viewModel = SavedItemsViewModel()
                let controller = SavedItemsViewController.instantiate(from: .Profile, viewModel: viewModel)
                
                return controller
            
            case .blockedAccounts:
                let viewModel = BlockedAccountsViewModel()
                let controller = BlockedAccountsViewController.instantiate(from: .Profile, viewModel: viewModel)
                
                return controller
            
            case .briefs:
                let viewModel = BriefsViewModel()
                let controller = BriefsViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                
                return controller
            
            case .textBased(let type):
                let viewModel = TextViewModel(textType: type)
                let controller = TextViewController.instantiate(from: .Profile, viewModel: viewModel)
            
                return controller
            
            case .inbox:
                let viewModel = ChatListingViewModel()
                let controller = ChatListingViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                
                return controller
            
            case .chat(let user):
            let viewModel = ChatViewModel(user: user)
                let controller = ChatViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                
                return controller
            
            default:
                return UIViewController()
        }
    }
}
