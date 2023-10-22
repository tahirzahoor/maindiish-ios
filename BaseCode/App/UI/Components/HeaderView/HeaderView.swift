//
//  HeaderView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func backButtonTapped()
}

class HeaderView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var backNavigationButton: UIButton!
    @IBOutlet weak var screenTitleLabel: UILabel!
    
    // MARK: - Action Methods
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        delegate?.backButtonTapped()
    }
    
    // MARK: - Delegates
    
    var delegate: HeaderViewDelegate?
    
    // MARK: - Instance Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func set(title: String = "Screen Title") {
        screenTitleLabel.text = title
    }
    
    private func configureView() {
        screenTitleLabel.textColor = .onboardingTitleLabel
        screenTitleLabel.font = Fonts.robotoRegular.font(15)
        screenTitleLabel.textAlignment = .center
    }
    
}
