import UIKit

public final class Spacer: UIView {

    @usableFromInline
    let minLength: CGFloat

    @inlinable
    var isFlexible: Bool {
        return minLength == UIView.noIntrinsicMetric
    }

    @inlinable
    public init(_ minLength: CGFloat? = nil) {
        self.minLength = minLength ?? UIView.noIntrinsicMetric
        super.init(frame: .zero)

        let priority = UILayoutPriority(minLength == UIView.noIntrinsicMetric ? 1 : 9)
        setContentHuggingPriority(priority, for: .vertical)
        setContentHuggingPriority(priority, for: .horizontal)
        setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }

    @inlinable
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: minLength, height: minLength)
    }

    @available(*, unavailable)
    override init(frame: CGRect) {
        self.minLength = UIView.noIntrinsicMetric
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        self.minLength = UIView.noIntrinsicMetric
        super.init(coder: coder)
    }
}
