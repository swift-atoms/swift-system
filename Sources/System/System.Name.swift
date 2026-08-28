extension System {

    public struct Name: Sendable, Hashable {

        public var system: Swift.String

        public var release: Swift.String

        public var machine: Swift.String

        public init(
            system: Swift.String,
            release: Swift.String,
            machine: Swift.String
        ) {
            self.system = system
            self.release = release
            self.machine = machine
        }
    }
}
