public struct Addition<LHS, RHS> {

    let lhs: LHS
    let rhs: RHS

    @inline(__always)
    init(_ lhs: LHS, _ rhs: RHS) {
        self.lhs = lhs
        self.rhs = rhs
    }
}

public struct Multiplication<LHS, RHS> {

    let lhs: LHS
    let rhs: RHS

    @inline(__always)
    init(_ lhs: LHS, _ rhs: RHS) {
        self.lhs = lhs
        self.rhs = rhs
    }
}
