#if canImport(Darwin)
    import Foundation
    import struct System.FilePath
    import System_Primitives
    import Testing

    extension `System Tests`.Integration {
        @Test
        func `SDK file paths and system primitives keep distinct identities`() {
            let path = FilePath("/tmp")
            let url = URL(filePath: path)
            #expect(url?.path == "/tmp")
            let topology = System.Topology(cpuCount: 4, numa: .uniformAccess)
            #expect(topology.cpuCount == 4)
        }
    }
#endif
