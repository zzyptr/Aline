@resultBuilder
public enum ArrayBuilder {

    @inline(__always)
    public static func buildBlock<Element>(_ components: [Element]...) -> [Element] {
        return components.reduce(into: [], +=)
    }

    @inline(__always)
    public static func buildOptional<Element>(_ component: [Element]?) -> [Element] {
        return component ?? []
    }

    @inline(__always)
    public static func buildEither<Element>(first component: [Element]) -> [Element] {
        return component
    }

    @inline(__always)
    public static func buildEither<Element>(second component: [Element]) -> [Element] {
        return component
    }

    @inline(__always)
    public static func buildArray<Element>(_ components: [[Element]]) -> [Element] {
        return components.reduce(into: [], +=)
    }

    @inline(__always)
    public static func buildExpression<Element>(_ expression: Element) -> [Element] {
        return [expression]
    }

    @inline(__always)
    public static func buildExpression<Element>(_ expression: [Element]) -> [Element] {
        return expression
    }

    @inline(__always)
    public static func buildLimitedAvailability<Element>(_ component: [Element]) -> [Element] {
        return component
    }
}
