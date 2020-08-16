//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/15/20.
//
import SwiftTaggerID3
import SwiftTaggerMP4
import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    
    public var listMetadata: [(metadataID: Metadata, value: Any)] {
        var entries = [(Metadata, Any)]()
        do {
            if self.library == .SwiftTaggerMP4 {
                let mp4File = try Mp4File(location: self.location)
                let tag = try SwiftTaggerMP4.Tag(from: mp4File)
                for item in tag.metadata {
                    if let id = Metadata(from: item.identifier) {
                        let value = item.value
                        let entry = (id, value)
                        entries.append(entry)
                    }
                }
            } else {
                let mp3File = try Mp3File(location: self.location)
                let tag = try SwiftTaggerID3.Tag(readFrom: mp3File)
                if let acknowledgment = tag.acknowledgment {
                    
                }
            }
        } catch {
            print("Unable to access metadata from source file")
        }
        return entries
    }
}
