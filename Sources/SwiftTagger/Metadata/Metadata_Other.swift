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
                if let image = id3Tag.coverArt {
                    return image
                } else if let image = id3Tag.otherImage {
                    return image
                } else {
                    return nil
            }
        }
    }
    
    public mutating func setCoverArt(from url: URL) throws {
        switch library {
            case .mp4:
                try mp4Tag.setCoverArt(url: url)
            case .id3:
                try id3Tag.set(imageType: .FrontCover,
                               imageDescription: "Front Cover",
                               location: url)
        }
    }
    
    public mutating func removeCoverArt() throws {
        switch library {
            case .mp4:
                try mp4Tag.removeCoverArt()
            case .id3:
                id3Tag.removeAttachedPicture(withDescription: "Front Cover")
        }
    }
    
    // MARK: - Content Rating
    /// This is a tag that only exists for `MP4`. The `ID3` version is simply a user defined text (`TXXX`) frame.
    public var contentRating: ContentRating? {
        get {
            switch library {
                case .mp4:
                    return mp4Tag.rating
                case .id3:
                    if let string = id3Tag["Rating"] {
                        if let rating = ContentRating(stringValue: string) {
                            return rating
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        mp4Tag.rating = new
                    case .id3:
                        id3Tag["Rating"] = new.stringValue
                }
            } else {
                switch library {
                    case .mp4:
                        mp4Tag.rating = nil
                    case .id3:
                        id3Tag["Rating"] = nil
                }
            }
        }
    }
    
    // MARK: - Content Advisory
    public var contentAdvisory: (rating: ContentAdvisory?, ratingNotes: String?) {
        get {
            switch library {
                case .mp4:
                    if let ratingString = mp4Tag.contentAdvisory.rating {
                        if let note = mp4Tag.contentAdvisory.ratingNotes {
                            return (ratingString, note)
                        } else {
                            return (ratingString, nil)
                        }
                    } else {
                        return (nil, nil)
                }
                case .id3:
                    if let string = id3Tag["ContentRating"] {
                        let components: [String] = string.components(separatedBy: "|")
                        if components.count == 3 {
                            if let rating = ContentAdvisory(rawValue: string) {
                                return (rating, nil)
                            } else {
                                return (nil, nil)
                            }
                        } else {
                            let ratingComponentsString = components[0 ..< 3].joined(separator: "|") + "|"
                            let note = components.last
                            if let rating = ContentAdvisory(rawValue: ratingComponentsString) {
                                return (rating, note)
                            } else {
                                return (nil, nil)
                            }
                        }
                    } else {
                        return (nil, nil)
                }
            }
        }
        set {
            if newValue != (nil, nil) && newValue.rating != ContentAdvisory.none {
                switch library {
                    case .mp4:
                        mp4Tag.contentAdvisory = newValue
                    case .id3:
                        if let rating = newValue.rating {
                            let string = rating.rawValue
                            if let note = newValue.ratingNotes {
                                id3Tag["ContentRating"] = string + note
                            } else {
                                id3Tag["ContentRating"] = string
                            }
                    }
                }
            }
        }
    }
    
    // MARK: - Initial Key
    public var keySignature: KeySignature? {
        get {
            switch library {
                case .mp4:
                    if let string = mp4Tag["Initial key"] {
                        if let key = KeySignature(rawValue: string) {
                            return key
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                }
                case .id3:
                    return id3Tag.initialKey
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        mp4Tag["Initial key"] = new.rawValue
                    case .id3:
                        id3Tag.initialKey = new
                }
            } else {
                switch library {
                    case .mp4:
                        mp4Tag["Initial key"] = nil
                    case .id3:
                        id3Tag.initialKey = nil
                }
            }
        }
    }
    
    // MARK: - Language
    /// ID3 (mp3 files) use `ISO-639-2` codes. MP4's `extendedLanguage` atom uses `ICULocaleCode`
    public var language: (id3Languages: [ISO6392Codes]?, mp4Language: LocaleCode?) {
        get {
            switch library {
                case .mp4:
                    if let language = mp4Tag.language {
                        return (nil, language)
                    } else {
                        return (nil, nil)
                }
                case .id3:
                    if let languages = id3Tag.languages {
                        return (languages, nil)
                    } else {
                        return (nil, nil)
                }
            }
        }
        set {
            switch library {
                case .mp4:
                    if let language = newValue.mp4Language {
                        mp4Tag.language = language
                    } else {
                        mp4Tag.language = nil
                }
                case .id3:
                        if let languages = newValue.id3Languages {
                            id3Tag.languages = languages
                        } else {
                            id3Tag.languages = nil
                }
            }
        }
    }
    
    // MARK: - Stik
    public var contentType: Stik? {
        get {
            switch library {
                case .mp4:
                    return mp4Tag.mediaContent
                case .id3:
                    if let string = id3Tag["ContentType"] {
                        if let stik = Stik(stringValue: string) {
                            return stik
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4:
                        mp4Tag.mediaContent = new
                    case .id3:
                        let string = new.stringValue
                        id3Tag["ContentType"] = string
                }
            } else {
                switch library {
                    case .mp4:
                        mp4Tag.mediaContent = nil
                    case .id3:
                        id3Tag["ContentType"] = nil
                }
            }
        }
    }
    
    // MARK: PredefinedGenre
    public var predefinedGenre: (id3Genre: GenreID3?, mp4Genre: GenreMP4?) {
        get {
            switch library {
                case .mp4:
                    if let genre = mp4Tag.genreID {
                        return (nil, genre)
                    } else if let genre = mp4Tag.predefinedGenre {
                        return (nil, genre)
                    } else {
                        return (nil, nil)
                }
                case .id3:
                    if let genre = id3Tag.genre.genreCategory {
                        return (genre, nil)
                    } else {
                        return (nil, nil)
                }
            }
        }
        set {
            if newValue != (nil, nil) {
                switch library {
                    case .mp4:
                        if let genre = newValue.mp4Genre {
                            mp4Tag.predefinedGenre = genre
                        } else {
                            mp4Tag.predefinedGenre = nil
                    }
                    case .id3:
                        if let genre = newValue.id3Genre {
                            id3Tag.genre.genreCategory = genre
                        } else {
                            id3Tag.genre.genreCategory = nil
                    }
                }
            } else {
                switch library {
                    case .mp4: mp4Tag.predefinedGenre = nil
                    case .id3: id3Tag.genre.genreCategory = nil
                }
            }
        }
    }
}
