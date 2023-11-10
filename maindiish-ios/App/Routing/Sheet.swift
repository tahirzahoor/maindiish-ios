import UIKit

enum Sheet {

    case confirmation
    case bottomUp(_ options: [String], selectedOptionIndex: Int, delegate: BottomUpOptionsDelegate)
    case postType

    func controller() -> UIViewController {
        switch self {
            case .confirmation:
                return UIViewController()
            case .bottomUp(let options, let selectedOptionIndex, let delegate):
                let viewModel = BottomUpOptionsSheetViewModel(optionsList: options, selectedOptionIndex: selectedOptionIndex)
                let controller = BottomUpOptionsSheetViewController.instantiate(from: .PopUp, viewModel: viewModel)
                controller.delegate = delegate
                return controller
            case .postType:
                let viewModel = PostTypeBottomSheetViewModel()
                let controller = PostTypeBottomSheetViewController.instantiate(from: .PopUp, viewModel: viewModel)
                return controller
        }
    }
}
