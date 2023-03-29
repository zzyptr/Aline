public struct Addition<LHS, RHS> {

    @usableFromInline
    let lhs: LHS

    @usableFromInline
    let rhs: RHS

    @inlinable
    init(_ lhs: LHS, _ rhs: RHS) {
        self.lhs = lhs
        self.rhs = rhs
    }
}

public struct Multiplication<LHS, RHS> {

    @usableFromInline
    let lhs: LHS

    @usableFromInline
    let rhs: RHS

    @inlinable
    init(_ lhs: LHS, _ rhs: RHS) {
        self.lhs = lhs
        self.rhs = rhs
    }
}
