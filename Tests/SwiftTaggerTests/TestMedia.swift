//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation
let testMediaDirectory = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .appendingPathComponent("TestMedia")

public let sampleMp3 = testMediaDirectory
    .appendingPathComponent("sampleMp3")
    .appendingPathExtension("mp3")

public let sampleMp4 = testMediaDirectory
    .appendingPathComponent("sampleMp4")
    .appendingPathExtension("m4a")

public let sampleMp3NoMeta = testMediaDirectory
    .appendingPathComponent("mp3-nometa")
    .appendingPathExtension("mp3")

public let sampleMp4NoMeta = testMediaDirectory
    .appendingPathComponent("mp4-nometa")
    .appendingPathExtension("m4a")

public let sampleCover = testMediaDirectory
    .appendingPathComponent("samplecover-green")
    .appendingPathExtension("jpg")

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
