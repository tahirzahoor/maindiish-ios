//
//  BaseAuthenticationViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 21/10/2023.
//

import Foundation
import UIKit

final class BaseAuthenticationViewController: UIViewController {

    // MARK: - Outlets
    
    @NibWrapped(AuthenticationScreenHeaderView.self)
    @IBOutlet var gsj: UIView!
    
    @IBOutlet weak var baseAuthenticationView: BaseAuthenticationView!
    
    // MARK: - Instance Properties
    
    private var route = Route.login
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        //viewModel.router.pop(animated: true)
    }
    
    // MARK: - Lifecycle Methods
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addController(UIViewController())
    }
    
}

// MARK: - Helper Methods
extension BaseAuthenticationViewController {
   
    private func addController(_ controller: UIViewController) {
        addChild(controller)
        baseAuthenticationView.childControllerView.addSubview(controller.view)
        controller.view.frame = baseAuthenticationView.childControllerView.bounds
        controller.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        controller.didMove(toParent: self)
    }
    
    private func removeController(_ controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }
   
}
