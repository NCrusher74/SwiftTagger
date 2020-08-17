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
    
    @available(OSX 10.13, *)
    func testListMetadataID3() throws {
        let mp4 = try AudioFile(location: mp4Meta)
        XCTAssertFalse(mp4.listMetadata.isEmpty)
        for item in mp4.listMetadata {
            print(item)
        }
        
        let mp3 = try AudioFile(location: mp3v24)
        XCTAssertFalse(mp3.listMetadata.isEmpty)
        for item in mp3.listMetadata {
            print(item)
        }
    }
}
