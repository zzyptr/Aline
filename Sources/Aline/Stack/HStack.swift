import UIKit

public final class HStack: UIStackView {

    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        @ArrayBuilder views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        let views = views()
        for view in views {
            self.addArrangedSubview(view)
        }
        
        let flexibleSpacings = views.filter {
            if let spacing = $0 as? Spacer {
                return spacing.isFlexible
            }
            return false
        }
        guard let lhs = flexibleSpacings.first else { return }
        Aline.activate {
            for rhs in flexibleSpacings[1...] {
                lhs.sizeAnchor == rhs.sizeAnchor
            }
        }
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError()
    }
    
    public override var axis: NSLayoutConstraint.Axis {
        get {
            return .horizontal
        }
        @available(*, unavailable, message: "HStack is always horizontal")
        set {}
    }
}
