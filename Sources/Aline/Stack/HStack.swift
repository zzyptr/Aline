import UIKit

public final class HStack: UIStackView {

    public init(@ArrayBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        let arrangedSubviews = views()
        var flexibleSpacers = [Spacer]()
        for view in arrangedSubviews {
            addArrangedSubview(view)

            if let spacer = view as? Spacer {
                if spacer.isFlexible {
                    flexibleSpacers.append(spacer)
                }
            }
        }
        guard let lhs = flexibleSpacers.first else { return }
        for rhs in flexibleSpacers[1...] {
            lhs.widthAnchor.constraint(equalTo: rhs.widthAnchor).isActive = true
        }
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError()
    }
    
    @inline(__always)
    public override var axis: NSLayoutConstraint.Axis {
        get {
            return .horizontal
        }
        @available(*, unavailable, message: "HStack is always horizontal")
        set {}
    }
}
