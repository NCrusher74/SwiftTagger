import Foundation

let testDirectory = URL(fileURLWithPath: #file)

let mp4NoMeta = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp4-nometa")
    .appendingPathExtension("m4a")

let mp3NoMeta = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp3-nometa")
    .appendingPathExtension("mp3")

let mp4Meta = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp4-meta")
    .appendingPathExtension("m4a")

let mp3v22 = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp3-v22")
    .appendingPathExtension("mp3")

let mp3v23 = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp3-v23")
    .appendingPathExtension("mp3")

let mp3v24 = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp3-v24")
    .appendingPathExtension("mp3")

let mp4Chaptered = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp4-chaptered")
    .appendingPathExtension("m4a")

let mp3Chaptered = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("mp3-chaptered")
    .appendingPathExtension("mp3")

let sampleCover = testDirectory
    .deletingLastPathComponent()
    .appendingPathComponent("samplecover-green")
    .appendingPathExtension("jpg")

@available(OSX 10.12, *)
func localDirectory(fileName: String, fileExtension: String) throws -> URL {
    let home = FileManager.default.homeDirectoryForCurrentUser
    let desktopPath = "Desktop/TestOutput"
    let directory = home.appendingPathComponent(
        desktopPath, isDirectory: true)
    return directory.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
}

@available(OSX 10.12, *)
func tempDirectory() throws -> URL {
    let tempDirectory = FileManager.default.temporaryDirectory
        .appendingPathComponent("SwiftParserTemp",
                                isDirectory: true)
    try FileManager.default.createDirectory(
        at: tempDirectory,
        withIntermediateDirectories: true)
    return tempDirectory
}

@available(OSX 10.12, *)
func emptyDirectory() throws {
    try FileManager.default.removeItem(at: tempDirectory())
}
