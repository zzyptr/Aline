import UIKit

public enum Aline {

    @inlinable
    @discardableResult
    public static func activate(
        @ArrayBuilder _ constraints: () -> [NSLayoutConstraint]
    ) -> [NSLayoutConstraint] {
        let constraints = constraints()
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    @inlinable
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
