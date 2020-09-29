//
//  AudioFile.swift
//  
//
//  Created by Nolaine Crusher on 9/28/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

struct AudioFile {
    
    var location: URL
    
    @available(OSX 10.12, *)
    init(location: URL) throws {
        let validExtensions = ["mp4", "m4a", "m4b", "aac", "m4r", "m4p", "aax", "mp3"]
        guard validExtensions.contains(location.pathExtension.lowercased()) else {
            throw AudioFileError.InvalidFileType
        }
        self.location = location
    }
    
    @available(OSX 10.12, *)
    var tag: Tag {
        get {
            if location.pathExtension.lowercased() == "mp3" {
                do {
                    let file = try Mp3File(location: location)
                    let tag = try file.tag()
                    return Tag.id3(tag)
                } catch {
                    fatalError("Unable to initialize MP3 audio file")
                }
            } else {
                let mp4Extensions = ["mp4", "m4a", "m4b", "aac", "m4r", "m4p", "aax"]
                if mp4Extensions.contains(location.pathExtension) {
                    do {
                        let file = try Mp4File(location: location)
                        let tag = try file.tag()
                        return Tag.mp4(tag)
                    } catch {
                        fatalError("Unable to initialize MP4 Tag instance from file")
                    }
                } else {
                    fatalError("Unable to initialize audio file")
                }
            }
        }
    }
}

enum FileType {
    case mp3(Mp3File)
    case mp4(Mp4File)
}

enum Tag {
    case id3(SwiftTaggerID3.Tag)
    case mp4(SwiftTaggerMP4.Tag)
}
