public import Cardinal
public import Cardinal_Standard_Library_Integration
public import Ordinal
public import Tagged

extension System {

    public enum Processor {}
}

extension System.Processor {

    public typealias Count = Tagged<System.Processor, Cardinal>

    public typealias ID = Tagged<System.Processor, Ordinal>
}

extension Int {

    @inlinable
    public init(_ count: System.Processor.Count) {
        self = Int(bitPattern: count)
    }
}
