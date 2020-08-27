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
struct AudioFile {
    public init(location: URL) throws {
        self.location = location

        let validMp4Extensions = ["mp4", "m4a", "m4b", "aac", "m4r", "m4p", "aax"]
        if self.location.pathExtension.lowercased() == "mp3" {
            self.library = .id3
        } else if validMp4Extensions.contains(
            self.location.pathExtension.lowercased()) {
            self.library = .mp4
        } else {
            throw AudioFile.Error.InvalidAudioFile
        }
        
        if self.library == .id3 {
            self.mp3 = try Mp3File(location: location)
            if let mp3 = self.mp3 {
                id3Tag = try SwiftTaggerID3.Tag(readFrom: mp3)
            }
        } else {
            self.mp4 = try Mp4File(location: location)
            if let mp4 = self.mp4 {
                mp4Tag = try SwiftTaggerMP4.Tag(from: mp4)
            }
        }
    }
    
    // MARK: - Write
    /// Writes the media with edited metdata to a new file at the specified location
    public func write(outputLocation: URL) throws {
        switch library {
            case .mp4:
                if let mp4 = self.mp4 {
                    try mp4.write(tag: self.mp4Tag, outputLocation: outputLocation)
            }
            case .id3:
                if let mp3 = self.mp3 {
                    try mp3.write(tagVersion: .v2_4, using: self.id3Tag, writingTo: outputLocation)
            }
        }
    }
    
    // MARK: - Properties
    var location: URL
    var library: Library
    
    private var mp4: SwiftTaggerMP4.Mp4File? = nil
    private var _mp4Tag: SwiftTaggerMP4.Tag? = nil
    var mp4Tag: SwiftTaggerMP4.Tag {
        get {
            do {
                return try self._mp4Tag ?? SwiftTaggerMP4.Tag(from: self.mp4 ?? Mp4File(location: self.location))
            } catch {
                fatalError("SwiftTaggerMP4.Tag is not accessible")
            }
        }
        set {
            self._mp4Tag = newValue
        }
    }

    private var mp3: SwiftTaggerID3.Mp3File? = nil
    private var _id3Tag: SwiftTaggerID3.Tag? = nil
    var id3Tag: SwiftTaggerID3.Tag {
        get {
            do {
                return try self._id3Tag ?? SwiftTaggerID3.Tag(readFrom: self.mp3 ?? Mp3File(location: self.location))
            } catch {
                fatalError("SwiftTaggerID3.Tag is not accessible")
            }
        }
        set {
            self._id3Tag = newValue
        }
    }
}

enum Library {
    case mp4
    case id3
}
