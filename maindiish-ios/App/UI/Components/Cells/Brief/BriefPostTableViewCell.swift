//
//  BriefPostTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//

import UIKit

@objc
protocol OptionsButtonDelegate {
    @objc
    optional func didTapOptionsButton(forRowAt indexPath: IndexPath)
}

class BriefPostTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var optionsButton: CellButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postedByUserLabel: UILabel!
    @IBOutlet weak var numberOfHeartsButton: UIButton!
    @IBOutlet weak var numberOfCommentsButton: UIButton!
    @IBOutlet weak var numberOfViewsButton: UIButton!
    
    // MARK: - Delegate Properties
    
    var optionsButtonDelegate: OptionsButtonDelegate?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func optionsButtonTapped(_ sender: CellButton) {
        optionsButtonDelegate?.didTapOptionsButton?(forRowAt: sender.indexPath)
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        titleLabel.font = Fonts.robotoMedium.font(15)
       
        postedByUserLabel.font = Fonts.interMedium.font(10)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsButton.titleLabel?.font = font
        numberOfCommentsButton.titleLabel?.font = font
        numberOfViewsButton.titleLabel?.font = font
    }
    
    // MARK: - Public Methods
    
    func setData(_ data: BriefData) {
        
        switch data.mediaType {
            case .video(let url):
                if let url = url {
                    ProgressLoaderManager.shared.show(for: postImageView)
                    Utils.fetchThumbnail(from: url) { image in
                        ProgressLoaderManager.shared.show(for: self.postImageView)
                        self.postImageView.image = image
                    }
                }
            default :
                break
        }
       
        titleLabel.text = data.title
        postedByUserLabel.text = "by " + data.user.name
        
        numberOfHeartsButton.setTitle("\(data.formattedHeartsCount)", for: .normal)
        numberOfViewsButton.setTitle("\(data.formattedViewsCount)", for: .normal)
        numberOfCommentsButton.setTitle("\(data.formattedCommentsCount)", for: .normal)
    }
    
}
