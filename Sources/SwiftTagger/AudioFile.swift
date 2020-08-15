/*
 AudioFile.swift
 SwiftTagger
 
 Copyright ©2020 Nolaine Crusher. All rights reserved.
 
 */

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

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
