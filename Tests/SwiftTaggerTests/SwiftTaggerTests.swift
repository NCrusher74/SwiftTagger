import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

final class SwiftTaggerTests: XCTestCase {
    @available(OSX 10.13, *)
    func testAudioFileInit() throws {
        XCTAssertNoThrow(try AudioFile(location: mp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: mp3NoMeta))
    }
}
