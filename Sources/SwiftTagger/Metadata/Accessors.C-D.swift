//
//  AudioFile.Accessors.B-D.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation
import SwiftConvenienceExtensions

@available(OSX 10.13, iOS 10.0, *)
extension AudioFile {
    
    /// Comments ID3 frame `COMM` MP4 atom `©cmt`
    ///
    /// This frame is intended for any kind of full text information that does not fit in any other frame. ALLOWS `(/n)` new line characters.
    ///
    /// For audiobooks, this frame is frequently used to contain the book-jacket description, or "blurb"
    public var comments: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Comment", .und]
                case .mp4: return mp4Tag.comment
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: "Comment", .und] = newValue
                case .mp4: mp4Tag.comment = newValue
            }
        }
    }
    
    /// Compilation. ID3 tag `TCMP`, MP4 atom `cpil`
    ///
    /// This is a simple text frame that iTunes uses to indicate if the file is part of a compilation. Contains a text string (1 or 0) representing a boolean value
    public var compilation: Bool? {
        get {
            switch library {
                case .id3: return id3Tag.compilation
                case .mp4: return mp4Tag.compilation
            }
        }
        set {
            switch library {
                case .id3: id3Tag.compilation = newValue
                case .mp4: mp4Tag.compilation = newValue
            }
        }
    }
    
    /// Composer ID3 frame `TCOM` MP4 atom `©com`
    ///
    /// The name of the composer. Also used commonly in audiobooks for the name of the narrator.
    public var composer: String? {
        get {
            switch library {
                case .id3: return id3Tag.composer
                case .mp4: return mp4Tag.composer
            }
        }
        set {
            switch library {
                case .id3: id3Tag.composer = newValue
                case .mp4: mp4Tag.composer = newValue
            }
        }
    }
    
    /// The iTunes-store composer identifier. MP4 atom `cmID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ComposerID`
    public var composerID: Int? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["ComposerID"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.composerID
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["ComposerID"] = String(new)
                    } else {
                        id3Tag["ComposerID"] = nil
                    }
                case .mp4: mp4Tag.composerID = newValue
            }
        }
    }
    
    /// Keywords for composer. MP4 atom `©cok`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Composer Keywords`
    public var composerKeywords: [String] {
        get {
            switch library {
                case .id3: return id3Tag["Composer Keywords"]?.toArray ?? []
                case .mp4: return mp4Tag.composerKeywords ?? []
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3: id3Tag["Composer Keywords"] = newValue.toString
                    case .mp4: mp4Tag.composerKeywords = newValue
                }
            } else {
                switch library {
                    case .id3: id3Tag["Composer Keywords"] = nil
                    case .mp4: mp4Tag.composerKeywords = nil
                }
            }
        }
    }
    
    /// ComposerSort. ID3 frame `TSOC` MP4 atom `soco`
    ///
    /// Frame used for sorting by composer in iTunes
    public var composerSort: String? {
        get {
            switch library {
                case .id3: return id3Tag.composerSort
                case .mp4: return mp4Tag.composerSort
            }
        }
        set {
            switch library {
                case .id3: id3Tag.composerSort = newValue
                case .mp4: mp4Tag.composerSort = newValue
            }
        }
    }
    
    /// Conductor name. ID3 frame `TPE3`, MP4 atom `©con`
    public var conductor: String? {
        get {
            switch library {
                case .id3: return id3Tag.conductor
                case .mp4: return mp4Tag.conductor
            }
        }
        set {
            switch library {
                case .id3: id3Tag.conductor = newValue
                case .mp4: mp4Tag.conductor = newValue
            }
        }
    }
    
    /// The iTunes-store conductor identifier. MP4 atom `cnID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ConductorID`
    public var conductorID: Int? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["ConductorID"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.conductorID
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["ConductorID"] = String(new)
                    } else {
                        id3Tag["ConductorID"] = nil
                    }
                case .mp4: mp4Tag.conductorID = newValue
            }
        }
    }
    
    /// Content rating/advisory (such as MPAA ratings). userDefined atom/frame `iTunEXTC`
    public var contentRating:
        (contentRating: ContentRating, ratingNotes: String?) {
        get {
            switch library {
                case .mp4: return mp4Tag.contentRating
                case .id3:
                    if let string = id3Tag["iTunEXTC"] {
                        let components: [String] = string.components(separatedBy: "|")
                        if components.count == 3 {
                            if let rating = ContentRating(rawValue: string) {
                                return (rating, nil)
                            } else {
                                return (.none, nil)
                            }
                        } else {
                            let ratingComponentsString = components[0 ..< 3].joined(separator: "|") + "|"
                            let note = components.last
                            if let rating = ContentRating(rawValue: ratingComponentsString) {
                                return (rating, note)
                            } else {
                                return (.none, nil)
                            }
                        }
                    } else {
                        return (.none, nil)
                    }
            }
        }
        set {
            if newValue != (.none, nil) {
                switch library {
                    case .mp4: mp4Tag.contentRating = newValue
                    case .id3:
                        let string = newValue.contentRating.rawValue
                        if let note = newValue.ratingNotes {
                            id3Tag["iTunEXTC"] = string + note
                        } else {
                            id3Tag["iTunEXTC"] = string
                        }
                }
            } else {
                switch library {
                    case .id3: id3Tag["iTunEXTC"] = nil
                    case .mp4: mp4Tag.contentRating = (.none, nil)
                }
            }
        }
    }
    
    /// Copyright declaration ID3 frame `TCOP` MP4 atom `cprt`
    ///
    /// The string must begin with a year and a space character (making five characters), is intended for the copyright holder of the original sound, not the audio file itself.
    public var copyright: String? {
        get {
            switch library {
                case .id3: return id3Tag.copyright
                case .mp4: return mp4Tag.copyright
            }
        }
        set {
            switch library {
                case .id3: id3Tag.copyright = newValue
                case .mp4: mp4Tag.copyright = newValue
            }
        }
    }
    
    /// Copyright/Legal information. ID3 frame `WCOP`
    ///
    /// URL pointing at a webpage where the terms of use and ownership of the file is described.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Copyright Webpage`
    public var copyrightWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.copyrightWebpage
                case .mp4: return mp4Tag["Copyright Webpage"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.copyrightWebpage = newValue
                case .mp4: mp4Tag["Copyright Webpage"] = newValue
            }
        }
    }
    
    /// Embedded cover art ID3 frame `APIC`, MP4 atom `covr`
    public var coverArt: NativeImage? {
        switch library {
            case .id3: return id3Tag[attachedPicture: .other]
            case .mp4: return mp4Tag.coverArt
        }
    }
    
    public mutating func setCoverArt(imageLocation: URL) throws {
        switch library {
            case .id3: try id3Tag.set(attachedPicture: .other,
                                      imageLocation: imageLocation,
                                      description: "Other")
            case .mp4: try mp4Tag.setCoverArt(location: imageLocation)
        }
    }
    
    public mutating func removeCoverArt() throws {
        switch library {
            case .id3: id3Tag.removeImage(type: .other)
            case .mp4: try mp4Tag.removeCoverArt()
        }
    }
    
    /// Description (short) MP4 atom `©des`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Description`
    public var description: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Description", .und]
                case .mp4: return mp4Tag.description
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: "Description", .und] = newValue
                case .mp4: mp4Tag.description = newValue
            }
        }
    }
    
    /// Name of movie’s director. MP4 atom `©dir`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to to the `involvedPeopleList` frame with the role `director`
    public var director: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.director]?.toString
                case .mp4: return mp4Tag.director
            }
        }
        set {
            switch library {
                case .id3: id3Tag.involvementCreditsList[.director] = newValue?.toArray
                case .mp4: mp4Tag.director = newValue
            }
        }
    }
    
    /// Disc index/position in set, ID3 frame `TPOS` MP4 atom `disk`
    ///
    /// A numeric string that describes which part of a set the audio came from.
    public var discNumber: (disc: Int, totalDiscs: Int?) {
        get {
            switch library {
                case .id3: return id3Tag.discNumber 
                case .mp4: return mp4Tag.discNumber 
            }
        }
        set {
            switch library {
                case .id3: id3Tag.discNumber = newValue
                case .mp4: mp4Tag.discNumber = newValue
            }
        }
    }
}
