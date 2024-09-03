import UIKit

public enum Aline {

    @inline(__always)
    @discardableResult
    public static func activate(
        @ArrayBuilder _ constraints: () -> [NSLayoutConstraint]
    ) -> [NSLayoutConstraint] {
        let constraints = constraints()
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @inline(__always)
    public static func prioritize(
        _ priority: UILayoutPriority,
        @ArrayBuilder _ constraints: () -> [NSLayoutConstraint]
    ) -> [NSLayoutConstraint] {
        let constraints = constraints()
        for constraint in constraints {
            constraint.priority = priority
        }
        return constraints
    }
}
