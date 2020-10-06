//
// AudioFile.swift
// SwiftTagger
//
// Copyright ©2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

/// A type representing an audio file stored locally
@available(OSX 10.13, *)
public struct AudioFile {
    // MARK: - Properties
    var location: URL
    private var _id3Tag: Id3Tag?
    private var _mp4Tag: Mp4Tag?

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
    
    public func write(outputLocation: URL) throws {
        switch library {
            case .id3:
                let file = try Mp3File(location: self.location)
                var tag = self.id3Tag
                try file.write(tag: &tag, version: .v2_4, outputLocation: outputLocation)
            case .mp4:
                let file = try Mp4File(location: self.location)
                let tag = self.mp4Tag
                try file.write(tag: tag, to: outputLocation)
        }
    }
    
    var id3Tag: Id3Tag {
        get {
            if let tag = self._id3Tag {
                return tag
            } else {
                /// this should never happen, as the only time we will be using this accessor is if there is a valid MP3 file, which means there will be a valid tag instance
                fatalError("Cannot access ID3 tag")
            }
        }
        set {
            self._id3Tag = newValue
        }
    }

    var id3Metadata: [FrameKey : Frame ] {
        get {
            return id3Tag.frames
        }
        set {
            id3Tag.frames = newValue
        }
    }
    
    var mp4Tag: Mp4Tag {
        get {
            if let tag = self._mp4Tag {
                return tag
            } else {
                /// this should never happen, as the only time we will be using this accessor is if there is a valid MP4 file, which means there will be a valid tag instance
                fatalError("Cannot access MP4 tag")
            }
        }
        set {
            self._mp4Tag = newValue
        }
    }

    var mp4Metadata: [AtomKey : Atom ] {
        get {
            return mp4Tag.metadataAtoms
        }
        set {
            mp4Tag.metadataAtoms = newValue
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
    case id3
    case mp4
}
