import UIKit

extension UIStackView {

    @inlinable
    public static func horizontal(
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

    @inlinable
    public static func vertical(
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

    @inlinable
    static func equateFlexibleSpacingsOf(_ views: [UIView]) {
        let flexibleSpacings = views.filter {
            guard let spacing = $0 as? Spacing else {
                return false
            }
            return spacing.minLength == UIView.noIntrinsicMetric
        }
        guard let lhs = flexibleSpacings.first else { return }
        NSLayoutConstraint.activate {
            for rhs in flexibleSpacings[1...] {
                lhs.sizeAnchor == rhs.sizeAnchor
            }
        }
    }
}
