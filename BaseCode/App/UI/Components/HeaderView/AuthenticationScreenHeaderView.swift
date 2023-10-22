//
//  AuthenticationScreenHeaderView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 21/10/2023.
//

import UIKit

protocol AuthenticationScreenHeaderViewDelegate: AnyObject {
    func didTapBackButton()
}

@IBDesignable
class AuthenticationScreenHeaderViewWrapper : NibWrapperView<AuthenticationScreenHeaderView> { }

class AuthenticationScreenHeaderView: UIView {
    
    var delegate: AuthenticationScreenHeaderViewDelegate?
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        delegate?.didTapBackButton()
    }
    
}
