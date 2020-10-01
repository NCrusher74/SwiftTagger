/*
 AudioFile.swift
 SwiftTagger
 
 Copyright ©2020 Nolaine Crusher. All rights reserved.
 
 */

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

/// A type representing an audio file stored locally
@available(OSX 10.13, *)
public struct AudioFile {
    // MARK: - Properties
    var location: URL
    private var _id3Tag: SwiftTaggerID3.Tag?
    private var _mp4Tag: SwiftTaggerMP4.Tag?

    public init(location: URL) throws {
        self.location = location
        switch library {
            case .id3:
                let file = try Mp3File(location: location)
                self._id3Tag = try file.tag()
            case .mp4:
                let file = try Mp4File(location: location)
                self._mp4Tag = try file.tag()
        }
    }
    
    var id3Tag: SwiftTaggerID3.Tag {
        get {
            if let tag = self._id3Tag {
                return tag
            } else {
                /// this should never happen, as there should always be a tag instance if there is a file instance
                fatalError("Cannot access ID3 tag")
            }
        }
        set {
            self._id3Tag = newValue
        }
    }

    var mp4Tag: SwiftTaggerMP4.Tag {
        get {
            if let tag = self._mp4Tag {
                return tag
            } else {
                /// this should never happen, as there should always be a tag instance if there is a file instance
                fatalError("Cannot access MP4 tag")
            }
        }
        set {
            self._mp4Tag = newValue
        }
    }

    var library: Library {
        let fileExtension = location.pathExtension.lowercased()
        if ["mp4", "m4a", "m4b", "aac", "m4r", "m4p", "aax"].contains(fileExtension) {
            return .mp4
        } else if fileExtension == "mp3" {
            return .id3
        } else {
            fatalError("Invalid file type with extension \(fileExtension). Must have valid extension for MP3 or MP4 audio files")
        }
    }
}

enum Library {
    case mp4
    case id3
}
