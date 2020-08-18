import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_IntMetadata: XCTestCase {
    
    func testReadWriteMp4IntMetadata() throws {
        var file = try AudioFile(location: mp4Meta)
        XCTAssertEqual(file.albumID, 123456)
        XCTAssertEqual(file.appleStoreCountryID, 678901)
        XCTAssertEqual(file.artistID, 234567)
        XCTAssertEqual(file.bpm, 99)
        XCTAssertEqual(file.composerID, 345678)
        XCTAssertEqual(file.conductorID, 456789)
        XCTAssertEqual(file.genreID, 50000024)
        XCTAssertEqual(file.length, 5016)
        XCTAssertEqual(file.movementCount, 9)
        XCTAssertEqual(file.movementNumber, 8)
        XCTAssertEqual(file.playlistID, 567890)
        XCTAssertEqual(file.tvEpisodeNumber, 7)
        XCTAssertEqual(file.tvSeason, 6)
        
        file.albumID = 654321
        file.appleStoreCountryID = 765432
        file.artistID = 876543
        file.bpm = 98
        file.composerID = 987654
        file.conductorID = 098765
        file.setMp4GenreID(genre: .audiobooks)
        file.movementCount = 6
        file.movementNumber = 5
        file.playlistID = 109876
        file.tvEpisodeNumber = 5
        file.tvSeason = 4

        let mp4Output = try localDirectory(fileName: "testMp4-Int", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertEqual(newFile.albumID, 654321)
        XCTAssertEqual(newFile.appleStoreCountryID, 765432)
        XCTAssertEqual(newFile.artistID, 876543)
        XCTAssertEqual(newFile.bpm, 98)
        XCTAssertEqual(newFile.composerID, 987654)
        XCTAssertEqual(newFile.conductorID, 098765)
        XCTAssertEqual(newFile.genreID, 50000024)
        XCTAssertEqual(newFile.movementCount, 6)
        XCTAssertEqual(newFile.movementNumber, 5)
        XCTAssertEqual(newFile.playlistID, 109876)
        XCTAssertEqual(newFile.tvEpisodeNumber, 5)
        XCTAssertEqual(newFile.tvSeason, 4)
    }
    
    func testReadWriteId3IntMetadata() throws {
        var file = try AudioFile(location: mp3v24)
        XCTAssertNil(file.albumID)
        XCTAssertNil(file.appleStoreCountryID)
        XCTAssertNil(file.artistID)
        XCTAssertEqual(file.bpm, 99)
        XCTAssertNil(file.composerID)
        XCTAssertNil(file.conductorID)
        XCTAssertEqual(file.genreID, 0)
        XCTAssertEqual(file.length, 9767)
        XCTAssertEqual(file.movementCount, 6)
        XCTAssertEqual(file.movementNumber, 5)
        XCTAssertNil(file.playlistID)
        XCTAssertNil(file.tvEpisodeNumber)
        XCTAssertNil(file.tvSeason)
        
        file.albumID = 654321
        file.appleStoreCountryID = 765432
        file.artistID = 876543
        file.bpm = 98
        file.composerID = 987654
        file.conductorID = 098765
        file.setID3GenreID(genre: .Audiobook)
        file.movementCount = 6
        file.movementNumber = 5
        file.playlistID = 109876
        file.tvEpisodeNumber = 5
        file.tvSeason = 4
        
        let mp3Output = try localDirectory(fileName: "testMp3-Int", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertEqual(newFile.albumID, 654321)
        XCTAssertEqual(newFile.appleStoreCountryID, 765432)
        XCTAssertEqual(newFile.artistID, 876543)
        XCTAssertEqual(newFile.bpm, 98)
        XCTAssertEqual(newFile.composerID, 987654)
        XCTAssertEqual(newFile.conductorID, 098765)
        XCTAssertEqual(newFile.genreID, 183)
        XCTAssertEqual(newFile.movementCount, 6)
        XCTAssertEqual(newFile.movementNumber, 5)
        XCTAssertEqual(newFile.playlistID, 109876)
        XCTAssertEqual(newFile.tvEpisodeNumber, 5)
        XCTAssertEqual(newFile.tvSeason, 4)
    }
    
    func testRemoveMp4IntMetadata() throws {
        var file = try AudioFile(location: mp4Meta)
        XCTAssertEqual(file.albumID, 123456)
        XCTAssertEqual(file.appleStoreCountryID, 678901)
        XCTAssertEqual(file.artistID, 234567)
        XCTAssertEqual(file.bpm, 99)
        XCTAssertEqual(file.composerID, 345678)
        XCTAssertEqual(file.conductorID, 456789)
        XCTAssertEqual(file.genreID, 50000024)
        XCTAssertEqual(file.length, 5016)
        XCTAssertEqual(file.movementCount, 9)
        XCTAssertEqual(file.movementNumber, 8)
        XCTAssertEqual(file.playlistID, 567890)
        XCTAssertEqual(file.tvEpisodeNumber, 7)
        XCTAssertEqual(file.tvSeason, 6)
        
        file.albumID = nil
        file.appleStoreCountryID = nil
        file.artistID = nil
        file.bpm = nil
        file.composerID = nil
        file.conductorID = nil
        file.genreID = nil
        file.movementCount = nil
        file.movementNumber = nil
        file.playlistID = nil
        file.tvEpisodeNumber = nil
        file.tvSeason = nil
        
        let mp4Output = try localDirectory(fileName: "testMp4-Int", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertNil(newFile.albumID)
        XCTAssertNil(newFile.appleStoreCountryID)
        XCTAssertNil(newFile.artistID)
        XCTAssertNil(newFile.bpm)
        XCTAssertNil(newFile.composerID)
        XCTAssertNil(newFile.conductorID)
        XCTAssertNil(newFile.genreID)
        XCTAssertNil(newFile.movementCount)
        XCTAssertNil(newFile.movementNumber)
        XCTAssertNil(newFile.playlistID)
        XCTAssertNil(newFile.tvEpisodeNumber)
        XCTAssertNil(newFile.tvSeason)
    }
    
    func testRemoveId3IntMetadata() throws {
        var file = try AudioFile(location: mp3v24)
        XCTAssertNil(file.albumID)
        XCTAssertNil(file.appleStoreCountryID)
        XCTAssertNil(file.artistID)
        XCTAssertEqual(file.bpm, 99)
        XCTAssertNil(file.composerID)
        XCTAssertNil(file.conductorID)
        XCTAssertEqual(file.genreID, 0)
        XCTAssertEqual(file.length, 9767)
        XCTAssertEqual(file.movementCount, 6)
        XCTAssertEqual(file.movementNumber, 5)
        XCTAssertNil(file.playlistID)
        XCTAssertNil(file.tvEpisodeNumber)
        XCTAssertNil(file.tvSeason)
        
        file.albumID = nil
        file.appleStoreCountryID = nil
        file.artistID = nil
        file.bpm = nil
        file.composerID = nil
        file.conductorID = nil
        file.setID3GenreID(genre: nil)
        file.movementCount = nil
        file.movementNumber = nil
        file.playlistID = nil
        file.tvEpisodeNumber = nil
        file.tvSeason = nil
        
        let mp3Output = try localDirectory(fileName: "testMp3-Int", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertNil(newFile.albumID)
        XCTAssertNil(newFile.appleStoreCountryID)
        XCTAssertNil(newFile.artistID)
        XCTAssertNil(newFile.bpm)
        XCTAssertNil(newFile.composerID)
        XCTAssertNil(newFile.conductorID)
        XCTAssertNil(newFile.genreID)
        XCTAssertNil(newFile.movementCount)
        XCTAssertNil(newFile.movementNumber)
        XCTAssertNil(newFile.playlistID)
        XCTAssertNil(newFile.tvEpisodeNumber)
        XCTAssertNil(newFile.tvSeason)
    }
}
