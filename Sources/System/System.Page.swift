public import Cardinal
public import Cardinal_Standard_Library_Integration
public import Tagged

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
