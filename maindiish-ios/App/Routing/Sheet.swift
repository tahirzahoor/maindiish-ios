import UIKit

enum Sheet {

    case confirmation(config: ConfirmationConfig)
    case bottomUp(_ options: [String], selectedOptionIndex: Int, delegate: BottomUpOptionsDelegate)
    case postType
    case threeDotOption(options: [Option], delegate: OptionDelegate)
    case comments

    func controller() -> UIViewController {
        switch self {
            case .confirmation(let config):
                let viewModel = ConfirmationViewModel(config: config)
                let controller = ConfirmationViewController.instantiate(from: .PopUp, viewModel: viewModel)
                return controller
            case .bottomUp(let options, let selectedOptionIndex, let delegate):
                let viewModel = BottomUpOptionsSheetViewModel(optionsList: options, selectedOptionIndex: selectedOptionIndex)
                let controller = BottomUpOptionsSheetViewController.instantiate(from: .PopUp, viewModel: viewModel)
                controller.delegate = delegate
                return controller
            case .postType:
                let viewModel = PostTypeBottomSheetViewModel()
                let controller = PostTypeBottomSheetViewController.instantiate(from: .PopUp, viewModel: viewModel)
                return controller
            case .threeDotOption(let options, let delegate):
                let viewModel = OptionsViewModel(optionList: options)
                let controller = OptionsViewController.instantiate(from: .PopUp, viewModel: viewModel)
                controller.delegate = delegate
                return controller
            case .comments:
                let viewModel = CommentsViewModel()
                let controller = CommentsViewController.instantiate(from: .PopUp, viewModel: viewModel)
                
                return controller
        }
    }
}
