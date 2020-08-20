import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_BoolMetadata: XCTestCase {
    
    func testReadWriteMp4BoolMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertEqual(read.podcast, true)
        XCTAssertEqual(read.showWorkAndMovement, true)
        
        var write = try AudioFile(location: mp4NoMeta)
        write.compilation = true
        write.gaplessPlayback = true
        write.podcast = true
        write.showWorkAndMovement = true
        
        let outputUrl = try localDirectory(fileName: "testMp4-Bool", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.compilation, true)
        XCTAssertEqual(newFile.gaplessPlayback, true)
        XCTAssertEqual(newFile.podcast, true)
        XCTAssertEqual(newFile.showWorkAndMovement, true)
    }
    
    func testReadWriteID3BoolMetadata() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertNil(read.podcast)
        XCTAssertNil(read.showWorkAndMovement)
        
        var write = try AudioFile(location: mp3NoMeta)
        write.compilation = true
        write.gaplessPlayback = true
        write.podcast = true
        write.showWorkAndMovement = true
        
        let outputUrl = try localDirectory(fileName: "testMp3-Bool", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.compilation, true)
        XCTAssertEqual(newFile.gaplessPlayback, true)
        XCTAssertEqual(newFile.playlistDelay, 0)
        XCTAssertNil(newFile.podcast)
        XCTAssertEqual(newFile.showWorkAndMovement, true)
    }

    func testMp4BoolMetadataRemoval() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertEqual(read.podcast, true)
        XCTAssertEqual(read.showWorkAndMovement, true)
        
        var write = try AudioFile(location: mp4Meta)
        write.compilation = nil
        write.gaplessPlayback = nil
        write.podcast = nil
        write.showWorkAndMovement = nil
        
        let outputUrl = try localDirectory(fileName: "testMp4-Bool-Removal", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.compilation)
        XCTAssertNil(newFile.gaplessPlayback)
        XCTAssertNil(newFile.podcast)
        XCTAssertNil(newFile.showWorkAndMovement)
    }
    
    func testID3BoolMetadataRemoval() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertNil(read.podcast)
        XCTAssertNil(read.showWorkAndMovement)
        
        var write = try AudioFile(location: mp3v24)
        write.compilation = nil
        write.gaplessPlayback = nil
        write.podcast = nil
        write.showWorkAndMovement = nil
        
        let outputUrl = try localDirectory(fileName: "testMp3-Bool-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.compilation)
        XCTAssertNil(newFile.gaplessPlayback)
        XCTAssertNil(newFile.playlistDelay)
        XCTAssertNil(newFile.podcast)
        XCTAssertNil(newFile.showWorkAndMovement)
    }

}
