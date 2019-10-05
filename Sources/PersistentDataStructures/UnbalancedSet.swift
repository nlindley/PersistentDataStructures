public indirect enum UnbalancedSet<T: Comparable>: Equatable {
    case empty
    case tree(UnbalancedSet<T>, T, UnbalancedSet<T>)
    
    public init() {
        self = .empty
    }
    
    public init(_ x: T) {
        self = .tree(.empty, x, .empty)
    }
    
    func member(_ x: T) -> Bool {
        switch self {
        case .empty:
            return false
        case let .tree(a, y, _) where x < y:
            return a.member(x)
        case let .tree(_, y, b) where y < x:
            return b.member(y)
        default:
            return true
        }
    }
    
    func insert(_ x: T) -> UnbalancedSet<T> {
        switch self {
        case .empty:
            return .tree(.empty, x, .empty)
        case let .tree(a, y, b) where x < y:
            return .tree(a.insert(x), y, b)
        case let .tree(a, y, b) where y < x:
            return .tree(a, y, b.insert(x))
        default:
            return self
        }
    }
}
