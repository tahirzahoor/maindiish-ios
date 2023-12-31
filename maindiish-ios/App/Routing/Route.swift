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
            case .reviewPost(let postData):
                let viewModel = ReviewPostViewModel(postData)
                let controller = ReviewPostViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
            case .imagesView(let imagesData, let selectedIndex):
                let viewModel = ImagesViewModel(imagesData, selectedItemIndex: selectedIndex)
                let controller = ImagesViewController.instantiate(from: .TabControllers, viewModel: viewModel)
                return controller
        }
    }
}
