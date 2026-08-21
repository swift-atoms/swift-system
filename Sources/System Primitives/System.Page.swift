extension System {

    public enum Page {}
}

extension System.Page {

    public typealias Size = Tagged<System.Page, Cardinal>
}

extension Int {

    @inlinable
    public init(_ size: System.Page.Size) {
        self = Int(bitPattern: size)
    }
}
