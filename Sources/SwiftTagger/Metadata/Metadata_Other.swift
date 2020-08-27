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
    
    /// Retrieves the cover art image from the audiofile and returns an NSImage
    ///
    /// Because of the way the `attachedPicture` frame works in ID3, it's possible that this function will not return the correct image. This function checks for attached image frames with an `imageType` of `FrontCover`, and if that returns nil, it will check for an attached image frame with an image type of `Other` next, and then other image types.
    ///
    /// Because not everyone uses `imageType` as intended, this could mean the return is not a cover image, but the contents of another attached picture frame.
    public func getCoverArt() throws -> NSImage? {
        switch library {
            case .mp4:
                return try mp4Tag.getCoverArt()
            case .id3:
                if let image = id3Tag.coverArt {
                    return image
                } else if let image = id3Tag.otherImages.first {
                    return image
                } else {
                    return nil
            }
        }
    }
    
    /// Adds the image from a local drive to the audio file as a cover image
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
    
    /// Attempts to remove the cover art image from the audio file
    ///
    /// Because of the way the attached picture frame works in ID3, it can be difficult to isolate which image, of multiple potential images, is the cover image.
    ///
    /// This function attempts to remove images with an `imageType` of `FrontCover` first, then `Other`. If the attached image has a different image type, it may not be removed.
    ///
    /// If this function fails, attempt to use SwiftTaggerID3's `removeAttachedPictureByType(_:)` method directly.
    public mutating func removeCoverArt() throws {
        switch library {
            case .mp4:
                try mp4Tag.removeCoverArt()
            case .id3:
                if let image = try id3Tag.coverArt {
                    try id3Tag.removeCoverImage()
                } else {
                    try id3Tag.removeAttachedPictureByType(.Other)
            }
        }
    }
    
    // MARK: - Content Rating
    /// Accesses the MP4 `rtng` atom.
    ///
    /// There is no equivalent ID3 frame. Instead, this will access a user defined text (`TXXX`) frame with the descriptor `Rating`.
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
    /// Accesses the MP4 freeform atom `iTunEXTC`.
    ///
    /// There is no equivalent ID3 frame. Instead, this will access a user defined text (`TXXX`) frame with the descriptor `ContentRating`.
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
    /// Accesses the MP3 `TKEY` ("Initial Key") frame.
    ///
    /// There is no equivalent atom for MP4. Instead, this will get and set a freestom atom with the descriptor `Initial key`
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
    /// Accesses the ID3 `TLAN` frame, or the MP4 `ELNG` (extended language) atom
    ///
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
    /// Accesses the MP4 `stik` atom.
    ///
    /// There is no equivalent for ID3. Instead, this will get and set a User-defined text (`TXXX`) frame with the descriptor `ContentType`
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
    /// Accesses the ID3 `TCON` frame, or the MP4 `genr` atom.
    ///
    /// The ID3 `TCON` frame allows both custom and predefined genres. This will access the predefined genre, use the `customGenre` accessor for user-defined genres.
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
