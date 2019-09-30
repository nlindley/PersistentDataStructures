enum ListError: Error {
    case badSubscript
    case emptyList
}

public indirect enum List<T> {

    case empty
    case node(T, tail: List<T>)
    
    init() { self = .empty }
    init(_ element: T) {
        self = .node(element, tail: .empty)
    }
    init(_ elements: [T]) {
        switch elements.first {
        case nil:
            self = .empty
        case .some(let element):
            self = .node(element, tail: List(Array(elements.dropFirst())))
        }
    }
    
    func tail() throws -> List<T> {
        switch self {
        case .empty:
            throw ListError.emptyList
        case .node(_, let next):
            return next
        }
    }
    
    func head() throws -> T {
        switch self {
        case .empty:
            throw ListError.emptyList
        case .node(let head, _):
            return head
        }
    }
    
    func update(_ newValue: T, at index: Int) -> List {
        switch index {
        case 0:
            return .node(newValue, tail: try! self.tail())
        default:
            return .node(try! self.head(), tail: try! self.tail().update(newValue, at: index - 1))
        }
    }
}

infix operator ++: AdditionPrecedence
extension List {
    static func ++ (left: List, right: List) -> List {
        switch (left, right) {
        case (.empty, let right):
            return right
        default:
            return .node(try! left.head(), tail: try! left.tail() ++ right)
        }

    }
}

extension List: Equatable where T: Equatable {}

extension List: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = T

    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension List {
    subscript(index: Int) -> T {
        get {
            switch index {
            case 0:
                return try! self.head()
            default:
                return try! self.tail()[index - 1]
            }
        }
        set(newValue) {
            self = update(newValue, at: index)
        }
    }
}
