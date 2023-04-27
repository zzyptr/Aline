import UIKit

extension NSLayoutConstraint {

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
        constraints.forEach { $0.priority = priority }
        return constraints
    }
}
