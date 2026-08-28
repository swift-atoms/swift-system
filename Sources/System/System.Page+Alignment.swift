public import Memory_Alignment

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
