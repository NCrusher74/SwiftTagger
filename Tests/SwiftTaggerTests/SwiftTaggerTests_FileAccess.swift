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
        XCTAssertNoThrow(try AudioFile(location: sampleM4a).mp4Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleM4b).mp4Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp4NoMeta).mp4Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3NoMeta).id3Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3Chaptered).id3Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3V24).id3Tag)
        XCTAssertTrue(try AudioFile(location: sampleMp4NoMeta).mp4Tag.metadataAtoms.isEmpty)
        XCTAssertTrue(try AudioFile(location: sampleMp3NoMeta).id3Tag.frames.isEmpty)
        XCTAssertTrue(try AudioFile(location: sampleM4a).mp4Tag.metadataAtoms.isEmpty)
        XCTAssertTrue(try !AudioFile(location: sampleM4a).mp4Tag.listChapters().isEmpty)
        XCTAssertTrue(try !AudioFile(location: sampleM4b).mp4Tag.metadataAtoms.isEmpty)
        XCTAssertTrue(try !AudioFile(location: sampleMp3Chaptered).id3Tag.frames.isEmpty)
        XCTAssertTrue(try !AudioFile(location: sampleMp3V24).id3Tag.frames.isEmpty)
    }
}
