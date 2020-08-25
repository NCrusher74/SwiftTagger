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
    
    public var keySignature: KeySignature? {
        get {
            switch library {
                case .mp4:
                    if let key = KeySignature(mp4Value: mp4Tag.initialKey ?? .unknown), key != .unknown {
                        return key
                    } else {
                        return nil
                }
                case .id3:
                    if let key = KeySignature(id3Value: id3Tag.initialKey ?? .unknown) {
                        return key
                    } else {
                        return nil
                }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        if let key = SwiftTaggerMP4.KeySignature(rawValue: new.rawValue) {
                            mp4Tag.initialKey = key
                    }
                    case .id3:
                        if let key = SwiftTaggerID3.KeySignature(rawValue: new.rawValue) {
                            id3Tag.initialKey = key
                    }
                }
            }
        }
    }
    
    /// ID3 (mp3 files) use `ISO-639-2` codes. MP4's `extendedLanguage` atom uses `ICULocaleCode`
    public var language: (id3Languages: [ISO6392Codes]?, mp4Language: ICULocaleCode?) {
        get {
            switch library {
                case .mp4:
                    if let language = mp4Tag.language {
                        if let code = ICULocaleCode(rawValue: language.rawValue) {
                            return (nil, code)
                        } else {
                            return (nil, nil)
                        }
                    } else {
                        return (nil, nil)
                }
                case .id3:
                    if let languages = id3Tag.languages {
                        var array = [ISO6392Codes]()
                        for language in languages {
                            if let code = ISO6392Codes(rawValue: language.rawValue) {
                                array.append(code)
                            }
                        }
                        return (array, nil)
                    } else {
                        return (nil, nil)
                }
            }
        }
        set {
            switch library {
                case .mp4:
                    if let language = newValue.mp4Language {
                        if let code = SwiftTaggerMP4.ICULocaleCode(rawValue: language.rawValue) {
                            mp4Tag.language = code
                        }
                }
                case .id3:
                    if let languages = newValue.id3Languages, !languages.isEmpty {
                        var array = [SwiftTaggerID3.ISO6392Codes]()
                        for language in languages {
                            if let code = SwiftTaggerID3.ISO6392Codes(rawValue: language.rawValue) {
                                array.append(code)
                            }
                        }
                        id3Tag.languages = array
                }
            }
        }
    }

    /// MP4 ONLY. Media type atom.
    public var stik: Stik? {
        get {
            if library == .mp4 {
                if let stik = Stik(rawValue: mp4Tag.stik?.rawValue ?? 255) {
                    return stik
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if library == .mp4 {
                if let new = newValue {
                    if let stik = SwiftTaggerMP4.Stik(rawValue: new.rawValue) {
                        mp4Tag.stik = stik
                    }
                } else {
                    mp4Tag.stik = nil
                }
            }
        }
    }
    
    /// MP3 ONLY
    public var mediaType: (mediaType: MediaType?, mediaTypeRefinement: MediaTypeRefinements?, additionalInformation: String?) {
        get {
            if library == .id3 {
                if let type = MediaType(rawValue: id3Tag.mediaType.mediaType?.rawValue ?? "none") {
                    if let refinement = MediaTypeRefinements(code: id3Tag.mediaType.mediaTypeRefinement?.code ?? "none") {
                        if let string = id3Tag.mediaType.additionalInformation {
                            return (type, refinement, string)
                        } else {
                            return (type, refinement, nil)
                        }
                    } else {
                        return (type, nil, nil)
                    }
                } else {
                    return (nil, nil, nil)
                }
            } else {
                return (nil, nil, nil)
            }
        }
        set {
            if library == .id3 {
                if newValue != (nil, nil, nil) {
                    if let type = SwiftTaggerID3.MediaType(rawValue: newValue.mediaType?.rawValue ?? "none") {
                        if let refinement = SwiftTaggerID3.MediaTypeRefinements(code: newValue.mediaTypeRefinement?.code ?? "none") {
                            if let string = newValue.additionalInformation {
                                id3Tag.mediaType = (type, refinement, string)
                            } else {
                                id3Tag.mediaType = (type, refinement, nil)
                            }
                        } else {
                            id3Tag.mediaType = (type, nil, nil)
                        }
                    } else {
                        id3Tag.mediaType = (nil, nil, nil)
                    }
                } else {
                    id3Tag.mediaType = (nil, nil, nil)
                }
            }
        }
    }
}
