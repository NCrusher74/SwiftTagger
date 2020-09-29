//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation
import SwiftTaggerMP4
import SwiftTaggerID3
let testMediaDirectory = URL(fileURLWithPath: #file).deletingLastPathComponent()

let sampleM4b: URL = {
    return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/TestMedia/SampleBook.m4b")
}()

//let sampleM4b: URL =
//    testMediaDirectory
//    .appendingPathComponent("SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/SampleBook")
//    .appendingPathExtension("m4b")
//

let sampleM4a: URL = {
   return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/TestMedia/mp4_chaptered.m4a")
}()

//let sampleM4a: URL =
//    testMediaDirectory
//    .appendingPathComponent("SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/mp4_chaptered")
//    .appendingPathExtension("m4a")
//

let sampleMp4NoMeta: URL = {
  return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/TestMedia/mp4_nometa.m4a")
}()

//let sampleMp4NoMeta: URL =
//    testMediaDirectory
//    .appendingPathComponent("SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/mp4_nometa")
//    .appendingPathExtension("m4a")
//

let sampleCover: URL = {
    return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerMP4/Tests/SwiftTaggerMP4Tests/TestMedia/samplecover-green.jpg")
}()

//let sampleCover: URL =
//    testMediaDirectory
//    .appendingPathComponent("SwiftTaggerID3/Tests/SwiftTaggerID3Tests/samplecover-green")
//    .appendingPathExtension("jpg")
//

let sampleMp3V24: URL = {
    return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerID3/Tests/SwiftTaggerID3Tests/TestMedia/mp3-v24-with-meta.mp3")
}()

//public let sampleMp3V24 = testMediaDirectory
//    .appendingPathComponent("SwiftTaggerID3Tests/mp3-v24-with-meta")
//    .appendingPathExtension("mp3")
//

let sampleMp3Chaptered: URL = {
    return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerID3/Tests/SwiftTaggerID3Tests/TestMedia/mp3-chapterized.mp3")
}()

//public let sampleMp3Chaptered = testMediaDirectory
//    .appendingPathComponent("SwiftTaggerID3/Tests/SwiftTaggerID3Tests/mp3-chapterized")
//    .appendingPathExtension("mp3")
//

let sampleMp3NoMeta: URL = {
   return URL(fileURLWithPath: "/Users/nolainecrusher/Documents/Git/SwiftTaggerID3/Tests/SwiftTaggerID3Tests/TestMedia/mp3-nometa.mp3")
}()

//public let sampleMp3NoMeta = testMediaDirectory
//    .appendingPathComponent("SwiftTaggerID3/Tests/SwiftTaggerID3Tests/mp3-nometa")
//    .appendingPathExtension("mp3")

func tempOutputDirectory(fileExtension: FileType) -> URL {
    let tempDirectory = FileManager.default.temporaryDirectory
        .appendingPathComponent("SwiftTaggerTemp", isDirectory: true)
    let ext = fileExtension.rawValue
    do {
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true)
        return tempDirectory.appendingPathComponent("test").appendingPathExtension(ext)
    } catch {
        fatalError("Unable to create temporary directory")
    }
}

/// Creates the test file on the desktop in the directory `TestOutput`
func localOutputDirectory(fileName: String, fileExtension: FileType) throws -> URL {
    let home = FileManager.default.homeDirectoryForCurrentUser
    let desktopPath = "Desktop/TestOutput"
    let directory = home.appendingPathComponent(
        desktopPath, isDirectory: true)
    let ext = fileExtension.rawValue
    return directory.appendingPathComponent(fileName).appendingPathExtension(ext)
}

enum FileType: String {
    case mp3
    case m4a
    case m4b
}
