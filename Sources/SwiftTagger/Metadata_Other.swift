//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/23/20.
//

import Foundation
import Cocoa
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
extension AudioFile {
    public func getCoverArt() throws -> NSImage? {
        switch library {
            case .mp4:
                return try mp4Tag.getCoverArt()
            case .id3:
                return id3Tag.coverArt
        }
    }
    
    public mutating func setCoverArt(from url: URL) throws {
        switch library {
            case .mp4:
                try mp4Tag.setCoverArt(url: url)
            case .id3:
                if let image = NSImage(contentsOf: url) {
                    id3Tag.coverArt = image
            }
        }
    }
    
    public mutating func removeCoverArt() throws {
        switch library {
            case .mp4:
                try mp4Tag.removeCoverArt()
            case .id3:
                id3Tag.coverArt = nil
        }
    }
    
    public var contentRating: SwiftTagger.ContentRating? {
        get {
            switch library {
                case .mp4:
                    if let rating = SwiftTagger.ContentRating(mp4Value: mp4Tag.rating ?? .none) {
                        return rating
                    } else {
                        return nil
                }
                case .id3:
                    if let rating = SwiftTagger.ContentRating(id3Value: id3Tag.contentRating ?? .none) {
                        return rating
                    } else {
                        return nil
                }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        if new == .clean {
                            mp4Tag.rating = .clean
                        } else if new == .explicit {
                            mp4Tag.rating = .explicit
                        } else if new == .none {
                            mp4Tag.rating = SwiftTaggerMP4.ContentRating.none
                        } else {
                            mp4Tag.rating = nil
                    }
                    case .id3:
                        if new == .clean {
                            id3Tag.contentRating = .clean
                        } else if new == .explicit {
                            id3Tag.contentRating = .explicit
                        } else if new == .none {
                            id3Tag.contentRating = SwiftTaggerID3.ContentRating.none
                        } else {
                            id3Tag.contentRating = nil
                    }
                }
            } else {
                switch library {
                    case .mp4: mp4Tag.rating = nil
                    case .id3: id3Tag.contentRating = nil
                }
            }
        }
    }
    
    public var contentAdvisory: (rating: ContentAdvisory?, ratingNotes: String?) {
        get {
            switch library {
                case .mp4:
                    let mp4Value = mp4Tag.contentAdvisory
                    if let rating = ContentAdvisory(mp4Value: mp4Value.rating ?? .none), rating != .none {
                        let note = mp4Value.ratingNotes
                        return (rating, note)
                    } else {
                        return (nil, nil)
                }
                case .id3:
                    let id3Value = id3Tag.contentAdvisory
                    if let rating = ContentAdvisory(id3Value: id3Value.rating ?? .none), rating != .none {
                        let note = id3Value.ratingNotes
                        return (rating, note)
                    } else {
                        return (nil, nil)
                }
            }
        }
        set {
            if newValue != (nil, nil) && newValue.rating != ContentAdvisory.none {
                switch library {
                    case .mp4:
                        if let rating = newValue.rating {
                            let mp4Rating = SwiftTaggerMP4.ContentAdvisory(rawValue: rating.rawValue)
                            mp4Tag.contentAdvisory = (mp4Rating, newValue.ratingNotes)
                    }
                    case .id3:
                        if let rating = newValue.rating {
                            let id3Rating = SwiftTaggerID3.ContentAdvisory(rawValue: rating.rawValue)
                            id3Tag.contentAdvisory = (id3Rating, newValue.ratingNotes)
                    }
                }
            }
        }
    }
}
// mpaa|Unrated|???|Annotation
