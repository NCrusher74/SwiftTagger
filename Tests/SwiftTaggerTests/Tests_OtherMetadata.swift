import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_OtherMetadata: XCTestCase {
    func testcoverArtMp4() throws {
        var read = try AudioFile(location: mp4Meta)
        XCTAssertNotNil(read.coverArt)
        
        try read.removeCoverArt()

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-RemoveCover.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-removecover", fileExtension: "m4a")
        try read.write(outputLocation: outputUrl)
        
        var newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.coverArt)
        
        let url = sampleCover
        try newFile.setCoverArt(from: url)
        
        let outputUrl2 = try tempDirectory().appendingPathComponent("testMp4-SetCover.m4a")
//        let outputUrl2 = try localDirectory(fileName: "testMp4-setcover", fileExtension: "m4a")
        try newFile.write(outputLocation: outputUrl2)
        
        let newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertNotNil(newFile2.coverArt)
    }
    
    func testcoverArtID3() throws {
        var read = try AudioFile(location: mp3Chaptered)
        XCTAssertNotNil(read.coverArt)
        
        try read.removeCoverArt()

        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-RemoveCover.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-removecover", fileExtension: "mp3")
        try read.write(outputLocation: outputUrl)
        
        var newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.coverArt)

        let url = sampleCover
        try newFile.setCoverArt(from: url)
        
        let outputUrl2 = try tempDirectory().appendingPathComponent("testMp3-SetCover.mp3")
//        let outputUrl2 = try localDirectory(fileName: "testMp3-setcover", fileExtension: "mp3")
        try newFile.write(outputLocation: outputUrl2)
        
        let newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertNotNil(newFile2.coverArt)
    }
    
    func testOtherMetadata() throws {
        var write = try AudioFile(location: mp4NoMeta)
        write.contentRating.rating = .us_Movie_Unrated
        write.contentRating.ratingNotes = "Notation"
        write.rating = .clean
        write.keySignature = .aFlatMajor
        write.language.mp4Language = .englishUnitedStates
        write.mediaKind = .audiobook
        write.predefinedGenre.mp4Genre = .appStore

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-Other.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Other", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.rating, .clean)
        XCTAssertEqual(output.contentRating.rating, .us_Movie_Unrated)
        XCTAssertEqual(output.contentRating.ratingNotes, "Notation")
        XCTAssertEqual(output.keySignature, .aFlatMajor)
        XCTAssertEqual(output.language.mp4Language, .englishUnitedStates)
        XCTAssertEqual(output.mediaKind, .audiobook)
        XCTAssertEqual(output.predefinedGenre.mp4Genre, .appStore)
    }

    func testContentRatingAndAdvisoryID3() throws {
        var write = try AudioFile(location: mp3NoMeta)
        write.contentRating.rating = .us_Movie_Unrated
        write.contentRating.ratingNotes = "Notation"
        write.rating = .clean
        write.keySignature = .aFlatMajor
        write.language.id3Languages = [.eng, .und]
        write.mediaKind = .audiobook
        write.predefinedGenre.id3Genre = .Abstract

        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-Other.mp3")
//        let outputUrl = try localDirectory(fileName: "testMP3-ratings", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.rating, .clean)
        XCTAssertEqual(output.contentRating.rating, .us_Movie_Unrated)
        XCTAssertEqual(output.contentRating.ratingNotes, "Notation")
        XCTAssertEqual(output.keySignature, .aFlatMajor)
        XCTAssertEqual(output.language.id3Languages, [.eng, .und])
        XCTAssertEqual(output.mediaKind, .audiobook)
        XCTAssertEqual(output.predefinedGenre.id3Genre, .Abstract)
    }

    
}
