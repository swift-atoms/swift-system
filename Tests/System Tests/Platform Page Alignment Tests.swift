import Memory
import Testing

@Suite("Platform page size × Memory.Alignment")
struct System_Memory_Tests {

    @Test("Alignment initializes from a page size")
    func alignmentInitializer() throws {
        let pageSize = 4096
        let alignment = try Memory.Alignment(pageSize)

        #expect(alignment.magnitude(as: Int.self) == 4096)
    }

    @Test("A larger page size validates its memory alignment")
    func pageSizeAlignment() throws {
        let pageSize = 16_384

        let alignment = try Memory.Alignment(pageSize)
        #expect(alignment.magnitude(as: Int.self) == 16_384)
    }
}
