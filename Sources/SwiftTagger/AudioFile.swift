/*
 AudioFile.swift
 SwiftTagger
 
 Copyright ©2020 Nolaine Crusher. All rights reserved.
 
 */

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
enum Library {
    case SwiftTaggerMP4(SwiftTaggerMP4.Mp4File)
    case SwiftTaggerID3(SwiftTaggerID3.Mp3File)
    
    init?(from fileUrl: URL) throws {
        let validMp4Extensions = ["mp4", "m4a", "m4b", "aac", "m4r", "m4p", "aax"]
        
        if fileUrl .pathExtension.lowercased() == "mp3" {
            self = .SwiftTaggerID3(try Mp3File(location: fileUrl))
        } else if validMp4Extensions.contains(fileUrl.pathExtension.lowercased()) {
            self = .SwiftTaggerMP4(try Mp4File(location: fileUrl))
        } else {
            throw AudioFile.Error.InvalidAudioFile
        }
    }
}

@available(OSX 10.13, *)
struct AudioFile {
    var location: URL
    var library: Library
    
    public init(location: URL) throws {
        self.location = location
        if let library = try Library(from: location) {
            self.library = library
        } else {
            throw AudioFile.Error.InvalidAudioFile
        }
    }
}
