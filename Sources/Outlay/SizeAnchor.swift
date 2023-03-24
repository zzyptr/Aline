import UIKit

extension SizeAnchor {

    /// SizeAnchor == c
    @inlinable
    public static func == (lhs: SizeAnchor, rhs: CGSize) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(equalToConstant: rhs.width),
            lhs.height.constraint(equalToConstant: rhs.height)
        ]
    }

    /// SizeAnchor <= c
    @inlinable
    public static func <= (lhs: SizeAnchor, rhs: CGSize) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(lessThanOrEqualToConstant: rhs.width),
            lhs.height.constraint(lessThanOrEqualToConstant: rhs.height)
        ]
    }

    /// SizeAnchor >= c
    @inlinable
    public static func >= (lhs: SizeAnchor, rhs: CGSize) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(greaterThanOrEqualToConstant: rhs.width),
            lhs.height.constraint(greaterThanOrEqualToConstant: rhs.height)
        ]
    }
}

extension SizeAnchor {

    /// SizeAnchor == SizeAnchor
    @inlinable
    public static func == (lhs: SizeAnchor, rhs: SizeAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(equalTo: rhs.width),
            lhs.height.constraint(equalTo: rhs.height)
        ]
    }

    /// SizeAnchor <= SizeAnchor
    @inlinable
    public static func <= (lhs: SizeAnchor, rhs: SizeAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(lessThanOrEqualTo: rhs.width),
            lhs.height.constraint(lessThanOrEqualTo: rhs.height)
        ]
    }

    /// SizeAnchor >= SizeAnchor
    @inlinable
    public static func >= (lhs: SizeAnchor, rhs: SizeAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(greaterThanOrEqualTo: rhs.width),
            lhs.height.constraint(greaterThanOrEqualTo: rhs.height)
        ]
    }
}

extension SizeAnchor {

    /// SizeAnchor == SizeAnchor * m + c
    @inlinable
    public static func == (lhs: SizeAnchor, rhs: Addition<Multiplication<SizeAnchor, CGFloat>, CGSize>) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(equalTo: rhs.lhs.lhs.width, multiplier: rhs.lhs.rhs, constant: rhs.rhs.width),
            lhs.height.constraint(equalTo: rhs.lhs.lhs.height, multiplier: rhs.lhs.rhs, constant: rhs.rhs.height)
        ]
    }

    /// SizeAnchor <= SizeAnchor * m + c
    @inlinable
    public static func <= (lhs: SizeAnchor, rhs: Addition<Multiplication<SizeAnchor, CGFloat>, CGSize>) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(lessThanOrEqualTo: rhs.lhs.lhs.width, multiplier: rhs.lhs.rhs, constant: rhs.rhs.width),
            lhs.height.constraint(lessThanOrEqualTo: rhs.lhs.lhs.height, multiplier: rhs.lhs.rhs, constant: rhs.rhs.height)
        ]
    }

    /// SizeAnchor >= SizeAnchor * m + c
    @inlinable
    public static func >= (lhs: SizeAnchor, rhs: Addition<Multiplication<SizeAnchor, CGFloat>, CGSize>) -> [NSLayoutConstraint] {
        return [
            lhs.width.constraint(greaterThanOrEqualTo: rhs.lhs.lhs.width, multiplier: rhs.lhs.rhs, constant: rhs.rhs.width),
            lhs.height.constraint(greaterThanOrEqualTo: rhs.lhs.lhs.height, multiplier: rhs.lhs.rhs, constant: rhs.rhs.height)
        ]
    }
}

extension SizeAnchor {

    /// SizeAnchor * m + 0
    @inlinable
    public static func * (lhs: SizeAnchor, rhs: CGFloat) -> Addition<Multiplication<SizeAnchor, CGFloat>, CGSize> {
        return Addition(Multiplication(lhs, rhs), .zero)
    }

    /// SizeAnchor * 1 + c
    @inlinable
    public static func + (lhs: SizeAnchor, rhs: CGSize) -> Addition<Multiplication<SizeAnchor, CGFloat>, CGSize> {
        return Addition(Multiplication(lhs, 1), rhs)
    }

    /// SizeAnchor * 1 - c
    @inlinable
    public static func - (lhs: SizeAnchor, rhs: CGSize) -> Addition<Multiplication<SizeAnchor, CGFloat>, CGSize> {
        let addend = CGSize(width: -rhs.width, height: -rhs.height)
        return Addition(Multiplication(lhs, 1), addend)
    }
}

extension Addition where LHS == Multiplication<SizeAnchor, CGFloat>, RHS == CGSize {

    /// SizeAnchor * m + c
    @inlinable
    public static func + (lhs: Addition, rhs: CGSize) -> Addition {
        let addend = CGSize(
            width: lhs.rhs.width + rhs.width,
            height: lhs.rhs.height + rhs.height
        )
        return Addition(lhs.lhs, addend)
    }

    /// SizeAnchor * m - c
    @inlinable
    public static func - (lhs: Addition, rhs: CGSize) -> Addition {
        let addend = CGSize(
            width: lhs.rhs.width - rhs.width,
            height: lhs.rhs.height - rhs.height
        )
        return Addition(lhs.lhs, addend)
    }
}

public struct SizeAnchor {

    @usableFromInline
    let width: NSLayoutDimension

    @usableFromInline
    let height: NSLayoutDimension

    @inlinable
    init(width: NSLayoutDimension, height: NSLayoutDimension) {
        self.width = width
        self.height = height
    }
}
