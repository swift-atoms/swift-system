extension System {

    public struct Topology: Sendable, Equatable {

        public let cpuCount: Int

        public let numa: NUMA.State

        public init(cpuCount: Int, numa: NUMA.State) {
            self.cpuCount = cpuCount
            self.numa = numa
        }
    }
}
