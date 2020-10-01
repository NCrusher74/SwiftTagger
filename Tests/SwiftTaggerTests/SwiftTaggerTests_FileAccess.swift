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
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp3.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleCover.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp3NoMeta.path))
        XCTAssertTrue(fileManager.fileExists(atPath: sampleMp4NoMeta.path))
        XCTAssertNoThrow(try AudioFile(location: sampleMp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: sampleMp3NoMeta))
        XCTAssertNoThrow(try AudioFile(location: sampleMp3))
        XCTAssertNoThrow(try AudioFile(location: sampleMp4NoMeta).mp4Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3NoMeta).id3Tag)
        XCTAssertNoThrow(try AudioFile(location: sampleMp3).id3Tag)
        let mp4File = try AudioFile(location: sampleMp4NoMeta)
        let mp4TagNoMeta = mp4File.mp4Tag
        XCTAssertTrue(mp4TagNoMeta.metadataAtoms.isEmpty)
        
        let mp3File = try AudioFile(location: sampleMp3NoMeta)
        let id3TagNoMeta = mp3File.id3Tag
            XCTAssertTrue(id3TagNoMeta.frames.isEmpty)

        let mp3FileMeta = try AudioFile(location: sampleMp3)
        let id3Tag = mp3FileMeta.id3Tag
            XCTAssertFalse(id3Tag.frames.isEmpty)
            XCTAssertFalse(id3Tag.chapterList.isEmpty)

        let mp4FileMeta = try AudioFile(location: sampleMp4)
        let mp4Tag = mp4FileMeta.mp4Tag
            XCTAssertFalse(mp4Tag.metadataAtoms.isEmpty)
            XCTAssertFalse(mp4Tag.chapterList.isEmpty)
    }
}
