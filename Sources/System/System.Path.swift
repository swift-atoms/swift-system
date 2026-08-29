public import Cardinal
public import Cardinal_Standard_Library_Integration
public import Tagged

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
