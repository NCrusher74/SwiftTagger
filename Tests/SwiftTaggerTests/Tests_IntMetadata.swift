import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_IntMetadata: XCTestCase {
    
    func testReadWriteMp4IntMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.albumID, 123456)
        XCTAssertEqual(read.appleStoreCountryID, 678901)
        XCTAssertEqual(read.artistID, 234567)
        XCTAssertEqual(read.bpm, 99)
        XCTAssertEqual(read.composerID, 345678)
        XCTAssertEqual(read.conductorID, 456789)
        XCTAssertEqual(read.genreID.mp4Genre, .audiobooks)
        XCTAssertNil(read.genreID.id3Genre)
        XCTAssertEqual(read.length, 5016)
        XCTAssertEqual(read.movementCount, 9)
        XCTAssertEqual(read.movementNumber, 8)
        XCTAssertEqual(read.playlistID, 567890)
        XCTAssertEqual(read.tvEpisodeNumber, 7)
        XCTAssertEqual(read.tvSeason, 6)
        
        var write = try AudioFile(location: mp4NoMeta)
        write.albumID = 654321
        write.appleStoreCountryID = 765432
        write.artistID = 876543
        write.bpm = 98
        write.composerID = 987654
        write.conductorID = 098765
        write.genreID.mp4Genre = .audiobooksNews
        write.movementCount = 6
        write.movementNumber = 5
        write.playlistID = 109876
        write.tvEpisodeNumber = 5
        write.tvSeason = 4

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-Int.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Int", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.albumID, 654321)
        XCTAssertEqual(newFile.appleStoreCountryID, 765432)
        XCTAssertEqual(newFile.artistID, 876543)
        XCTAssertEqual(newFile.bpm, 98)
        XCTAssertEqual(newFile.composerID, 987654)
        XCTAssertEqual(newFile.conductorID, 098765)
        XCTAssertEqual(newFile.genreID.mp4Genre, .audiobooksNews)
        XCTAssertNil(newFile.genreID.id3Genre)
        XCTAssertEqual(newFile.movementCount, 6)
        XCTAssertEqual(newFile.movementNumber, 5)
        XCTAssertEqual(newFile.playlistID, 109876)
        XCTAssertEqual(newFile.tvEpisodeNumber, 5)
        XCTAssertEqual(newFile.tvSeason, 4)
    }
    
    func testReadWriteId3IntMetadata() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertNil(read.albumID)
        XCTAssertNil(read.appleStoreCountryID)
        XCTAssertNil(read.artistID)
        XCTAssertEqual(read.bpm, 99)
        XCTAssertNil(read.composerID)
        XCTAssertNil(read.conductorID)
        XCTAssertEqual(read.genreID.id3Genre, GenreID3.Blues)
        XCTAssertNil(read.genreID.mp4Genre)
        XCTAssertEqual(read.length, 9767)
        XCTAssertEqual(read.movementCount, 6)
        XCTAssertEqual(read.movementNumber, 5)
        XCTAssertNil(read.playlistID)
        XCTAssertNil(read.tvEpisodeNumber)
        XCTAssertNil(read.tvSeason)
        
        var write = try AudioFile(location: mp3NoMeta)
        write.albumID = 654321
        write.appleStoreCountryID = 765432
        write.artistID = 876543
        write.bpm = 98
        write.composerID = 987654
        write.conductorID = 543210
        write.genreID.id3Genre = .Audiobook
        write.movementCount = 6
        write.movementNumber = 5
        write.playlistID = 109876
        write.tvEpisodeNumber = 5
        write.tvSeason = 4
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-Int.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Int", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.albumID, 654321)
        XCTAssertEqual(newFile.appleStoreCountryID, 765432)
        XCTAssertEqual(newFile.artistID, 876543)
        XCTAssertEqual(newFile.bpm, 98)
        XCTAssertEqual(newFile.composerID, 987654)
        XCTAssertEqual(newFile.conductorID, 543210)
        XCTAssertEqual(newFile.genreID.id3Genre, .Audiobook)
        XCTAssertNil(newFile.genreID.mp4Genre)
        XCTAssertEqual(newFile.movementCount, 6)
        XCTAssertEqual(newFile.movementNumber, 5)
        XCTAssertEqual(newFile.playlistID, 109876)
        XCTAssertEqual(newFile.tvEpisodeNumber, 5)
        XCTAssertEqual(newFile.tvSeason, 4)
    }
    
    func testRemoveMp4IntMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.albumID, 123456)
        XCTAssertEqual(read.appleStoreCountryID, 678901)
        XCTAssertEqual(read.artistID, 234567)
        XCTAssertEqual(read.bpm, 99)
        XCTAssertEqual(read.composerID, 345678)
        XCTAssertEqual(read.conductorID, 456789)
        XCTAssertEqual(read.genreID.mp4Genre, .audiobooks)
        XCTAssertEqual(read.length, 5016)
        XCTAssertEqual(read.movementCount, 9)
        XCTAssertEqual(read.movementNumber, 8)
        XCTAssertEqual(read.playlistID, 567890)
        XCTAssertEqual(read.tvEpisodeNumber, 7)
        XCTAssertEqual(read.tvSeason, 6)
        
        var write = try AudioFile(location: mp4Meta)
        write.albumID = nil
        write.appleStoreCountryID = nil
        write.artistID = nil
        write.bpm = nil
        write.composerID = nil
        write.conductorID = nil
        write.genreID.mp4Genre = nil
        write.movementCount = nil
        write.movementNumber = nil
        write.playlistID = nil
        write.tvEpisodeNumber = nil
        write.tvSeason = nil
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-IntRemoval.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Int-Removal", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.albumID)
        XCTAssertNil(newFile.appleStoreCountryID)
        XCTAssertNil(newFile.artistID)
        XCTAssertNil(newFile.bpm)
        XCTAssertNil(newFile.composerID)
        XCTAssertNil(newFile.conductorID)
        XCTAssertNil(newFile.genreID.id3Genre)
        XCTAssertNil(newFile.genreID.mp4Genre)
        XCTAssertNil(newFile.movementCount)
        XCTAssertNil(newFile.movementNumber)
        XCTAssertNil(newFile.playlistID)
        XCTAssertNil(newFile.tvEpisodeNumber)
        XCTAssertNil(newFile.tvSeason)
    }
    
    func testRemoveId3IntMetadata() throws {
        let read = try AudioFile(location: mp3v24)
        XCTAssertNil(read.albumID)
        XCTAssertNil(read.appleStoreCountryID)
        XCTAssertNil(read.artistID)
        XCTAssertEqual(read.bpm, 99)
        XCTAssertNil(read.composerID)
        XCTAssertNil(read.conductorID)
        XCTAssertEqual(read.genreID.id3Genre, .Blues)
        XCTAssertEqual(read.length, 9767)
        XCTAssertEqual(read.movementCount, 6)
        XCTAssertEqual(read.movementNumber, 5)
        XCTAssertNil(read.playlistID)
        XCTAssertNil(read.tvEpisodeNumber)
        XCTAssertNil(read.tvSeason)
        
        var write = try AudioFile(location: mp3v24)
        write.albumID = nil
        write.appleStoreCountryID = nil
        write.artistID = nil
        write.bpm = nil
        write.composerID = nil
        write.conductorID = nil
        write.genreID.id3Genre = nil
        write.movementCount = nil
        write.movementNumber = nil
        write.playlistID = nil
        write.tvEpisodeNumber = nil
        write.tvSeason = nil
        
        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-IntRemoval.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Int-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.albumID)
        XCTAssertNil(newFile.appleStoreCountryID)
        XCTAssertNil(newFile.artistID)
        XCTAssertNil(newFile.bpm)
        XCTAssertNil(newFile.composerID)
        XCTAssertNil(newFile.conductorID)
        XCTAssertNil(newFile.genreID.mp4Genre)
        XCTAssertNil(newFile.genreID.id3Genre)
        XCTAssertNil(newFile.movementCount)
        XCTAssertNil(newFile.movementNumber)
        XCTAssertNil(newFile.playlistID)
        XCTAssertNil(newFile.tvEpisodeNumber)
        XCTAssertNil(newFile.tvSeason)
    }
}
