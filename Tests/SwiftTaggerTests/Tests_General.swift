import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests: XCTestCase {
    
    func testPrint() throws {
        let url = URL(fileURLWithPath: "/Users/nolainecrusher/Desktop/TestOutput/testMp4-All.m4a")
//        let url = mp4Meta
        let data = try Data(contentsOf: url)
        let range = 94173 ..< 94198
        let subdata = data.subdata(in: range)
        print(subdata.hexadecimal())
        
        /*
         0 0 0 19
         72 74 6e 67
         0 0 0 11
         64 61 74 61
         0 0 0 15
         0 0 0 0
         4
         
         0 0 0 19
         72 74 6e 67
         0 0 0 11
         64 61 74 61
         0 0 0 15
         0 0 0 0
         1
         */
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
    
    func testRemoveAllMetadataMp4() throws {
        var file = try AudioFile(location: mp4Meta)
        try file.removeAllMetadata()
        XCTAssertTrue(file.listMetadata.isEmpty)

        let mp4Output = try localDirectory(fileName: "testMp4-removeAll", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertTrue(newFile.listMetadata.isEmpty)
    }
    
    func testRemoveAllMetadataMp3() throws {
        var file = try AudioFile(location: mp3v24)
        try file.removeAllMetadata()
        XCTAssertTrue(file.listMetadata.isEmpty)
        print(file.listMetadata)
        
        let mp3Output = try localDirectory(fileName: "testMp3-removeAll", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertTrue(newFile.listMetadata.isEmpty)
    }
}
