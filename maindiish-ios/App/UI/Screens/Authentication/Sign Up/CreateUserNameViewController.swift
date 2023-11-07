import UIKit

class CreateUserNameViewController: ViewController<ViewModel> {

    // MARK: - Private Properties
    
    private let exisitingUsername = "existing_username"
    
    // MARK: - Outlets
    
    @IBOutlet weak var createUserNameView: CreateUserNameView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Sign Up"
    }
 
    // MARK: - Action Methods
    
    @IBAction
    func signUpButtonTapped(_ sender: RoundedButton) {
        
        let userNameExists = createUserNameView.inputField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == exisitingUsername
       
        createUserNameView.updateView(userNameExists: userNameExists)
        
        if !userNameExists {
            viewModel.router.setRoot(.home)
            viewModel.router.append(.login, animated: false)
        }
    }
    
    @IBAction
    func forgotPasswordButtonTapped(_ sender: UIButton) {
        viewModel.router.append(.forgotPassword, animated: true)
    }
    
}
