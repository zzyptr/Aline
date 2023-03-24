@resultBuilder
enum ArrayBuilder {

    @inlinable
    static func buildBlock<Element>(_ components: [Element]...) -> [Element] {
        return components.reduce([], +)
    }

    @inlinable
    static func buildOptional<Element>(_ component: [Element]?) -> [Element] {
        return component ?? []
    }

    @inlinable
    static func buildEither<Element>(first component: [Element]) -> [Element] {
        return component
    }

    @inlinable
    static func buildEither<Element>(second component: [Element]) -> [Element] {
        return component
    }

    @inlinable
    static func buildArray<Element>(_ components: [[Element]]) -> [Element] {
        return components.reduce([], +)
    }

    @inlinable
    static func buildExpression<Element>(_ expression: Element) -> [Element] {
        return [expression]
    }

    @inlinable
    static func buildExpression<Element>(_ expression: [Element]) -> [Element] {
        return expression
    }

    @inlinable
    static func buildLimitedAvailability<Element>(_ component: [Element]) -> [Element] {
        return component
    }
}
