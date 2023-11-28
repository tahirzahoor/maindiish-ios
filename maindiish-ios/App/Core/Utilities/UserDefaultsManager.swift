import Foundation

class UserDefaultsManager {
    
    // MARK: - Static Properties
    
    static let shared = UserDefaultsManager()
    
    // MARK: - Stored Key-Value pairs
    
    @Storage(
        wrappedValue: true,
        GlobalStrings.UserDefaultKey.getStarted
    ) var isOnboarding: Bool
    
    @Storage(
        wrappedValue: false,
        GlobalStrings.UserDefaultKey.isLoggedIn
    ) var isLoggedIn: Bool
    
    @Storage(
        wrappedValue: false,
        GlobalStrings.UserDefaultKey.isDarkMode
    ) var isDarkMode: Bool {
        didSet {
            let theme: Theme = isDarkMode ? .dark : .light
            ThemeManager.shared.currentTheme = theme
        }
    }
    
    // MARK: - Instance Methods
    
    private init() { }
}
