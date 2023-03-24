import UIKit

public final class Spacing: UIView {

    @usableFromInline
    let dimension: CGFloat?

    public init() {
        self.dimension = nil
        super.init(frame: .zero)
    }

    @inlinable
    public init(_ dimension: CGFloat) {
        self.dimension = dimension
        super.init(frame: .zero)
    }

    @inlinable
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        let priority = UILayoutPriority(dimension == nil ? 0 : 99)
        setContentHuggingPriority(priority, for: .vertical)
        setContentHuggingPriority(priority, for: .horizontal)
        setContentCompressionResistancePriority(priority, for: .vertical)
        setContentCompressionResistancePriority(priority, for: .horizontal)
    }

    @inlinable
    public override var intrinsicContentSize: CGSize {
        if let dimension = dimension {
            return CGSize(width: dimension, height: dimension)
        }
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }

    @available(*, unavailable)
    public override init(frame: CGRect) {
        self.dimension = nil
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
}
