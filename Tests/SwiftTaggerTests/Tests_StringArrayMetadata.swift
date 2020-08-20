import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_StringArrayMetadata: XCTestCase {
    
    func testReadWriteMp4ArrayMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.arrangerKeywords, ["Arranger", "Keywords"])
        XCTAssertEqual(read.artistKeywords, ["Artist", "Keywords"])
        XCTAssertEqual(read.composerKeywords, ["Composer", "Keywords"])
        XCTAssertEqual(read.podcastKeywords, ["Key", "Words"])
        XCTAssertEqual(read.producerKeywords, ["Producer", "Keywords"])
        XCTAssertEqual(read.songwriterKeywords, ["Songwriter", "Keywords"])
        XCTAssertEqual(read.subtitleKeywords, ["Subtitle", "Keywords"])
        XCTAssertEqual(read.titleKeywords, ["Title", "Keywords"])

        var write = try AudioFile(location: mp4NoMeta)
        write.arrangerKeywords = ["New", "Keywords"]
        write.artistKeywords = ["New", "Keywords"]
        write.composerKeywords = ["New", "Keywords"]
        write.podcastKeywords = ["New", "Keywords"]
        write.producerKeywords = ["New", "Keywords"]
        write.songwriterKeywords = ["New", "Keywords"]
        write.subtitleKeywords = ["New", "Keywords"]
        write.titleKeywords = ["New", "Keywords"]

        let outputUrl = try localDirectory(fileName: "testMp4-Array", fileExtension: "m4a")
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
        let read = try AudioFile(location: mp3v24)
        XCTAssertNil(read.arrangerKeywords)
        XCTAssertNil(read.artistKeywords)
        XCTAssertNil(read.composerKeywords)
        XCTAssertEqual(read.podcastKeywords, ["Podcast Keywords"])
        XCTAssertNil(read.producerKeywords)
        XCTAssertNil(read.songwriterKeywords)
        XCTAssertNil(read.subtitleKeywords)
        XCTAssertNil(read.titleKeywords)

        var write = try AudioFile(location: mp3NoMeta)
        write.arrangerKeywords = ["New", "Keywords"]
        write.artistKeywords = ["New", "Keywords"]
        write.composerKeywords = ["New", "Keywords"]
        write.podcastKeywords = ["New", "Keywords"]
        write.producerKeywords = ["New", "Keywords"]
        write.songwriterKeywords = ["New", "Keywords"]
        write.subtitleKeywords = ["New", "Keywords"]
        write.titleKeywords = ["New", "Keywords"]

        let outputUrl = try localDirectory(fileName: "testMp3-Array", fileExtension: "mp3")
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
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.arrangerKeywords, ["Arranger", "Keywords"])
        XCTAssertEqual(read.artistKeywords, ["Artist", "Keywords"])
        XCTAssertEqual(read.composerKeywords, ["Composer", "Keywords"])
        XCTAssertEqual(read.podcastKeywords, ["Key", "Words"])
        XCTAssertEqual(read.producerKeywords, ["Producer", "Keywords"])
        XCTAssertEqual(read.songwriterKeywords, ["Songwriter", "Keywords"])
        XCTAssertEqual(read.subtitleKeywords, ["Subtitle", "Keywords"])
        XCTAssertEqual(read.titleKeywords, ["Title", "Keywords"])
        
        var write = try AudioFile(location: mp4Meta)
        write.arrangerKeywords = nil
        write.artistKeywords = nil
        write.composerKeywords = nil
        write.podcastKeywords = nil
        write.producerKeywords = nil
        write.songwriterKeywords = nil
        write.subtitleKeywords = nil
        write.titleKeywords = nil
        
        let outputUrl = try localDirectory(fileName: "testMp4-Array-Removal", fileExtension: "m4a")
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
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.podcastKeywords, ["Podcast Keywords"])
        
        var write = try AudioFile(location: mp3v24)
        write.podcastKeywords = nil
        
        let outputUrl = try localDirectory(fileName: "testMp3-Array-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.podcastKeywords)
    }
}
