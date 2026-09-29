import System
import Testing

@Suite("System topology CPU identifiers")
struct System_Ordinal_Tests {
    @Test("Processor ID retains its operating system value")
    func processorID() {
        let id: Int = 7
        let node = System.Topology.NUMA.Node(id: 0, cpus: [id])
        #expect(node.cpus == [7])
    }
}
