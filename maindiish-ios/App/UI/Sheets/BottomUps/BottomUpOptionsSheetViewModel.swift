import Foundation

class BottomUpOptionsSheetViewModel: ViewModel {
    
    var optionsList: [String]
    var selectedOption: String {
        optionsList[selectedOptionIndex]
    }
    var selectedOptionIndex = 0
    
    init(optionsList: [String], selectedOptionIndex: Int) {
        self.optionsList = optionsList
        self.selectedOptionIndex = selectedOptionIndex
    }
    
}
