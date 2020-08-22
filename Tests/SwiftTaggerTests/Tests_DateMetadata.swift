import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_Bool_Date_Metadata: XCTestCase {
        
    func testReadWriteMp4DateMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1979
        components.month = 11
        components.day = 23
        let date = calendar.date(from: components)
        
        XCTAssertEqual(read.encodingDate, date)
        XCTAssertNil(read.originalReleaseDate)
        XCTAssertEqual(read.purchaseDate, date)
        XCTAssertEqual(read.recordingDate, date)
        XCTAssertEqual(read.releaseDate, date)
        XCTAssertEqual(read.taggingDate, date)
        XCTAssertEqual(read.year, 1979)
        
        var newComponents = components
        newComponents.year = 1988
        newComponents.month = 12
        newComponents.day = 15
        newComponents.hour = 11
        newComponents.minute = 47
        let newDate = calendar.date(from: newComponents)

        var write = try AudioFile(location: mp4NoMeta)
        write.encodingDate = newDate
        write.originalReleaseDate = newDate
        write.purchaseDate = newDate
        write.recordingDate = newDate
        write.releaseDate = newDate
        write.taggingDate = newDate
        write.year = newComponents.year

        let outputUrl = try localDirectory(fileName: "testMp4-Date", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)

        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.encodingDate, newDate)
        XCTAssertEqual(newFile.originalReleaseDate, newDate)
        XCTAssertEqual(newFile.purchaseDate, newDate)
        XCTAssertEqual(newFile.recordingDate, newDate)
        XCTAssertEqual(newFile.releaseDate, newDate)
        XCTAssertEqual(newFile.taggingDate, newDate)
        XCTAssertEqual(newFile.year, newComponents.year)
    }
    
    func testReadWriteID3DateMetadata() throws {
        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1979
        components.month = 11
        components.day = 23
        let date = calendar.date(from: components)

        let read = try AudioFile(location: mp3v24)
        XCTAssertNotEqual(read.encodingDate, date)
        XCTAssertNotEqual(read.originalReleaseDate, date)
        XCTAssertNil(read.purchaseDate)
        XCTAssertNotEqual(read.recordingDate, date)
        XCTAssertNotEqual(read.releaseDate, date)
        XCTAssertNotEqual(read.taggingDate, date)
        XCTAssertNil(read.year)

        var newComponents = components
        newComponents.year = 1988
        newComponents.month = 12
        newComponents.day = 15
        newComponents.hour = 11
        newComponents.minute = 47
        let newDate = calendar.date(from: newComponents)

        var write = try AudioFile(location: mp3NoMeta)
        write.encodingDate = newDate
        write.originalReleaseDate = newDate
        write.purchaseDate = newDate
        write.recordingDate = newDate
        write.releaseDate = newDate
        write.taggingDate = newDate

        let outputUrl = try localDirectory(fileName: "testMp3-Date", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.encodingDate, newDate)
        XCTAssertEqual(newFile.originalReleaseDate, newDate)
        XCTAssertEqual(newFile.purchaseDate, newDate)
        XCTAssertEqual(newFile.recordingDate, newDate)
        XCTAssertEqual(newFile.releaseDate, newDate)
        XCTAssertEqual(newFile.taggingDate, newDate)
    }
    
    func testMp4DateMetadataRemoval() throws {
        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1979
        components.month = 11
        components.day = 23
        let date = calendar.date(from: components)

        let read = try AudioFile(location: mp4Meta)
        XCTAssertEqual(read.encodingDate, date)
        XCTAssertNil(read.originalReleaseDate)
        XCTAssertEqual(read.purchaseDate, date)
        XCTAssertEqual(read.recordingDate, date)
        XCTAssertEqual(read.releaseDate, date)
        XCTAssertEqual(read.taggingDate, date)
        XCTAssertEqual(read.year, 1979)

        var write = try AudioFile(location: mp4Meta)
        write.encodingDate = nil
        write.originalReleaseDate = nil
        write.purchaseDate = nil
        write.recordingDate = nil
        write.releaseDate = nil
        write.taggingDate = nil

        let outputUrl = try localDirectory(fileName: "testMp4-Date-Removal", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.encodingDate)
        XCTAssertNil(newFile.originalReleaseDate)
        XCTAssertNil(newFile.purchaseDate)
        XCTAssertNil(newFile.recordingDate)
        XCTAssertNil(newFile.releaseDate)
        XCTAssertNil(newFile.taggingDate)
    }
    
    func testID3DateMetadataRemoval() throws {
        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1979
        components.month = 11
        components.day = 23
        let date = calendar.date(from: components)
        
        let read = try AudioFile(location: mp3v24)
        XCTAssertNotEqual(read.encodingDate, date)
        XCTAssertNotEqual(read.originalReleaseDate, date)
        XCTAssertNil(read.purchaseDate)
        XCTAssertNotEqual(read.recordingDate, date)
        XCTAssertNotEqual(read.releaseDate, date)
        XCTAssertNotEqual(read.taggingDate, date)
        XCTAssertNil(read.year)

        var write = try AudioFile(location: mp3v24)
        write.encodingDate = nil
        write.originalReleaseDate = nil
        write.purchaseDate = nil
        write.recordingDate = nil
        write.releaseDate = nil
        write.taggingDate = nil

        let outputUrl = try localDirectory(fileName: "testMp3-Date-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.encodingDate)
        XCTAssertNil(newFile.originalReleaseDate)
        XCTAssertNil(newFile.purchaseDate)
        XCTAssertNil(newFile.recordingDate)
        XCTAssertNil(newFile.releaseDate)
        XCTAssertNil(newFile.taggingDate)
    }
}
