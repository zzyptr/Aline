import UIKit

public final class HStack: UIStackView {

    public init(
        alignment: UIStackView.Alignment = .center,
        @ArrayBuilder views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.alignment = alignment
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
        for rhs in flexibleSpacings[1...] {
            lhs.widthAnchor.constraint(equalTo: rhs.widthAnchor).isActive = true
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
