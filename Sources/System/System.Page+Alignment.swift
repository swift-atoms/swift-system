public import Cardinal_Standard_Library_Integration
public import Memory
public import Tagged

extension Memory.Alignment {

    @inlinable
    public init(_ pageSize: System.Page.Size) {

        self = try! Memory.Alignment(Int(bitPattern: pageSize))
    }
}

extension System.Page.Size {

    @inlinable
    public var alignment: Memory.Alignment {
        Memory.Alignment(self)
    }
}
