//
//  Chaptering.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 10/1/20.
//

import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    
    public var chapterList: [(startTime: Int, title: String)] {
        switch library {
            case .id3: return id3Tag.chapterList
            case .mp4: return mp4Tag.chapterList
        }
    }
    
    public mutating func addChapter(startTime: Int, title: String) {
        switch library {
            case .id3: id3Tag.addChapter(startTime: startTime, title: title)
            case .mp4: mp4Tag.addChapter(startTime: startTime, title: title)
        }
    }
    
    public mutating func removeChapter(startTime: Int) {
        switch library {
            case .id3: id3Tag.removeChapter(startTime: startTime)
            case .mp4: mp4Tag.removeChapter(startTime: startTime)
        }
    }
    
    public mutating func removeAllChapters() {
        switch library {
            case .id3: id3Tag.removeAllChapters()
            case .mp4: mp4Tag.removeAllChapters()
        }
    }
    
    public mutating func removeAllMetadata() {
        switch library {
            case .id3: id3Tag.removeAllMetadata()
            case .mp4: mp4Tag.removeAllMetadata()
        }
    }    
}
