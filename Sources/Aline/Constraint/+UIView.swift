import UIKit

extension UIView {

    @inline(__always)
    public var edgesAnchor: EdgesAnchor {
        return EdgesAnchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }
}

extension UIView {

    @inline(__always)
    public var topLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }

    @inline(__always)
    public var bottomLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }

    @inline(__always)
    public var bottomTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: bottomAnchor)
    }

    @inline(__always)
    public var topTrailingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }

    @inline(__always)
    public var centerAnchor: PointAnchor {
        return PointAnchor(x: centerXAnchor, y: centerYAnchor)
    }
}

extension UIView {

    @inline(__always)
    public var sizeAnchor: SizeAnchor {
        return SizeAnchor(width: widthAnchor, height: heightAnchor)
    }
}
