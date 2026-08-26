import Testing

@testable import System

@Suite
struct `System Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `System Tests`.Unit {
    @Test
    func `Topology types are constructible`() {
        let node = System.Topology.NUMA.Node(
            id: 0,
            cpus: [0, 1, 2, 3],
            isSynthetic: false
        )
        #expect(node.id == 0)
        #expect(node.cpus.count == 4)
        #expect(node.isSynthetic == false)

        let topology = System.Topology(
            cpuCount: 4,
            numa: .nonUniform(nodes: [node])
        )
        #expect(topology.cpuCount == 4)
        if case .nonUniform(let nodes) = topology.numa {
            #expect(nodes.count == 1)
        } else {
            Issue.record("Expected .nonUniform")
        }
    }

    @Test
    func `NUMA State cases`() {
        let unavailable = System.Topology.NUMA.State.unavailable
        let uniform = System.Topology.NUMA.State.uniformAccess
        let nonUniform = System.Topology.NUMA.State.nonUniform(nodes: [])

        #expect(unavailable == .unavailable)
        #expect(uniform == .uniformAccess)
        #expect(nonUniform == .nonUniform(nodes: []))
    }

}
