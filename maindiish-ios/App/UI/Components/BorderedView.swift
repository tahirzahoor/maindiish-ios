import UIKit

@IBDesignable
class BorderedView: UIView {
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /// reset color for UIInterfaceStyle
        setBorderColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        setBorderColor()
    }
    
    func setBorderColor() {
        layer.borderColor = borderColor.cgColor
    }
    
}
