@resultBuilder
public enum ArrayBuilder {

    @inlinable
    public static func buildBlock<Element>(_ components: [Element]...) -> [Element] {
        return components.reduce(into: [], +=)
    }

    @inlinable
    public static func buildOptional<Element>(_ component: [Element]?) -> [Element] {
        return component ?? []
    }

    @inlinable
    public static func buildEither<Element>(first component: [Element]) -> [Element] {
        return component
    }

    @inlinable
    public static func buildEither<Element>(second component: [Element]) -> [Element] {
        return component
    }

    @inlinable
    public static func buildArray<Element>(_ components: [[Element]]) -> [Element] {
        return components.reduce(into: [], +=)
    }

    @inlinable
    public static func buildExpression<Element>(_ expression: Element) -> [Element] {
        return [expression]
    }

    @inlinable
    public static func buildExpression<Element>(_ expression: [Element]) -> [Element] {
        return expression
    }

    @inlinable
    public static func buildLimitedAvailability<Element>(_ component: [Element]) -> [Element] {
        return component
    }
}
