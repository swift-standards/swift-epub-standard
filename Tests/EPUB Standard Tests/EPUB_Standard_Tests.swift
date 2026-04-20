import Testing
import EPUB_Standard

@Suite("EPUB Standard Tests")
struct EPUB_Standard_Tests {
    @Test
    func `W3C EPUB is exported`() {
        // Verify W3C_EPUB types are accessible through EPUB Standard
        let version = W3C_EPUB.Version.v3_3
        #expect(version.major == 3)
        #expect(version.minor == 3)
    }
}
