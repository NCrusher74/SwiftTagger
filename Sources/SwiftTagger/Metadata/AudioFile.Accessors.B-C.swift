//
//  AudioFile.Accessors.B-C.swift
//  
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation
import SwiftTaggerMP4
import Cocoa

@available(OSX 10.13, *)
extension AudioFile {
        
    /// BPM. ID3 frame `TBPM`, MP4 atom `tmpo`
    ///
    /// Contains the number of beats per minute in the main part of the audio. The BPM is an integer and represented as a numerical string.
    var bpm: Int? {
        get {
            switch library {
                case .id3: return id3Tag.bpm
                case .mp4: return mp4Tag.bpm
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.bpm = new
                    case .mp4: mp4Tag.bpm = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.bpm = nil
                    case .mp4: mp4Tag.bpm = nil
                }
            }
        }
    }
    
    /// Comments ID3 frame `COMM` MP4 atom `©cmt`
    ///
    /// This frame is intended for any kind of full text information that does not fit in any other frame. ALLOWS `(/n)` new line characters.
    ///
    /// For audiobooks, this frame is frequently used to contain the book-jacket description, or "blurb"
    var comments: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Comment", .und]
                case .mp4: return mp4Tag.comment
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag[comment: "Comment", .und] = new
                    case .mp4: mp4Tag.comment = new
                }
            } else {
                switch library {
                    case .id3: id3Tag[comment: "Comment", .und] = nil
                    case .mp4: mp4Tag.comment = nil
                }
            }
        }
    }
    
    /// Compilation. ID3 tag `TCMP`, MP4 atom `cpil`
    ///
    /// This is a simple text frame that iTunes uses to indicate if the file is part of a compilation. Contains a text string (1 or 0) representing a boolean value
    var compilation: Bool? {
        get {
            switch library {
                case .id3: return id3Tag.compilation
                case .mp4: return mp4Tag.compilation
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.compilation = new
                    case .mp4: mp4Tag.compilation = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.compilation = nil
                    case .mp4: mp4Tag.compilation = nil
                }
            }
        }
    }
    
    /// Composer ID3 frame `TCOM` MP4 atom `©com`
    ///
    /// The name of the composer. Also used commonly in audiobooks for the name of the narrator.
    var composer: String? {
        get {
            switch library {
                case .id3: return id3Tag.composer
                case .mp4: return mp4Tag.composer
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.composer = new
                    case .mp4: mp4Tag.composer = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.composer = nil
                    case .mp4: mp4Tag.composer = nil
                }
            }
        }
    }
    
    /// The iTunes-store composer identifier. MP4 atom `cmID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ComposerID`
    var composerID: Int? {
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
                case .mp4: return mp4Tag.conductorID
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag["ComposerID"] = String(new)
                    case .mp4: mp4Tag.conductorID = new
                }
            } else {
                switch library {
                    case .id3: id3Tag["ComposerID"] = nil
                    case .mp4: mp4Tag.conductorID = nil
                }
            }
        }
    }

    /// Keywords for composer. MP4 atom `©cok`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Composer Keywords`
    var composerKeywords: [String] {
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
    var composerSort: String? {
        get {
            switch library {
                case .id3: return id3Tag.composerSort
                case .mp4: return mp4Tag.composerSort
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.composerSort = new
                    case .mp4: mp4Tag.composerSort = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.composerSort = nil
                    case .mp4: mp4Tag.composerSort = nil
                }
            }
        }
    }
    
    /// Conductor name. ID3 frame `TPE3`, MP4 atom `©con`
    var conductor: String? {
        get {
            switch library {
                case .id3: return id3Tag.conductor
                case .mp4: return mp4Tag.conductor
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.conductor = new
                    case .mp4: mp4Tag.conductor = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.conductor = nil
                    case .mp4: mp4Tag.conductor = nil
                }
            }
        }
    }

    /// The iTunes-store conductor identifier. MP4 atom `cnID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ConductorID`
    var conductorID: Int? {
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
            if let new = newValue {
                switch library {
                    case .id3: id3Tag["ConductorID"] = String(new)
                    case .mp4: mp4Tag.conductorID = new
                }
            } else {
                switch library {
                    case .id3: id3Tag["ConductorID"] = nil
                    case .mp4: mp4Tag.conductorID = nil
                }
            }
        }
    }
    
    /// Content rating/advisory (such as MPAA ratings). userDefined atom/frame `iTunEXTC`
    var contentRating: (contentRating: ContentRating, ratingNotes: String?) {
        get {
            switch library {
                case .id3:
                    if let ratingString = id3Tag["iTunEXTC"] {
                        let components: [String] = ratingString.components(separatedBy: "|")
                        var rating: ContentRating = .none
                        var notes: String? = nil
                        if components.count == 3 {
                            if let contentRating = ContentRating(rawValue: ratingString) {
                                rating = contentRating
                            }
                        } else {
                            let string = components.dropLast().joined(separator: "|")
                            if let contentRating = ContentRating(rawValue: string) {
                                rating = contentRating
                            }
                            notes = components.dropFirst(3).joined()
                        }
                        return (rating, notes)
                    } else {
                        return (.none, nil)
                    }
                case .mp4: return mp4Tag.contentRating
            }
        }
        set {
            if newValue != (.none, nil) {
                switch library {
                    case .id3:
                        let string = "\(newValue.contentRating.rawValue)|\(newValue.ratingNotes ?? "")"
                        id3Tag["iTunEXTC"] = string
                    case .mp4: mp4Tag.contentRating = newValue
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
    var copyright: String? {
        get {
            switch library {
                case .id3: return id3Tag.copyright
                case .mp4: return mp4Tag.copyright
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.copyright = new
                    case .mp4: mp4Tag.copyright = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.copyright = nil
                    case .mp4: mp4Tag.copyright = nil
                }
            }
        }
    }
    
    /// Copyright/Legal information. ID3 frame `WCOP`
    ///
    /// URL pointing at a webpage where the terms of use and ownership of the file is described.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Copyright Webpage`
    var copyrightWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.copyrightWebpage
                case .mp4: return mp4Tag["Copyright Webpage"]
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.copyrightWebpage = new
                    case .mp4: mp4Tag["Copyright Webpage"] = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.copyrightWebpage = nil
                    case .mp4: mp4Tag["Copyright Webpage"] = nil
                }
            }
        }
    }

    /// Embedded cover art ID3 frame `APIC`, MP4 atom `covr`
    var coverArt: NSImage? {
        switch library {
            case .id3: return id3Tag[attachedPicture: .other]
            case .mp4: return mp4Tag.coverArt
        }
    }
    
    mutating func setCoverArt(imageLocation: URL) throws {
        switch library {
            case .id3: try id3Tag.set(attachedPicture: .other,
                                      imageLocation: imageLocation,
                                      description: "Other")
            case .mp4: try mp4Tag.setCoverArt(location: imageLocation)
        }
    }
    
    mutating func removeCoverArt() throws {
        switch library {
            case .id3: id3Tag.removeImage(type: .other)
            case .mp4: try mp4Tag.removeCoverArt()
        }
    }
    
    /// Description (short) MP4 atom `©des`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Description`
    var description: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Description", .und]
                case .mp4: return mp4Tag.comment
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag[comment: "Description", .und] = new
                    case .mp4: mp4Tag.comment = new
                }
            } else {
                switch library {
                    case .id3: id3Tag[comment: "Description", .und] = nil
                    case .mp4: mp4Tag.comment = nil
                }
            }
        }
    }
    
    /// Name of movie’s director. MP4 atom `©dir`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to to the `involvedPeopleList` frame with the role `director`
    var director: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.director]?.toString
                case .mp4: return mp4Tag.director
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.involvementCreditsList[.director] = new.toArray
                    case .mp4: mp4Tag.director = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.involvementCreditsList[.director] = nil
                    case .mp4: mp4Tag.director = nil
                }
            }
        }
    }

    /// Disc index/position in set, ID3 frame `TPOS` MP4 atom `disk`
    ///
    /// A numeric string that describes which part of a set the audio came from.
    var discNumber: (disc: Int, totalDiscs: Int?) {
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
