//
//  SwiftTaggerTests_FileAccess.swift
//  
//
//  Created by Nolaine Crusher on 9/28/20.
//

import XCTest
@testable import SwiftTagger
import SwiftTaggerID3
import SwiftTaggerMP4

final class SwiftTaggerTests_FileAccess: XCTestCase {
    
    func testFileAccess() throws {
        let fileManager = FileManager.default
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp3V24.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleM4b.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleM4a.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleCover.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp3Chaptered.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp3NoMeta.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp4NoMeta.path))
        XCTAssertNoThrow(try AudioFile(location: sampleM4a))
        XCTAssertNoThrow(try AudioFile(location: sampleM4b))
        XCTAssertThrowsError(try AudioFile(location: sampleCover))
        XCTAssertNoThrow(try AudioFile(location: sampleMp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: sampleMp3NoMeta))
        XCTAssertNoThrow(try AudioFile(location: sampleMp3Chaptered))
        XCTAssertNoThrow(try AudioFile(location: sampleMp3V24))
        XCTAssertNoThrow(try AudioFile(location: sampleM4a).tag)
        XCTAssertNoThrow(try AudioFile(location: sampleM4b).tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp4NoMeta).tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3NoMeta).tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3Chaptered).tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3V24).tag)
//        print(try AudioFile(location: sampleM4a).tag)
//        print(try AudioFile(location: sampleM4b).tag)
//        print(try AudioFile(location: sampleMp3V24).tag)
    }
}
