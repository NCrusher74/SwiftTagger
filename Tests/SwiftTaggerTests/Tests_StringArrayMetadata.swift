import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_StringArrayMetadata: XCTestCase {
    
    func testReadWriteMp4ArrayMetadata() throws {
        var write = try AudioFile(location: mp4NoMeta)
        write.arrangerKeywords = ["New", "Keywords"]
        write.artistKeywords = ["New", "Keywords"]
        write.composerKeywords = ["New", "Keywords"]
        write.podcastKeywords = ["New", "Keywords"]
        write.producerKeywords = ["New", "Keywords"]
        write.songwriterKeywords = ["New", "Keywords"]
        write.subtitleKeywords = ["New", "Keywords"]
        write.titleKeywords = ["New", "Keywords"]

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-array.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Array", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.arrangerKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.artistKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.composerKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.podcastKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.producerKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.songwriterKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.subtitleKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.titleKeywords, ["New", "Keywords"])
    }
    
    func testReadWriteID3ArrayMetadata() throws {
        var write = try AudioFile(location: mp3NoMeta)
        write.arrangerKeywords = ["New", "Keywords"]
        write.artistKeywords = ["New", "Keywords"]
        write.composerKeywords = ["New", "Keywords"]
        write.podcastKeywords = ["New", "Keywords"]
        write.producerKeywords = ["New", "Keywords"]
        write.songwriterKeywords = ["New", "Keywords"]
        write.subtitleKeywords = ["New", "Keywords"]
        write.titleKeywords = ["New", "Keywords"]

        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-array.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Array", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.arrangerKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.artistKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.composerKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.podcastKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.producerKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.songwriterKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.subtitleKeywords, ["New", "Keywords"])
        XCTAssertEqual(newFile.titleKeywords, ["New", "Keywords"])
    }
    
    func testMp4ArrayMetadataRemoval() throws {
        var write = try AudioFile(location: mp4Meta)
        write.arrangerKeywords = nil
        write.artistKeywords = nil
        write.composerKeywords = nil
        write.podcastKeywords = nil
        write.producerKeywords = nil
        write.songwriterKeywords = nil
        write.subtitleKeywords = nil
        write.titleKeywords = nil
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-arrayRemoval.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Array-Removal", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.arrangerKeywords)
        XCTAssertNil(newFile.artistKeywords)
        XCTAssertNil(newFile.composerKeywords)
        XCTAssertNil(newFile.podcastKeywords)
        XCTAssertNil(newFile.producerKeywords)
        XCTAssertNil(newFile.songwriterKeywords)
        XCTAssertNil(newFile.subtitleKeywords)
        XCTAssertNil(newFile.titleKeywords)
    }
    
    func testID3ArrayMetadataRemoval() throws {
        var write = try AudioFile(location: mp3v24)
        write.podcastKeywords = nil
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-arrayRemoval.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Array-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.podcastKeywords)
    }
}
