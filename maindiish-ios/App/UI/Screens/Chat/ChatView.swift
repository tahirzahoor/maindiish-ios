//
//  ChatView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import UIKit

class ChatView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var chatterNameLabel: UILabel!
    @IBOutlet weak var chatControlView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageOuterView: UIView!
    @IBOutlet weak var messageInputField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setViewsBorder()
        setFont()
    }
    
    // MARK: - Private Methods
    
    private func setViewsBorder() {
        chatControlView.roundCorner([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 36)
        sendButton.roundCorner(radius: 20)
        messageOuterView.roundCorner(radius: 20)
    }
    
    private func setFont() {
        messageInputField.font =
        Fonts.interSemibold.font(15)
    }
    
}
