import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests: XCTestCase {
    
    func testPrint() throws {
//        let url = URL(fileURLWithPath: "/Users/nolainecrusher/Desktop/TestOutput/testMp4-All.m4a")
        let url = mp4Meta
        let data = try Data(contentsOf: url)
        let range = 000000085171 ..< 000000085215
        let subdata = data.subdata(in: range)
        print(subdata.hexadecimal())
    }
    /*
     0 0 0 2c
     79 72 72 63
     0 0 0 24
     64 61 74 61
     0 0 0 1
     0 0 0 0
     31 39 37 39 2d 31 31 2d 32 33 54 30 30 3a 30 30 3a 30 30 5a
     */
        
    func testAudioFileInit() throws {
        XCTAssertNoThrow(try AudioFile(location: mp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: mp3NoMeta))
    }
    
    func testListMetadata() throws {
        let mp4 = try AudioFile(location: mp4Meta)
        XCTAssertNotNil(mp4.mp4Tag)
        XCTAssertFalse(mp4.metadata.isEmpty)
        
        let mp3 = try AudioFile(location: mp3v24)
        XCTAssertNotNil(mp3.id3Tag)
        XCTAssertFalse(mp3.metadata.isEmpty)
    }
    
    func testRemoveAllMetadataMp4() throws {
        var file = try AudioFile(location: mp4Meta)
        try file.removeAllMetadata()
        XCTAssertTrue(file.metadata.isEmpty)
        print(file.metadata)

        let mp4Output = try localDirectory(fileName: "testMp4-removeAll", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertTrue(newFile.metadata.isEmpty)
        print(newFile.metadata)
    }
    
    func testRemoveAllMetadataMp3() throws {
        var file = try AudioFile(location: mp3v24)
        try file.removeAllMetadata()
        XCTAssertTrue(file.metadata.isEmpty)
        
        let mp3Output = try localDirectory(fileName: "testMp3-removeAll", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertTrue(newFile.metadata.isEmpty)
    }
}
