extension System {

    public enum Path {}
}

extension System.Path {

    public typealias Length = Tagged<System.Path, Cardinal>
}

extension Int {

    @inlinable
    public init(_ length: System.Path.Length) {
        self = Int(bitPattern: length)
    }
}
