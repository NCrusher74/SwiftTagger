import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests: XCTestCase {
    
    func testCompletion() throws {
        XCTAssertEqual(MetadataItem.allCases.count, (MetadataID_Int.allCases.count + MetadataID_Bool.allCases.count + MetadataID_Date.allCases.count + MetadataID_Image.allCases.count + MetadataID_Other.allCases.count + MetadataID_PartOfTotal.allCases.count + MetadataID_StringArray.allCases.count + MetadataID_String.allCases.count))
        print(MetadataItem.allCases.count)
    }
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
    
    func testReadWriteMetadataA() throws {
        var mp4 = try AudioFile(location: mp4Meta)
        XCTAssertEqual(mp4.acknowledgment, "ACKNOWLEDGMENT")
        mp4.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(mp4.album, "ALBUM")
        mp4.album = "New Album"

        let mp4Output = try localDirectory(fileName: "testMp4", fileExtension: "m4a")
        try mp4.write(outputLocation: mp4Output)
        
        let newMp4 = try AudioFile(location: mp4Output)
        XCTAssertEqual(newMp4.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newMp4.album, "New Album")

        var mp3 = try AudioFile(location: mp3v24)
        XCTAssertEqual(mp3.acknowledgment, "Acknowledgment")
        mp3.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(mp3.album, "Album")
        mp3.album = "New Album"

        let mp3Output = try localDirectory(fileName: "testMp3", fileExtension: "mp3")
        try mp3.write(outputLocation: mp3Output)

        let newMp3 = try AudioFile(location: mp3Output)
        XCTAssertEqual(newMp3.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newMp3.album, "New Album")
    }
}
