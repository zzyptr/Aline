import UIKit

extension Outlay {

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

extension Outlay {

    public static func stackX(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        @ArrayBuilder views: () -> [UIView]
    ) -> UIStackView {
        let views = views()
        let stack = UIStackView(arrangedSubviews: views)
        stack.spacing = spacing
        stack.distribution = distribution
        stack.alignment = alignment
        stack.axis = .horizontal
        equateFlexibleSpacingsOf(views)
        return stack
    }

    public static func stackY(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        @ArrayBuilder views: () -> [UIView]
    ) -> UIStackView {
        let views = views()
        let stack = UIStackView(arrangedSubviews: views)
        stack.spacing = spacing
        stack.distribution = distribution
        stack.alignment = alignment
        stack.axis = .vertical
        equateFlexibleSpacingsOf(views)
        return stack
    }

    static func equateFlexibleSpacingsOf(_ views: [UIView]) {
        let flexibleSpacings = views.filter {
            guard let spacing = $0 as? Spacing else {
                return false
            }
            return spacing.minLength == UIView.noIntrinsicMetric
        }
        guard let lhs = flexibleSpacings.first else { return }
        activate {
            for rhs in flexibleSpacings[1...] {
                lhs.sizeAnchor == rhs.sizeAnchor
            }
        }
    }
}

public enum Outlay {}
