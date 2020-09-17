import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_Bool_Date_Metadata: XCTestCase {
        
    func testReadWriteMp4DateMetadata() throws {
        let read = try AudioFile(location: mp4Meta)
        var components = DateComponents()
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        components.year = 1995
        components.month = 06
        components.day = 17
        let date = calendar.date(from: components)
        
        XCTAssertNil(read.encodingDate)
        XCTAssertNil(read.originalReleaseDate)
        XCTAssertEqual(read.purchaseDate, date)
        XCTAssertEqual(read.recordingDate, date)
        XCTAssertEqual(read.releaseDate, date)
        XCTAssertNil(read.taggingDate)
        XCTAssertEqual(read.year, 1992)
        
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

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-Date.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Date", fileExtension: "m4a")
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

        let outputUrl = try tempDirectory().appendingPathComponent("testMp43-Date.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Date", fileExtension: "mp3")
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
        components.year = 1995
        components.month = 06
        components.day = 17
        let date = calendar.date(from: components)

        let read = try AudioFile(location: mp4Meta)
        XCTAssertNil(read.encodingDate)
        XCTAssertNil(read.originalReleaseDate)
        XCTAssertEqual(read.purchaseDate, date)
        XCTAssertEqual(read.recordingDate, date)
        XCTAssertEqual(read.releaseDate, date)
        XCTAssertNil(read.taggingDate)
        XCTAssertEqual(read.year, 1992)

        var write = try AudioFile(location: mp4Meta)
        write.encodingDate = nil
        write.originalReleaseDate = nil
        write.purchaseDate = nil
        write.recordingDate = nil
        write.releaseDate = nil
        write.taggingDate = nil

        let outputUrl = try tempDirectory().appendingPathComponent("testMp4-DateRemoval.m4a")
//        let outputUrl = try localDirectory(fileName: "testMp4-Date-Removal", fileExtension: "m4a")
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

        let outputUrl = try tempDirectory().appendingPathComponent("testMp3-DateRemoval.mp3")
//        let outputUrl = try localDirectory(fileName: "testMp3-Date-Removal", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        // a passing test in this case will actually be Date.distantPast, because when there's no frame for the date, SwiftTaggerID3 uses Date.distantPast as a fallback for the date values
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.encodingDate, Date.distantPast)
        XCTAssertEqual(newFile.originalReleaseDate, Date.distantPast)
        XCTAssertNil(newFile.purchaseDate)
        XCTAssertEqual(newFile.recordingDate, Date.distantPast)
        XCTAssertEqual(newFile.releaseDate, Date.distantPast)
        XCTAssertEqual(newFile.taggingDate, Date.distantPast)
    }
}
