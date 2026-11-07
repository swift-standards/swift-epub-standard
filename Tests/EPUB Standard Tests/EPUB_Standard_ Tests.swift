import EPUB_Standard
import Testing

enum `EPUB_Standard_ Tests` {}

extension `EPUB_Standard_ Tests` {
    @Suite
    struct `EPUB Standard Tests` {
        @Suite
        struct Unit {
            @Test
            func `W3C EPUB is exported`() {

                let version = W3C_EPUB.Version.v3_3
                #expect(version.major == 3)
                #expect(version.minor == 3)
            }
        }

        @Suite
        struct `Edge Case` {
        }

        @Suite
        struct Integration {
        }
    }
}
