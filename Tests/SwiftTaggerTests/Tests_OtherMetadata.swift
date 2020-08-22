import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_OtherMetadata: XCTestCase {

    func testCreditListsMp4() throws {
        let read = try AudioFile(location: mp4Meta)
        // test read
        XCTAssertEqual(read.performerCreditList[.featuredArtist], ["Artist"])
        XCTAssertEqual(read.performerCreditList[.soloist], ["Soloist"])
        XCTAssertEqual(read.performerCreditList[.narrator], ["Narrator"])
        XCTAssertEqual(read.performerCreditList[.performer], ["Performers"])
        
        var write = try AudioFile(location: mp4NoMeta)
        write.performerCreditList[.featuredArtist] = ["New Artist"]
        write.performerCreditList[.soloist] = ["New Soloist"]
        write.performerCreditList[.narrator] = ["New Narrator"]
        write.performerCreditList[.performer] = ["Performer 1", "Performer 2"]

        let outputUrl = try localDirectory(fileName: "testMp4-Credit", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.performerCreditList[.featuredArtist], ["New Artist"])
        XCTAssertEqual(newFile.performerCreditList[.soloist], ["New Soloist"])
        XCTAssertEqual(newFile.performerCreditList[.narrator], ["New Narrator"])
        XCTAssertEqual(newFile.performerCreditList[.performer], ["Performer 1", "Performer 2"])
    }
    
    func testCreditListID3() throws {
        // test read
        let read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.performerCreditList[.soprano], ["Soprano Name"])
        XCTAssertEqual(read.performerCreditList[.alto], ["Alto Name"])
        
        var write = try AudioFile(location: mp3NoMeta)
        write.performerCreditList[.featuredArtist] = ["New Artist"]
        write.performerCreditList[.soloist] = ["New Soloist"]
        write.performerCreditList[.narrator] = ["New Narrator"]
        write.performerCreditList[.performer] = ["Performer 1", "Performer 2"]

        let outputUrl = try localDirectory(fileName: "testMp3-Credits", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.performerCreditList[.featuredArtist], ["New Artist"])
        XCTAssertEqual(newFile.performerCreditList[.soloist], ["New Soloist"])
        XCTAssertEqual(newFile.performerCreditList[.narrator], ["New Narrator"])
        XCTAssertEqual(newFile.performerCreditList[.performer], ["Performer 1", "Performer 2"])
    }
}
