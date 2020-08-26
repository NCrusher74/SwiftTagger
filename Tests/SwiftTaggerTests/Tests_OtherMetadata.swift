import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_OtherMetadata: XCTestCase {
    func testGetCoverArtMp4() throws {
        var read = try AudioFile(location: mp4Meta)
        XCTAssertNotNil(try read.getCoverArt())
        
        try read.removeCoverArt()
        let outputUrl = try localDirectory(fileName: "testMp4-removecover", fileExtension: "m4a")
        try read.write(outputLocation: outputUrl)
        
        var newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(try newFile.getCoverArt())
        
        let url = sampleCover
        try newFile.setCoverArt(from: url)
        
        let outputUrl2 = try localDirectory(fileName: "testMp4-setcover", fileExtension: "m4a")
        try newFile.write(outputLocation: outputUrl2)
        
        let newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertNotNil(try newFile2.getCoverArt())
    }
    
    func testGetCoverArtID3() throws {
        var read = try AudioFile(location: mp3Chaptered)
        XCTAssertNotNil(try read.getCoverArt())
        
        try read.removeCoverArt()
        let outputUrl = try localDirectory(fileName: "testMp3-removecover", fileExtension: "mp3")
        try read.write(outputLocation: outputUrl)
        
        var newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(try newFile.getCoverArt())

        let url = sampleCover
        try newFile.setCoverArt(from: url)
        
        let outputUrl2 = try localDirectory(fileName: "testMp3-setcover", fileExtension: "mp3")
        try newFile.write(outputLocation: outputUrl2)
        
        let newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertNotNil(try newFile2.getCoverArt())
    }
    
    func testContentRatingAndAdvisoryMp4() throws {
        var write = try AudioFile(location: mp4NoMeta)
        write.contentAdvisory.rating = .us_Movie_Unrated
        write.contentAdvisory.ratingNotes = "Notation"
        write.contentRating = .clean
        write.keySignature = .aFlatMajor
        write.language.mp4Language = .English_United_States
        write.contentType = .audiobook
        write.predefinedGenre.mp4Genre = .appStore

        let outputUrl = try localDirectory(fileName: "testMp4-ratings", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.contentRating, .clean)
        XCTAssertEqual(output.contentAdvisory.rating, .us_Movie_Unrated)
        XCTAssertEqual(output.contentAdvisory.ratingNotes, "Notation")
        XCTAssertEqual(output.keySignature, .aFlatMajor)
        XCTAssertEqual(output.language.mp4Language, .English_United_States)
        XCTAssertEqual(output.contentType, .audiobook)
        XCTAssertEqual(output.predefinedGenre.mp4Genre, .appStore)
    }

    func testContentRatingAndAdvisoryID3() throws {
        var write = try AudioFile(location: mp3NoMeta)
        write.contentAdvisory.rating = .us_Movie_Unrated
        write.contentAdvisory.ratingNotes = "Notation"
        write.contentRating = .clean
        write.keySignature = .aFlatMajor
        write.language.id3Languages = [.eng, .und]
        write.contentType = .audiobook
        write.predefinedGenre.id3Genre = .Abstract

        let outputUrl = try localDirectory(fileName: "testMP3-ratings", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.contentRating, .clean)
        XCTAssertEqual(output.contentAdvisory.rating, .us_Movie_Unrated)
        XCTAssertEqual(output.contentAdvisory.ratingNotes, "Notation")
        XCTAssertEqual(output.keySignature, .aFlatMajor)
        XCTAssertEqual(output.language.id3Languages, [.eng, .und])
        XCTAssertEqual(output.contentType, .audiobook)
        XCTAssertEqual(output.predefinedGenre.id3Genre, .Abstract)
    }

    
}
