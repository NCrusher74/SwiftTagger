//
//  File.swift
//  
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
    
    /// User Defined. ID3 frame `TXXX` MP4 atom `----`
    ///
    /// A freeform text frame/atom intended to hold user-defined items. Data is stored as a string, though it may be used for numeric strings (including boolean 1/0 strings), arrays, and so forth.
    public subscript(_ description: String) -> String? {
        get {
            switch library {
                case .id3: return id3Tag[description]
                case .mp4: return mp4Tag[description]
            }
        }
        set {
            switch library {
                case .id3: id3Tag[description] = newValue
                case .mp4: mp4Tag[description] = newValue
            }
        }
    }
    
    /// User Defined Webpage. ID3 frame `WXXX`, MP4 atom `©url`
    ///
    /// A frame/atom intended to hold a user-defined webpage address. **NOTE** For MP4, only one atom of this type is allowed, so using this more than once will overwrite the existing atom.
    public subscript(webpage description: String?) -> String? {
        get {
            switch library {
                case .id3: return id3Tag[userDefinedUrl: description]
                case .mp4: return mp4Tag.website
            }
        }
        set {
            switch library {
                case .id3: id3Tag[userDefinedUrl: description] = newValue
                case .mp4: mp4Tag.website = newValue
            }
        }
    }
    
    // **NOTE:** ID3 only. There is only one comment atom for MP4, and it can be accessed using the `comments` accessor.
    public subscript(comments _description: String?, language: ISO6392Code) -> String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: description, language]
                case .mp4: return nil
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: description, language] = newValue
                case .mp4: return
            }
        }
    }

    // **NOTE:** ID3 only. There is only one lyrics atom for MP4, and it can be accessed using the `comments` accessor.
    public subscript(lyrics description: String?, language: ISO6392Code) -> String? {
        get {
            switch library {
                case .id3: return id3Tag[lyrics: description, language]
                case .mp4: return nil
            }
        }
        set {
            switch library {
                case .id3: id3Tag[lyrics: description, language] = newValue
                case .mp4: return
            }
        }
    }
}
