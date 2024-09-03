import UIKit

public final class VStack: UIStackView {

    public init(@ArrayBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        super.axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        
        let arrangedSubviews = views()
        var flexibleSpacers = [Spacer]()
        for view in arrangedSubviews {
            addArrangedSubview(view)

            if let spacer = view as? Spacer {
                spacer.axis = .vertical
                if spacer.isFlexible {
                    flexibleSpacers.append(spacer)
                }
            }
        }
        guard let lhs = flexibleSpacers.first else { return }
        for rhs in flexibleSpacers[1...] {
            lhs.heightAnchor.constraint(equalTo: rhs.heightAnchor).isActive = true
        }
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError()
    }

    @inline(__always)
    public override var axis: NSLayoutConstraint.Axis {
        get {
            return .vertical
        }
        @available(*, unavailable, message: "VStack is always vertical")
        set {}
    }
}
