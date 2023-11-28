import Foundation

class UserDefaultsManager {
    
    // MARK: - Static Properties
    
    static let shared = UserDefaultsManager()
    
    // MARK: - Stored Key-Value pairs
    
    @Storage(
        wrappedValue: true,
        GlobalStrings.UserDefaultKey.isOnboarding.rawValue
    ) var isOnboarding: Bool
    
    @Storage(
        wrappedValue: false,
        GlobalStrings.UserDefaultKey.isLoggedIn.rawValue
    ) var isLoggedIn: Bool
    
    @Storage(wrappedValue: false, GlobalStrings.UserDefaultKey.isDarkMode.rawValue)
    var isDarkMode: Bool {
        didSet {
            let theme: Theme = isDarkMode ? .dark : .light
            ThemeManager.shared.currentTheme = theme
        }
    }
    
    @Storage(
        wrappedValue: Data(),
        GlobalStrings.UserDefaultKey.profileImageData.rawValue
    ) var profileImageData: Data
    
    @Storage(
        wrappedValue: "",
        GlobalStrings.UserDefaultKey.profileName.rawValue
    ) var name: String
    
    @Storage(
        wrappedValue: "",
        GlobalStrings.UserDefaultKey.email.rawValue
    ) var email: String
    
    @Storage(
        wrappedValue: "",
        GlobalStrings.UserDefaultKey.bio.rawValue
    ) var bio: String
    
    // MARK: - Instance Methods
    
    private init() { }
}
