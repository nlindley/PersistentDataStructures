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
    
    init(_ element: T, tail: List<T>) {
        self = .node(element, tail: tail)
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
    
    // FIXME: This should be O(1)
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case let .node(_, tail):
            return 1 + tail.count
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
    public subscript(index: Int) -> T {
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

extension List {
    func suffixes() -> List<List<T>> {
        switch self {
        case .empty:
            return .node(.empty, tail: .empty)
        case let .node(_, tail):
            return .node(self, tail: tail.suffixes())
        }
    }
}

extension List: Collection {
    public func index(after i: Int) -> Int {
        return i + 1
    }
    
    public var startIndex: Int {
        return 0
    }

    public var endIndex: Int {
        return self.count
    }
}

extension List: CustomStringConvertible {
    // FIXME: This was a quick hack to take advantage of Array’s formatting
    public var description: String {
        let array = Array(self)
        return array.description
    }
}
