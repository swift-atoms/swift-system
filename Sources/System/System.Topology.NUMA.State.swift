extension System.Topology.NUMA {

    public enum State: Sendable, Equatable {

        case unavailable

        case uniformAccess

        case nonUniform(nodes: [Node])
    }
}
