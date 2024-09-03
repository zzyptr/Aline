import UIKit

public final class Spacer: UIView {

    let minLength: CGFloat

    var axis = NSLayoutConstraint.Axis.horizontal

    @inline(__always)
    var isFlexible: Bool {
        return minLength == UIView.noIntrinsicMetric
    }

    @inline(__always)
    public init(_ minLength: CGFloat? = nil) {
        self.minLength = minLength ?? UIView.noIntrinsicMetric
        super.init(frame: .zero)
    }

    @inline(__always)
    public override var intrinsicContentSize: CGSize {
        switch axis {
        case .horizontal:
            return CGSize(width: minLength, height: UIView.noIntrinsicMetric)
        case .vertical:
            return CGSize(width: UIView.noIntrinsicMetric, height: minLength)
        @unknown default:
            return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        }
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
