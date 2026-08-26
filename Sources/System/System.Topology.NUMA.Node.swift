extension System.Topology.NUMA {

    public struct Node: Sendable, Equatable, Identifiable {

        public let id: Int

        public let cpus: Set<Int>

        public let isSynthetic: Bool

        public init(id: Int, cpus: Set<Int>, isSynthetic: Bool = false) {
            self.id = id
            self.cpus = cpus
            self.isSynthetic = isSynthetic
        }
    }
}
