import UIKit

extension PointAnchor {

    /// PointAnchor == PointAnchor
    @inline(__always)
    public static func == (lhs: PointAnchor, rhs: PointAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.x.constraint(equalTo: rhs.x),
            lhs.y.constraint(equalTo: rhs.y)
        ]
    }

    /// PointAnchor <= PointAnchor
    @inline(__always)
    public static func <= (lhs: PointAnchor, rhs: PointAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.x.constraint(lessThanOrEqualTo: rhs.x),
            lhs.y.constraint(lessThanOrEqualTo: rhs.y)
        ]
    }

    /// PointAnchor >= PointAnchor
    @inline(__always)
    public static func >= (lhs: PointAnchor, rhs: PointAnchor) -> [NSLayoutConstraint] {
        return [
            lhs.x.constraint(greaterThanOrEqualTo: rhs.x),
            lhs.y.constraint(greaterThanOrEqualTo: rhs.y)
        ]
    }
}

extension PointAnchor {

    /// PointAnchor == PointAnchor + c
    @inline(__always)
    public static func == (lhs: PointAnchor, rhs: Addition<PointAnchor, CGPoint>) -> [NSLayoutConstraint] {
        return [
            lhs.x.constraint(equalTo: rhs.lhs.x, constant: rhs.rhs.x),
            lhs.y.constraint(equalTo: rhs.lhs.y, constant: rhs.rhs.y)
        ]
    }

    /// PointAnchor <= PointAnchor + c
    @inline(__always)
    public static func <= (lhs: PointAnchor, rhs: Addition<PointAnchor, CGPoint>) -> [NSLayoutConstraint] {
        return [
            lhs.x.constraint(lessThanOrEqualTo: rhs.lhs.x, constant: rhs.rhs.x),
            lhs.y.constraint(lessThanOrEqualTo: rhs.lhs.y, constant: rhs.rhs.y)
        ]

    }

    /// PointAnchor >= PointAnchor + c
    @inline(__always)
    public static func >= (lhs: PointAnchor, rhs: Addition<PointAnchor, CGPoint>) -> [NSLayoutConstraint] {
        return [
            lhs.x.constraint(greaterThanOrEqualTo: rhs.lhs.x, constant: rhs.rhs.x),
            lhs.y.constraint(greaterThanOrEqualTo: rhs.lhs.y, constant: rhs.rhs.y)
        ]
    }
}

extension PointAnchor {

    /// PointAnchor + c
    @inline(__always)
    public static func + (lhs: PointAnchor, rhs: CGPoint) -> Addition<PointAnchor, CGPoint> {
        return Addition(lhs, rhs)
    }

    /// PointAnchor - c
    @inline(__always)
    public static func - (lhs: PointAnchor, rhs: CGPoint) -> Addition<PointAnchor, CGPoint> {
        let addend = CGPoint(x: -rhs.x, y: -rhs.y)
        return Addition(lhs, addend)
    }
}

public struct PointAnchor {

    let x: NSLayoutXAxisAnchor
    let y: NSLayoutYAxisAnchor

    @inline(__always)
    init(x: NSLayoutXAxisAnchor, y: NSLayoutYAxisAnchor) {
        self.x = x
        self.y = y
    }
}
