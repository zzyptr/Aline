import UIKit

extension NSLayoutDimension {

    /// NSLayoutDimension == c
    @inline(__always)
    public static func == (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(equalToConstant: rhs)
    }

    /// NSLayoutDimension <= c
    @inline(__always)
    public static func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualToConstant: rhs)
    }

    /// NSLayoutDimension >= c
    @inline(__always)
    public static func >= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualToConstant: rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension == NSLayoutDimension
    @inline(__always)
    public static func == (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs)
    }

    /// NSLayoutDimension <= NSLayoutDimension
    @inline(__always)
    public static func <= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs)
    }

    /// NSLayoutDimension >= NSLayoutDimension
    @inline(__always)
    public static func >= (lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension == NSLayoutDimension * m + c
    @inline(__always)
    public static func == (lhs: NSLayoutDimension, rhs: Multiplication<NSLayoutDimension, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.lhs, multiplier: rhs.rhs)
    }

    /// NSLayoutDimension <= NSLayoutDimension * m + c
    @inline(__always)
    public static func <= (lhs: NSLayoutDimension, rhs: Multiplication<NSLayoutDimension, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.lhs, multiplier: rhs.rhs)
    }

    /// NSLayoutDimension >= NSLayoutDimension * m + c
    @inline(__always)
    public static func >= (lhs: NSLayoutDimension, rhs: Multiplication<NSLayoutDimension, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.lhs, multiplier: rhs.rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension == NSLayoutDimension * m + c
    @inline(__always)
    public static func == (lhs: NSLayoutDimension, rhs: Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.lhs.lhs, multiplier: rhs.lhs.rhs, constant: rhs.rhs)
    }

    /// NSLayoutDimension <= NSLayoutDimension * m + c
    @inline(__always)
    public static func <= (lhs: NSLayoutDimension, rhs: Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.lhs.lhs, multiplier: rhs.lhs.rhs, constant: rhs.rhs)
    }

    /// NSLayoutDimension >= NSLayoutDimension * m + c
    @inline(__always)
    public static func >= (lhs: NSLayoutDimension, rhs: Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat>) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.lhs.lhs, multiplier: rhs.lhs.rhs, constant: rhs.rhs)
    }
}

extension NSLayoutDimension {

    /// NSLayoutDimension * m + 0
    @inline(__always)
    public static func * (lhs: NSLayoutDimension, rhs: CGFloat) -> Multiplication<NSLayoutDimension, CGFloat> {
        return Multiplication(lhs, rhs)
    }

    /// NSLayoutDimension * 1 + c
    @inline(__always)
    public static func + (lhs: NSLayoutDimension, rhs: CGFloat) -> Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat> {
        return Addition(Multiplication(lhs, 1), rhs)
    }

    /// NSLayoutDimension * 1 - c
    @inline(__always)
    public static func - (lhs: NSLayoutDimension, rhs: CGFloat) -> Addition<Multiplication<NSLayoutDimension, CGFloat>, CGFloat> {
        return Addition(Multiplication(lhs, 1), -rhs)
    }
}

extension Multiplication where LHS == NSLayoutDimension, RHS == CGFloat {

    @inline(__always)
    public static func + (lhs: Multiplication, rhs: CGFloat) -> Addition<Multiplication, CGFloat> {
        return Addition(lhs, rhs)
    }

    @inline(__always)
    public static func - (lhs: Multiplication, rhs: CGFloat) -> Addition<Multiplication, CGFloat> {
        return Addition(lhs, -rhs)
    }
}
