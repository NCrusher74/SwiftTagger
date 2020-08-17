import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests: XCTestCase {
    func testAudioFileInit() throws {
        XCTAssertNoThrow(try AudioFile(location: mp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: mp3NoMeta))        
    }
    
    func testListMetadataID3() throws {
        let mp4 = try AudioFile(location: mp4Meta)
        XCTAssertNotNil(mp4.mp4Tag)
        XCTAssertFalse(mp4.listMetadata.isEmpty)
        for item in mp4.listMetadata {
            print(item)
        }
        
        let mp3 = try AudioFile(location: mp3v24)
        XCTAssertNotNil(mp3.id3Tag)
        XCTAssertFalse(mp3.listMetadata.isEmpty)
        for item in mp3.listMetadata {
            print(item)
        }
    }
    
    func testAcknowledgmentReadWrite() throws {
        var mp4 = try AudioFile(location: mp4Meta)
        XCTAssertEqual(mp4.acknowledgment, "ACKNOWLEDGMENT")
        mp4.acknowledgment = "New Acknowledgment"
        
        let mp4Output = try localDirectory(fileName: "testMp4", fileExtension: "m4a")
        try mp4.write(outputLocation: mp4Output)
        
        let newMp4 = try AudioFile(location: mp4Output)
        XCTAssertEqual(newMp4.acknowledgment, "New Acknowledgment")

        
        var mp3 = try AudioFile(location: mp3v24)
        XCTAssertEqual(mp3.acknowledgment, "Acknowledgment")
        mp3.acknowledgment = "New Acknowledgment"
        
        let mp3Output = try localDirectory(fileName: "testMp3", fileExtension: "mp3")
        try mp3.write(outputLocation: mp3Output)

        let newMp3 = try AudioFile(location: mp3Output)
        XCTAssertEqual(newMp3.acknowledgment, "New Acknowledgment")
    }
}
