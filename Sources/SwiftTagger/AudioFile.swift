//
// AudioFile.swift
// SwiftTagger
//
// Copyright ©2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4
import UniformTypeIdentifiers

/// A type representing an audio file stored locally
@available(OSX 11.0, iOS 14.0, *)
public struct AudioFile {
    // MARK: - Properties
    var location: URL
    private var _id3Tag: SwiftTaggerID3.Tag?
    private var _mp4Tag: SwiftTaggerMP4.Tag?
    public var fileType: UTType

    public init(location: URL) throws {
        self.location = location
        let initializedLibrary: Library
        if let type = UTType(filenameExtension: location.pathExtension) {
            let library = try Library(fileType: type)
            initializedLibrary = library
        } else {
            throw AudioFileError.CannotInitializeFileType
        }
        
        switch initializedLibrary {
            case .id3:
                let file = try Mp3File(location: location)
                self.fileType = file.fileType
                self._id3Tag = try file.tag()
            case .mp4:
                let file = try Mp4File(location: location)
                self.fileType = file.fileType
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
    
    var id3Tag: SwiftTaggerID3.Tag {
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
    
    var mp4Tag: SwiftTaggerMP4.Tag {
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
    
    public var library: Library {
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

@available(OSX 11.0, iOS 14.0, *)
public enum Library {
    case id3
    case mp4
    
    init(fileType: UTType) throws {
        if fileType == .mp3 {
            self = .id3
        } else {
            let recognizedTypes: [UTType] = [
                .appleProtectedMPEG4Audio,
                .mpeg4Audio,
                .appleProtectedMPEG4Video,
                .mpeg4Movie,
                UTType(importedAs: "com.apple.m4a-audio"),
                UTType(importedAs: "com.apple.protected-mpeg-4-audio-b"),
                UTType(importedAs: "com.audible.aax-audiobook")
            ]
            if recognizedTypes.contains(fileType) {
                self = .mp4
            } else {
                throw AudioFileError.InvalidFileType
            }
        }
    }
}
