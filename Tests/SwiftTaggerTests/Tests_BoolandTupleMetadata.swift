import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_Bool_Tuple_Metadata: XCTestCase {
    
    func testReadWriteMp4BoolMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertEqual(read.podcast, true)
        XCTAssertEqual(read.showWork, true)
        
        var write = try AudioFile(location: mp4NoMeta)
        write.compilation = true
        write.gaplessPlayback = true
        write.podcast = true
        write.showWork = true

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-Bool.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Bool", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.compilation, true)
        XCTAssertEqual(newFile.gaplessPlayback, true)
        XCTAssertEqual(newFile.podcast, true)
        XCTAssertEqual(newFile.showWork, true)
    }
    
    func testReadWriteID3BoolMetadata() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertNil(read.podcast)
        XCTAssertNil(read.showWork)
        
        var write = try AudioFile(location: mp3NoMeta)
        write.compilation = true
        write.gaplessPlayback = true
        write.podcast = true
        write.showWork = true
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-Bool.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Bool", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.compilation, true)
        XCTAssertEqual(newFile.gaplessPlayback, true)
        XCTAssertEqual(newFile.playlistDelay, 0)
        XCTAssertNil(newFile.podcast)
        XCTAssertEqual(newFile.showWork, true)
    }

    func testMp4BoolMetadataRemoval() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertEqual(read.podcast, true)
        XCTAssertEqual(read.showWork, true)
        
        var write = try AudioFile(location: mp4Meta)
        write.compilation = nil
        write.gaplessPlayback = nil
        write.podcast = nil
        write.showWork = nil
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-BoolRemoval.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Bool-Removal", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.compilation)
        XCTAssertNil(newFile.gaplessPlayback)
        XCTAssertNil(newFile.podcast)
        XCTAssertNil(newFile.showWork)
    }
    
    func testID3BoolMetadataRemoval() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.compilation, true)
        XCTAssertEqual(read.gaplessPlayback, true)
        XCTAssertNil(read.podcast)
        XCTAssertNil(read.showWork)
        
        var write = try AudioFile(location: mp3v24)
        write.compilation = nil
        write.gaplessPlayback = nil
        write.podcast = nil
        write.showWork = nil
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp43-BoolRemoval.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Bool-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.compilation)
        XCTAssertNil(newFile.gaplessPlayback)
        XCTAssertNil(newFile.playlistDelay)
        XCTAssertNil(newFile.podcast)
        XCTAssertNil(newFile.showWork)
    }

    func testReadWriteMp4TupleMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.discNumber.disc, 2)
        XCTAssertEqual(read.discNumber.totalDiscs, 3)
        XCTAssertEqual(read.trackNumber.track, 4)
        XCTAssertEqual(read.trackNumber.totalTracks, 5)

        var write = try AudioFile(location: mp4NoMeta)
        write.discNumber.disc = 3
        write.discNumber.totalDiscs = 4
        write.trackNumber.track = 5
        write.trackNumber.totalTracks = 6
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-Tuple.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Tuple", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.discNumber.disc, 3)
        XCTAssertEqual(newFile.discNumber.totalDiscs, 4)
        XCTAssertEqual(newFile.trackNumber.track, 5)
        XCTAssertEqual(newFile.trackNumber.totalTracks, 6)
    }
    
    func testReadWriteID3TupleMetadata() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.discNumber.disc, 4)
        XCTAssertEqual(read.discNumber.totalDiscs, 5)
        XCTAssertEqual(read.trackNumber.track, 6)
        XCTAssertEqual(read.trackNumber.totalTracks, 7)

        var write = try AudioFile(location: mp3NoMeta)
        write.discNumber.disc = 3
        write.discNumber.totalDiscs = 4
        write.trackNumber.track = 5
        write.trackNumber.totalTracks = 6

        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-Tuple.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Tuple", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.discNumber.disc, 3)
        XCTAssertEqual(newFile.discNumber.totalDiscs, 4)
        XCTAssertEqual(newFile.trackNumber.track, 5)
        XCTAssertEqual(newFile.trackNumber.totalTracks, 6)
    }
    
    func testMp4TupleMetadataRemoval() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.discNumber.disc, 2)
        XCTAssertEqual(read.discNumber.totalDiscs, 3)
        XCTAssertEqual(read.trackNumber.track, 4)
        XCTAssertEqual(read.trackNumber.totalTracks, 5)

        var write = try AudioFile(location: mp4Meta)
        write.discNumber.disc = nil
        write.discNumber.totalDiscs = nil
        write.trackNumber.track = nil
        write.trackNumber.totalTracks = nil

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-TupleRemove.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Tuple-Removal", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.discNumber.disc)
        XCTAssertNil(newFile.discNumber.totalDiscs)
        XCTAssertNil(newFile.trackNumber.track)
        XCTAssertNil(newFile.trackNumber.totalTracks)
     }
    
    func testID3TupleMetadataRemoval() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.discNumber.disc, 4)
        XCTAssertEqual(read.discNumber.totalDiscs, 5)
        XCTAssertEqual(read.trackNumber.track, 6)
        XCTAssertEqual(read.trackNumber.totalTracks, 7)

        var write = try AudioFile(location: mp3v24)
        write.discNumber.disc = nil
        write.discNumber.totalDiscs = nil
        write.trackNumber.track = nil
        write.trackNumber.totalTracks = nil

        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-TupleRemove.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Tuple-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.discNumber.disc)
        XCTAssertNil(newFile.discNumber.totalDiscs)
        XCTAssertNil(newFile.trackNumber.track)
        XCTAssertNil(newFile.trackNumber.totalTracks)
    }
}
