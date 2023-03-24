import UIKit

extension Outlay {

    @inlinable
    public static func activate(@ArrayBuilder _ constraints: () -> [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints())
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
            return spacing.dimension == nil
        }
        guard let lhs = flexibleSpacings.first else { return }
        Outlay.activate {
            for rhs in flexibleSpacings[1...] {
                lhs.sizeAnchor == rhs.sizeAnchor
            }
        }
    }
}

public enum Outlay {}
