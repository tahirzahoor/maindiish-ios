import UIKit

class PostTypeBottomSheetView: UIView {

   // MARK: - Outlets
    
    @IBOutlet weak var optionsBackgroundView: UIView!
    @IBOutlet weak var draggerView: UIView!
    @IBOutlet weak var videoOptionButton: RoundedButton!
    @IBOutlet weak var blogOptionButton: RoundedButton!
    
    private var gLayer: CAGradientLayer?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
        addGradient()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        let font = Fonts.robotoMedium.font(14)
        
        videoOptionButton.titleLabel?.font = font
        blogOptionButton.titleLabel?.font = font
    }
    
    private func addGradient() {
        let colors: [UIColor] = [
            .defaultBg.withAlphaComponent(1),
            .defaultBg.withAlphaComponent(0)
        ]
        gLayer = optionsBackgroundView.addGradient(.vertical, withColor: colors)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        gLayer?.removeFromSuperlayer()
        gLayer = nil
        addGradient()
    }
}

