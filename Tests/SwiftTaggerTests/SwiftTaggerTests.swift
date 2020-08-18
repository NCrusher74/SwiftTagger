import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests: XCTestCase {
    
    func testCompletion() throws {
        XCTAssertEqual(MetadataItem.allCases.count, (MetadataID_Int.allCases.count + MetadataID_Bool.allCases.count + MetadataID_Date.allCases.count + MetadataID_Image.allCases.count + MetadataID_Other.allCases.count + MetadataID_PartOfTotal.allCases.count + MetadataID_StringArray.allCases.count + MetadataID_String.allCases.count))
    }
    
    func testAudioFileInit() throws {
        XCTAssertNoThrow(try AudioFile(location: mp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: mp3NoMeta))
    }
    
    func testListMetadataID3() throws {
        let mp4 = try AudioFile(location: mp4Meta)
        XCTAssertNotNil(mp4.mp4Tag)
        XCTAssertFalse(mp4.listMetadata.isEmpty)
        
        let mp3 = try AudioFile(location: mp3v24)
        XCTAssertNotNil(mp3.id3Tag)
        XCTAssertFalse(mp3.listMetadata.isEmpty)
    }
}
