import UIKit

class PostTextDetailsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet var buttonStack: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    private func setFonts() {
        nameLabel.font = Fonts.robotoMedium.font(15)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(12)
        descriptionLabel.font = Fonts.interRegular.font(14)
        tagsLabel.font = Fonts.interItalic.font(12)
        
        for button in buttonStack {
            button.titleLabel?.font = Fonts.poppinsRegular.font(11.5)
        }
    }
    
    func configure(with data: PostData) {
        displayImageView.image = UIImage(named: "dummy_dp")
        nameLabel.text = data.owner
        descriptionLabel.text = data.description
        tagsLabel.text = data.tags
        
        buttonStack[0].setTitle(" \(data.numberOfHearts)", for: .normal)
        buttonStack[1].setTitle(" \(data.numberOfComments)", for: .normal)
        buttonStack[2].setTitle(" \(data.numberOfViews)", for: .normal)
        buttonStack[3].setTitle(" \(data.numberOfShares)", for: .normal)
    }

}
