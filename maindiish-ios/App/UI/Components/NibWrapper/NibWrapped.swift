import UIKit

@propertyWrapper
public struct NibWrapped<T: UIView> {
    
    public var wrappedValue: UIView!
    
    public init(_ type: T.Type) { }
        
    public var unwrapped: T {
        (wrappedValue as! NibWrapperView<T>).contentView
    }
    
}
