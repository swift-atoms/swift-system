public import Cardinal
public import Cardinal_Standard_Library_Integration
public import Tagged

extension System {

    public enum Memory {}
}

extension System.Memory {

    public typealias Capacity = Tagged<System.Memory, Cardinal>
}

extension UInt64 {

    @inlinable
    public init(_ capacity: System.Memory.Capacity) {
        self = UInt64(Int(bitPattern: capacity))
    }
}

extension Int {

    @inlinable
    public init(_ capacity: System.Memory.Capacity) {
        self = Int(bitPattern: capacity)
    }
}
