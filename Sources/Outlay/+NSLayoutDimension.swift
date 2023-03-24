import UIKit

extension NSLayoutDimension {

    /// NSLayoutDimension == c
    @inlinable
    public static func == (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(equalToConstant: rhs)
    }

    /// NSLayoutDimension <= c
    @inlinable
    public static func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualToConstant: rhs)
    }

    /// NSLayoutDimension >= c
    @inlinable
    public static func >= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualToConstant: rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension == NSLayoutDimension
    @inlinable
    public static func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs)
    }

    /// NSLayoutDimension <= NSLayoutDimension
    @inlinable
    public static func <= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs)
    }

    /// NSLayoutDimension >= NSLayoutDimension
    @inlinable
    public static func >= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension == NSLayoutDimension * m + c
    @inlinable
    public static func == (lhs: NSLayoutDimension, rhs: Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.lhs.lhs, multiplier: rhs.lhs.rhs, constant: rhs.rhs)
    }

    /// NSLayoutDimension <= NSLayoutDimension * m + c
    @inlinable
    public static func <= (lhs: NSLayoutDimension, rhs: Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.lhs.lhs, multiplier: rhs.lhs.rhs, constant: rhs.rhs)
    }

    /// NSLayoutDimension >= NSLayoutDimension * m + c
    @inlinable
    public static func >= (lhs: NSLayoutDimension, rhs: Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.lhs.lhs, multiplier: rhs.lhs.rhs, constant: rhs.rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension * m + 0
    @inlinable
    public static func * (lhs: NSLayoutDimension, rhs: CGFloat) -> Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat> {
        return Addition(Multiplication(lhs, rhs), 0)
    }

    /// NSLayoutDimension * 1 + c
    @inlinable
    public static func + (lhs: NSLayoutDimension, rhs: CGFloat) -> Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat> {
        return Addition(Multiplication(lhs, 1), rhs)
    }

    /// NSLayoutDimension * 1 - c
    @inlinable
    public static func - (lhs: NSLayoutDimension, rhs: CGFloat) -> Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat> {
        return Addition(Multiplication(lhs, 1), -rhs)
    }
}

extension Addition where LHS == Multiplication<NSLayoutDimension, CGFloat>, RHS == CGFloat {

    @inlinable
    public static func + (lhs: Addition, rhs: CGFloat) -> Addition {
        return Addition(lhs.lhs, lhs.rhs + rhs)
    }

    @inlinable
    public static func - (lhs: Addition, rhs: CGFloat) -> Addition {
        return Addition(lhs.lhs, lhs.rhs - rhs)
    }
}
