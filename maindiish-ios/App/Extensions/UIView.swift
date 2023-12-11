import UIKit

@IBDesignable
extension UIView {
   
    enum GradientDirection {
        case vertical
        case horizontal
        case diagonal

        var start: CGPoint {
            return CGPoint(x: 0, y: 0)
        }

        var end: CGPoint {
            return switch self {
                case .vertical: CGPoint(x: 0, y: 1)
                case .horizontal: CGPoint(x: 1, y: 0)
                case .diagonal: CGPoint(x: 1, y: 1)
            }
        }
    }
   
    @discardableResult
    func addGradient(_ direction: GradientDirection, withColor colors: [UIColor], cornerRadius: CGFloat = 0, shouldPushInBackground: Bool = true) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = direction.start
        gradientLayer.endPoint = direction.end
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        if shouldPushInBackground {
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            layer.addSublayer(gradientLayer)
        }

        return gradientLayer
    }

    @discardableResult
    func loadFromNib<T: UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }
    
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }

    func fixInView(_ container: UIView, with padding: CGFloat = 0) {
        frame = container.bounds
        container.addSubview(self)
        addEqualConstraintsWith(container, with: padding)
    }

    func addEqualConstraintsWith(_ view: UIView, with constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
        ])
    }

    func takeScreenshot() -> UIImage? {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
    
    func roundCorner(_ corners: CACornerMask? = nil, radius: CGFloat) {
        layer.cornerRadius = radius
        if let corners = corners {
            layer.maskedCorners = corners
        }
    }
        
}

