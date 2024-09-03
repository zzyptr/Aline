import UIKit

extension NSLayoutYAxisAnchor {

    /// NSLayoutYAxisAnchor - NSLayoutYAxisAnchor
    @inline(__always)
    public static func - (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutDimension {
        return lhs.anchorWithOffset(to: rhs)
    }
}

extension NSLayoutYAxisAnchor {

    /// NSLayoutXAxisAnchor == NSLayoutXAxisAnchor
    @inline(__always)
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs)
    }

    /// NSLayoutXAxisAnchor <= NSLayoutXAxisAnchor
    @inline(__always)
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs)
    }

    /// NSLayoutXAxisAnchor >= NSLayoutXAxisAnchor
    @inline(__always)
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs)
    }
}

extension NSLayoutYAxisAnchor {

    /// NSLayoutXAxisAnchor == NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func == (lhs: NSLayoutYAxisAnchor, rhs: Addition<NSLayoutYAxisAnchor, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.lhs, constant: rhs.rhs)
    }

    /// NSLayoutXAxisAnchor <= NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func <= (lhs: NSLayoutYAxisAnchor, rhs: Addition<NSLayoutYAxisAnchor, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.lhs, constant: rhs.rhs)
    }

    /// NSLayoutXAxisAnchor >= NSLayoutXAxisAnchor + c
    @inline(__always)
    public static func >= (lhs: NSLayoutYAxisAnchor, rhs: Addition<NSLayoutYAxisAnchor, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.lhs, constant: rhs.rhs)
    }
}

extension NSLayoutYAxisAnchor {

    /// NSLayoutYAxisAnchor + c
    @inline(__always)
    public static func + (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> Addition<NSLayoutYAxisAnchor, CGFloat> {
        return Addition(lhs, rhs)
    }

    /// NSLayoutYAxisAnchor - c
    @inline(__always)
    public static func - (lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> Addition<NSLayoutYAxisAnchor, CGFloat> {
        return Addition(lhs, -rhs)
    }
}
