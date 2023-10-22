//
//  Route.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Route: String {

    case splash
    case onboarding
    case home
    case login
    case signup
    case createUsername
    
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
                let viewModel = HomeViewModel()
                let controller = HomeViewController.instantiate(from: .Main, viewModel: viewModel)
                return controller
            case .login:
                let viewModel = LoginViewModel()
                let controller = LoginViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .signup:
                let viewModel = SignUpViewModel()
                let controller = SignUpViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            case .createUsername:
                let viewModel = SignUpViewModel()
                let controller = CreateUserNameViewController.instantiate(from: .Authentication, viewModel: viewModel)
                return controller
            
        }
    }
}
