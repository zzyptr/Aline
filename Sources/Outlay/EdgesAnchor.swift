import UIKit

extension EdgesAnchor {

    /// EdgesAnchor == EdgesAnchor
    @inlinable
    public static func == (lhs: EdgesAnchor, rhs: EdgesAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.top.constraint(equalTo: rhs.top),
            lhs.leading.constraint(equalTo: rhs.leading),
            lhs.bottom.constraint(equalTo: rhs.bottom),
            lhs.trailing.constraint(equalTo: rhs.trailing)
        ]
    }

    /// EdgesAnchor <= EdgesAnchor
    @inlinable
    public static func <= (lhs: EdgesAnchor, rhs: EdgesAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.top.constraint(lessThanOrEqualTo: rhs.top),
            lhs.leading.constraint(lessThanOrEqualTo: rhs.leading),
            lhs.bottom.constraint(lessThanOrEqualTo: rhs.bottom),
            lhs.trailing.constraint(lessThanOrEqualTo: rhs.trailing)
        ]
    }

    /// EdgesAnchor >= EdgesAnchor
    @inlinable
    public static func >= (lhs: EdgesAnchor, rhs: EdgesAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.top.constraint(greaterThanOrEqualTo: rhs.top),
            lhs.leading.constraint(greaterThanOrEqualTo: rhs.leading),
            lhs.bottom.constraint(greaterThanOrEqualTo: rhs.bottom),
            lhs.trailing.constraint(greaterThanOrEqualTo: rhs.trailing)
        ]
    }
}

extension EdgesAnchor {

    /// EdgesAnchor == EdgesAnchor + c
    @inlinable
    public static func == (lhs: EdgesAnchor, rhs: Addition<EdgesAnchor, NSDirectionalEdgeInsets>) -> [NSLayoutConstraint] {
        return [
            lhs.top.constraint(equalTo: rhs.lhs.top, constant: rhs.rhs.top),
            lhs.leading.constraint(equalTo: rhs.lhs.leading, constant: rhs.rhs.leading),
            lhs.bottom.constraint(equalTo: rhs.lhs.bottom, constant: rhs.rhs.bottom),
            lhs.trailing.constraint(equalTo: rhs.lhs.trailing, constant: rhs.rhs.trailing)
        ]
    }

    /// EdgesAnchor <= EdgesAnchor + c
    @inlinable
    public static func <= (lhs: EdgesAnchor, rhs: Addition<EdgesAnchor, NSDirectionalEdgeInsets>) -> [NSLayoutConstraint] {
        return [
            lhs.top.constraint(lessThanOrEqualTo: rhs.lhs.top, constant: rhs.rhs.top),
            lhs.leading.constraint(lessThanOrEqualTo: rhs.lhs.leading, constant: rhs.rhs.leading),
            lhs.bottom.constraint(lessThanOrEqualTo: rhs.lhs.bottom, constant: rhs.rhs.bottom),
            lhs.trailing.constraint(lessThanOrEqualTo: rhs.lhs.trailing, constant: rhs.rhs.trailing)
        ]
    }

    /// EdgesAnchor >= EdgesAnchor + c
    @inlinable
    public static func >= (lhs: EdgesAnchor, rhs: Addition<EdgesAnchor, NSDirectionalEdgeInsets>) -> [NSLayoutConstraint] {
        return [
            lhs.top.constraint(greaterThanOrEqualTo: rhs.lhs.top, constant: rhs.rhs.top),
            lhs.leading.constraint(greaterThanOrEqualTo: rhs.lhs.leading, constant: rhs.rhs.leading),
            lhs.bottom.constraint(greaterThanOrEqualTo: rhs.lhs.bottom, constant: rhs.rhs.bottom),
            lhs.trailing.constraint(greaterThanOrEqualTo: rhs.lhs.trailing, constant: rhs.rhs.trailing)
        ]
    }
}

extension EdgesAnchor {

    /// EdgesAnchor + c
    @inlinable
    public static func + (lhs: EdgesAnchor, rhs: NSDirectionalEdgeInsets) -> Addition<EdgesAnchor, NSDirectionalEdgeInsets> {
        return Addition(lhs, rhs)
    }

    /// EdgesAnchor - c
    @inlinable
    public static func - (lhs: EdgesAnchor, rhs: NSDirectionalEdgeInsets) -> Addition<EdgesAnchor, NSDirectionalEdgeInsets> {
        let addend = NSDirectionalEdgeInsets(
            top: -rhs.top,
            leading: -rhs.leading,
            bottom: -rhs.bottom,
            trailing: -rhs.trailing
        )
        return Addition(lhs, addend)
    }
}

public struct EdgesAnchor {

    @usableFromInline
    let top: NSLayoutYAxisAnchor

    @usableFromInline
    let leading: NSLayoutXAxisAnchor

    @usableFromInline
    let bottom: NSLayoutYAxisAnchor

    @usableFromInline
    let trailing: NSLayoutXAxisAnchor

    @inlinable
    init(
        top: NSLayoutYAxisAnchor,
        leading: NSLayoutXAxisAnchor,
        bottom: NSLayoutYAxisAnchor,
        trailing: NSLayoutXAxisAnchor
    ) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
}
