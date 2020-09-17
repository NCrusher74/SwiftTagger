//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/27/20.
//

import Foundation
@available(OSX 10.13, *)
extension AudioFile {
    /// Returns an array of chapters as (startTime, title) tuples
    public var chapterList: [(startTime: Int, title: String)] {
        switch library {
            case .mp4:
                return mp4Tag.listChapters()
            case .id3:
                return id3Tag.chapterList
        }
    }
    
    /// Adds a chapter at the specified start time (in milliseconds) with the specified title
    public mutating func addChapter(at startTime: Int, title: String) {
        switch library {
            case .mp4:
                mp4Tag.addChapter(startTime: startTime, title: title)
            case .id3:
                id3Tag.addChapter(at: startTime, title: title)
        }
    }
    
    /// Removes an existing chapter at the specified start time
    public mutating func removeChapter(at startTime: Int) {
        switch library {
            case .mp4:
                mp4Tag.removeChapter(startTime: startTime)
            case .id3:
                id3Tag.removeChapter(at: startTime)
        }
    }
    
    /// Removes all chapters in the file
    public mutating func removeAllChapters() throws {
        switch library {
            case .mp4:
                mp4Tag.removeAllChapters()
            case .id3:
                id3Tag.removeAllChapters()
        }
    }
}

