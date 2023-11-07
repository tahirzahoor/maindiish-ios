import Foundation

class AlertViewModel: ViewModel {
    
    var title: String
    var message: String
    
    init(title: String = "", message: String = "") {
        self.title = title
        self.message = message
    }
}
