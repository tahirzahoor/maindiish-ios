//
//  AuthenticationHeaderView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 21/10/2023.
//

import UIKit

protocol AuthenticationHeaderViewDelegate: AnyObject {
    func backButtonTapped()
}

class AuthenticationHeaderView: UIView {
    
    // MARK: - File Constants
    
    private let xibName = "AuthenticationHeaderView"
    
    // MARK: - Delegates
    
    var delegate: AuthenticationHeaderViewDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var screenTitleLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        delegate?.backButtonTapped()
    }
    
    // MARK: - Lifecycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        guard let headerView = loadFromNib() as? Self else {
            return
        }
        self.fixInView(headerView)
    }
}
