import UIKit

extension NSLayoutXAxisAnchor {

    /// NSLayoutXAxisAnchor - NSLayoutXAxisAnchor
    @inline(__always)
    public static func - (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutDimension {
        return lhs.anchorWithOffset(to: rhs)
    }
}

extension NSLayoutXAxisAnchor {

    /// NSLayoutXAxisAnchor == NSLayoutXAxisAnchor
    @inline(__always)
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs)
    }

    /// NSLayoutXAxisAnchor <= NSLayoutXAxisAnchor
    @inline(__always)
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs)
    }

    /// NSLayoutXAxisAnchor >= NSLayoutXAxisAnchor
    @inline(__always)
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs)
    }
}

extension NSLayoutXAxisAnchor {

    /// NSLayoutXAxisAnchor == NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func == (lhs: NSLayoutXAxisAnchor, rhs: Addition<NSLayoutXAxisAnchor, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.lhs, constant: rhs.rhs)
    }

    /// NSLayoutXAxisAnchor <= NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func <= (lhs: NSLayoutXAxisAnchor, rhs: Addition<NSLayoutXAxisAnchor, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.lhs, constant: rhs.rhs)
    }

    /// NSLayoutXAxisAnchor >= NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func >= (lhs: NSLayoutXAxisAnchor, rhs: Addition<NSLayoutXAxisAnchor, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.lhs, constant: rhs.rhs)
    }
}

extension NSLayoutXAxisAnchor {

    /// NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func + (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> Addition<NSLayoutXAxisAnchor, CGFloat> {
        return Addition(lhs, rhs)
    }

    /// NSLayoutXAxisAnchor - c
    @inline(__always)
    public static func - (lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> Addition<NSLayoutXAxisAnchor, CGFloat> {
        return Addition(lhs, -rhs)
    }
}
