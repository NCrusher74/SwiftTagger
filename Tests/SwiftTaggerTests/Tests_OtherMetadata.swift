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
    
}
