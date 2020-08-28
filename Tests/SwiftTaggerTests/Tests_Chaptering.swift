//
//  Tests_Chaptering.swift
//  
//
//  Created by Nolaine Crusher on 8/26/20.
//

import XCTest
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_Chaptering: XCTestCase {
    func testMp4ChapterList() throws {
        let source = try AudioFile(location: mp4Chaptered)
        
        XCTAssertEqual(source.chapterList[0].startTime, 0)
        XCTAssertEqual(source.chapterList[0].title, "Chapter 1")
        XCTAssertEqual(source.chapterList[1].startTime, 600)
        XCTAssertEqual(source.chapterList[1].title, "Chapter 2")
        XCTAssertEqual(source.chapterList[2].startTime, 1300)
        XCTAssertEqual(source.chapterList[2].title, "Chapter 3")
        XCTAssertEqual(source.chapterList[3].startTime, 2100)
        XCTAssertEqual(source.chapterList[3].title, "Chapter 4")
        XCTAssertEqual(source.chapterList[4].startTime, 3300)
        XCTAssertEqual(source.chapterList[4].title, "Chapter 5")
        XCTAssertEqual(source.chapterList[5].startTime, 4600)
        XCTAssertEqual(source.chapterList[5].title, "Chapter 6")
    }
    
    func testID3ChapterList() throws {
        let source = try AudioFile(location: mp3Chaptered)

        XCTAssertEqual(source.chapterList[0].startTime, 0)
        XCTAssertEqual(source.chapterList[0].title, "Chapter 01")
        XCTAssertEqual(source.chapterList[1].startTime, 2795)
        XCTAssertEqual(source.chapterList[1].title, "Chapter 02")
    }
    
    func testRemovalAllChaptersMp4() throws {
        var source = try AudioFile(location: mp4Chaptered)
        try source.removeAllChapters()
        
        let outputUrl = try localDirectory(fileName: "testMp4-chapterRemoveAll", fileExtension: "m4a")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertTrue(output.chapterList.isEmpty)
    }
    
    func testRemovalAllChaptersID3() throws {
        var source = try AudioFile(location: mp3Chaptered)
        try source.removeAllChapters()
        
        let outputUrl = try localDirectory(fileName: "testMp3-chapterRemoveAll", fileExtension: "mp3")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertTrue(output.chapterList.isEmpty)
    }

    func testRemoveSingleMP4() throws {
        var source = try AudioFile(location: mp4Chaptered)
        source.removeChapter(at: 1300)
        
        let outputUrl = try localDirectory(fileName: "testMp4-chapterRemoveSingle", fileExtension: "m4a")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.chapterList.count, 5)
        XCTAssertEqual(output.chapterList[0].startTime, 0)
        XCTAssertEqual(output.chapterList[0].title, "Chapter 1")
        XCTAssertEqual(output.chapterList[1].startTime, 600)
        XCTAssertEqual(output.chapterList[1].title, "Chapter 2")
        XCTAssertEqual(output.chapterList[2].startTime, 2100)
        XCTAssertEqual(output.chapterList[2].title, "Chapter 4")
        XCTAssertEqual(output.chapterList[3].startTime, 3300)
        XCTAssertEqual(output.chapterList[3].title, "Chapter 5")
        XCTAssertEqual(output.chapterList[4].startTime, 4600)
        XCTAssertEqual(output.chapterList[4].title, "Chapter 6")
    }
    
    func testRemoveSingleID3() throws {
        var source = try AudioFile(location: mp3Chaptered)
        source.removeChapter(at: 2795)
        
        let outputUrl = try localDirectory(fileName: "testMp3-chapterRemoveSingle", fileExtension: "mp3")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.chapterList.count, 1)
        XCTAssertEqual(output.chapterList[0].startTime, 0)
        XCTAssertEqual(output.chapterList[0].title, "Chapter 01")
    }

    func testAddSingleMP4() throws {
        var source = try AudioFile(location: mp4Chaptered)
        source.addChapter(at: 2600, title: "Chapter 4.5")
        
        let outputUrl = try localDirectory(fileName: "testMp4-chapterAddSingle", fileExtension: "m4a")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.chapterList.count, 7)
        XCTAssertEqual(output.chapterList[0].startTime, 0)
        XCTAssertEqual(output.chapterList[0].title, "Chapter 1")
        XCTAssertEqual(output.chapterList[1].startTime, 600)
        XCTAssertEqual(output.chapterList[1].title, "Chapter 2")
        XCTAssertEqual(source.chapterList[2].startTime, 1300)
        XCTAssertEqual(source.chapterList[2].title, "Chapter 3")
        XCTAssertEqual(output.chapterList[3].startTime, 2100)
        XCTAssertEqual(output.chapterList[3].title, "Chapter 4")
        XCTAssertEqual(output.chapterList[4].startTime, 2600)
        XCTAssertEqual(output.chapterList[4].title, "Chapter 4.5")
        XCTAssertEqual(output.chapterList[5].startTime, 3300)
        XCTAssertEqual(output.chapterList[5].title, "Chapter 5")
        XCTAssertEqual(output.chapterList[6].startTime, 4600)
        XCTAssertEqual(output.chapterList[6].title, "Chapter 6")
    }
    
    func testAddSingleID3() throws {
        var source = try AudioFile(location: mp3Chaptered)
        source.addChapter(at: 3800, title: "Chapter 03")
        
        let outputUrl = try localDirectory(fileName: "testMp3-chapterAddSingle", fileExtension: "mp3")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.chapterList.count, 3)
        XCTAssertEqual(source.chapterList[0].startTime, 0)
        XCTAssertEqual(source.chapterList[0].title, "Chapter 01")
        XCTAssertEqual(source.chapterList[1].startTime, 2795)
        XCTAssertEqual(source.chapterList[1].title, "Chapter 02")
        XCTAssertEqual(source.chapterList[2].startTime, 3800)
        XCTAssertEqual(source.chapterList[2].title, "Chapter 03")
    }

    func testAddAllChaptersMp4() throws {
        var source = try AudioFile(location: mp4NoMeta)
        source.addChapter(at: 0, title: "Chapter 01")
        source.addChapter(at: 1000, title: "Chapter 02")
        source.addChapter(at: 2000, title: "Chapter 03")
        source.addChapter(at: 3000, title: "Chapter 04")
        source.addChapter(at: 4000, title: "Chapter 05")

        let outputUrl = try localDirectory(fileName: "testMp4-chapterAddAll", fileExtension: "m4a")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.chapterList.count, 5)
        XCTAssertEqual(output.chapterList[0].startTime, 0)
        XCTAssertEqual(output.chapterList[0].title, "Chapter 01")
        XCTAssertEqual(output.chapterList[1].startTime, 1000)
        XCTAssertEqual(output.chapterList[1].title, "Chapter 02")
        XCTAssertEqual(source.chapterList[2].startTime, 2000)
        XCTAssertEqual(source.chapterList[2].title, "Chapter 03")
        XCTAssertEqual(output.chapterList[3].startTime, 3000)
        XCTAssertEqual(output.chapterList[3].title, "Chapter 04")
        XCTAssertEqual(output.chapterList[4].startTime, 4000)
        XCTAssertEqual(output.chapterList[4].title, "Chapter 05")
    }
    
    func testAddAllChaptersID3() throws {
        var source = try AudioFile(location: mp3NoMeta)
        source.addChapter(at: 0, title: "Chapter 01")
        source.addChapter(at: 1000, title: "Chapter 02")
        source.addChapter(at: 2000, title: "Chapter 03")
        source.addChapter(at: 3000, title: "Chapter 04")
        source.addChapter(at: 4000, title: "Chapter 05")
        
        let outputUrl = try localDirectory(fileName: "testMp3-chapterAddAll", fileExtension: "mp3")
        try source.write(outputLocation: outputUrl)
        
        let output = try AudioFile(location: outputUrl)
        XCTAssertEqual(output.chapterList.count, 5)
        XCTAssertEqual(output.chapterList[0].startTime, 0)
        XCTAssertEqual(output.chapterList[0].title, "Chapter 01")
        XCTAssertEqual(output.chapterList[1].startTime, 1000)
        XCTAssertEqual(output.chapterList[1].title, "Chapter 02")
        XCTAssertEqual(source.chapterList[2].startTime, 2000)
        XCTAssertEqual(source.chapterList[2].title, "Chapter 03")
        XCTAssertEqual(output.chapterList[3].startTime, 3000)
        XCTAssertEqual(output.chapterList[3].title, "Chapter 04")
        XCTAssertEqual(output.chapterList[4].startTime, 4000)
        XCTAssertEqual(output.chapterList[4].title, "Chapter 05")
    }
}
