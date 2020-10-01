//
//  AudioFile.Accessors.E-I.swift
//  
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    /// Encoding date/time. ID3 frame `TDEN`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Encoding Date/Time`
    var encodingDateTime: Date? {
        get {
            switch library {
                case .id3: return id3Tag.encodingDateTime
                case .mp4:
                    if let dateString = mp4Tag["Encoding Date/Time"] {
                        return dateString.attemptDateFromString
                    } else {
                        return nil
                    }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.encodingDateTime = new
                    case .mp4:
                        let formatter = ISO8601DateFormatter()
                        formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
                        formatter.formatOptions = .withInternetDateTime
                        mp4Tag["Encoding Date/Time"] = formatter.string(from: new)
                }
            } else {
                switch library {
                    case .id3: id3Tag.encodingDateTime = nil
                    case .mp4: mp4Tag["Encoding Date/Time"] = nil
                }
            }
        }
    }
    
    /// Encoded by. ID3 frame `TENC` MP4 atom `©enc`
    ///
    /// Contains the name of the person or organisation that encoded the audio file. This field may contain a copyright message, if the audio file also is copyrighted by the encoder.
    var encodedBy: String? {
        get {
            switch library {
                case .id3: return id3Tag.encodedBy
                case .mp4: return mp4Tag.encodedBy
            }
        }
        set {
            switch library {
                case .id3: id3Tag.encodedBy = newValue
                case .mp4: mp4Tag.encodedBy = newValue
            }
        }
    }
    
    var encoderSettings: String? {
        get {
            switch library {
                case .id3: return id3Tag.encodingSettings
                case .mp4: return mp4Tag.encodingTool
            }
        }
        set {
            switch library {
                case .id3: id3Tag.encodingSettings = newValue
                case .mp4: mp4Tag.encodingTool = newValue
            }
        }
    }
    
    /// Executive producer of the movie . MP4 frame `©xpd`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `executiveProducer`
    var executiveProducer: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.executiveProducer]?.toString
                case .mp4: return mp4Tag.executiveProducer
            }
        }
        set {
            switch library {
                case .id3: id3Tag.involvementCreditsList[.executiveProducer] = newValue?.toArray
                case .mp4: mp4Tag.executiveProducer = newValue
            }
        }
    }
    
    /// Boolean value indicating there should be no delay between tracks MP4 atom `pgap`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, a true value for this item will result in the `playlistDelay` frame being set to 0. Otherwise, this value will be ignored when tagging ID3 files.
    var gaplessPlayback: Bool? {
        get {
            switch library {
                case .id3:
                    if id3Tag.playlistDelay == 0 {
                        return true
                    } else {
                        return false
                    }
                case .mp4: return mp4Tag.gaplessPlayback
            }
        }
        set {
            switch library {
                case .id3:
                    if newValue == true {
                        id3Tag.playlistDelay = 0
                    } else {
                        break
                    }
                case .mp4: mp4Tag.gaplessPlayback = newValue
            }
        }
    }
    
    /// User-defined genre  ID3 frame `TCON`, MP4 atom `©gen`
    var genreCustom: String? {
        get {
            switch library {
                case .id3: return id3Tag.genre.genre
                case .mp4: return mp4Tag.customGenre
            }
        }
        set {
            switch library {
                case .id3: id3Tag.genre.genre = newValue
                case .mp4: mp4Tag.customGenre = newValue
            }
        }
    }
    
    /// Predefined genre ID3 frame `TCON`, MP4 atom `genr`
    var genrePredefined: (id3: GenreID3?, mp4: GenreMP4?) {
        get {
            switch library {
                case .id3:
                    if let genre = id3Tag.genre.genreCategory {
                        return (genre, nil)
                    } else {
                        return (nil, nil)
                    }
                case .mp4: return (nil, mp4Tag.predefinedGenre)
            }
        }
        set {
            switch library {
                case .id3: id3Tag.genre.genreCategory = newValue.id3
                case .mp4: mp4Tag.predefinedGenre = newValue.mp4
            }
        }
    }
    
    /// The iTunes-store genre identifier. MP4 atom `geID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `GenreID`
    var genreID: Int? {
        get {
            switch library {
                case .id3:
                    if let genre = id3Tag.genre.genreCategory {
                        return genre.code
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.genreID?.rawValue
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag.genre.genreCategory = GenreID3(code: new)
                    } else {
                        id3Tag.genre.genreCategory = nil
                    }
                case .mp4:
                    if let new = newValue {
                        mp4Tag.genreID = GenreMP4(rawValue: new)
                    } else {
                        mp4Tag.genreID = nil
                    }
            }
        }
    }
    
    /// Grouping ID3 frame `GRP1` MP4 atom `©grp`
    ///
    /// Frame used by iTunes to group works.
    var grouping: String? {
        get {
            switch library {
                case .id3: return id3Tag.grouping
                case .mp4: return mp4Tag.grouping
            }
        }
        set {
            switch library {
                case .id3: id3Tag.grouping = newValue
                case .mp4: mp4Tag.grouping = newValue
            }
        }
    }
    
    /// Information about the movie MP4 atom `©inf`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Information`
    var information: String? {
        get {
            switch library {
                case .id3: return id3Tag["Information"]
                case .mp4: return mp4Tag.information
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Information"] = newValue
                case .mp4: mp4Tag.information = newValue
            }
        }
    }
    
    /// Initial key. ID3 frame `TKEY`
    ///
    /// Contains the musical key in which the sound starts. It is represented as a string with a maximum length of three characters. The ground keys are represented with "A","B","C","D","E", "F" and "G" and halfkeys represented with "b" and "#". Minor is represented as "m", e.g. "Dbm" $00. Off key is represented with an "o" only.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Initial Key`
    var initialKey: KeySignature? {
        get {
            switch library {
                case .id3: return id3Tag.initialKey
                case .mp4:
                    if let string = mp4Tag["Initial Key"] {
                        return KeySignature(rawValue: string)
                    } else {
                        return nil
                    }
            }
        }
        set {
            switch library {
                case .id3: id3Tag.initialKey = newValue
                case .mp4: mp4Tag["Initial Key"] = newValue?.rawValue
            }
        }
    }
    
    /// InvolvedPeopleList frame. ID3 frame `TIPL`
    ///
    /// `InvolvedPeopleList` handles production and support credits, while `MusicianCreditsList` handles performer credits.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to the appropriate atom for the role, if it exists. Otherwise, a userDefined atom will be created with a description corresponding to the role
    var involvementCreditList: [InvolvementCredits : [String]] {
        get {
            switch library {
                case .id3: var list = id3Tag.involvementCreditsList
                    list[.arranger] = id3Tag.arranger?.toArray
                    list[.composer] = id3Tag.composer?.toArray
                    list[.lyricist] = id3Tag.lyricist?.toArray
                    list[.publisher] = id3Tag.publisher?.toArray
                    return list
                case .mp4:
                    var list = [InvolvementCredits : [String]]()
                    list[.artDirection] = mp4Tag.artDirector?.toArray
                    list[.arranger] = mp4Tag.arranger?.toArray
                    list[.composer] = mp4Tag.composer?.toArray
                    list[.director] = mp4Tag.director?.toArray
                    list[.executiveProducer] = mp4Tag.executiveProducer?.toArray
                    list[.lyricist] = mp4Tag.lyricist?.toArray
                    list[.producer] = mp4Tag.producer?.toArray
                    list[.publisher] = mp4Tag.publisher?.toArray
                    list[.soundEngineer] = mp4Tag.soundEngineer?.toArray
                    list[.songwriter] = mp4Tag.songwriter?.toArray
                    list[.writer] = mp4Tag.writer?.toArray
                    return list
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3:
                        id3Tag.involvementCreditsList = newValue
                        id3Tag.arranger = newValue[.arranger]?.toString
                        id3Tag.composer = newValue[.composer]?.toString
                        id3Tag.publisher = newValue[.publisher]?.toString
                    case .mp4:
                        mp4Tag.artDirector = newValue[.artDirection]?.toString
                        mp4Tag.arranger = newValue[.arranger]?.toString
                        mp4Tag.composer = newValue[.composer]?.toString
                        mp4Tag.director = newValue[.director]?.toString
                        mp4Tag.executiveProducer = newValue[.executiveProducer]?.toString
                        mp4Tag.lyricist = newValue[.lyricist]?.toString
                        mp4Tag.producer = newValue[.producer]?.toString
                        mp4Tag.publisher = newValue[.publisher]?.toString
                        mp4Tag.soundEngineer = newValue[.soundEngineer]?.toString
                        mp4Tag.songwriter = newValue[.songwriter]?.toString
                        mp4Tag.writer = newValue[.writer]?.toString
                        let filteredNew = newValue.filter(
                            {$0.key != .arranger &&
                                $0.key != .composer &&
                                $0.key != .artDirection &&
                                $0.key != .director &&
                                $0.key != .executiveProducer &&
                                $0.key != .lyricist &&
                                $0.key != .producer &&
                                $0.key != .publisher &&
                                $0.key != .soundEngineer &&
                                $0.key != .songwriter &&
                                $0.key != .writer})
                        for (role, personArray) in filteredNew {
                            mp4Tag[role.rawValue] = personArray.toString
                        }
                }
            } else {
                switch library {
                    case .id3: id3Tag.frames[.involvedPeopleList] = nil
                    case .mp4: break
                }
            }
        }
    }
    
    /// ISRC ID frame `TSRC` MP4 atom `©isr`
    ///
    /// Should contain the International Standard Recording Code [ISRC] (12 characters).
    var isrc: String? {
        get {
            switch library {
                case .id3: return id3Tag.isrc
                case .mp4: return mp4Tag.isrc
            }
        }
        set {
            switch library {
                case .id3: id3Tag.isrc = newValue
                case .mp4: mp4Tag.isrc = newValue
            }
        }
    }
    
    /// The iTunes-store account MP4 atom `apID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `iTunes Account`
    var iTunesAccount: String? {
        get {
            switch library {
                case .id3: return id3Tag["iTunes Account"]
                case .mp4: return mp4Tag.iTunesAccount
            }
        }
        set {
            switch library {
                case .id3: id3Tag["iTunes Account"] = newValue
                case .mp4: mp4Tag.iTunesAccount = newValue
            }
        }
    }
    
    /// The iTunes-store account type identifier MP4 atom `akID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `iTunes Account Type`
    var iTunesAccountType: Int? {
        get {
            switch library {
                case .id3: if let string = id3Tag["iTunes Account Type"] {
                    if let int = Int(string) {
                        return int
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
                case .mp4: return mp4Tag.iTunesAccountType
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["iTunes Account Type"] = String(new)
                    } else {
                        id3Tag["iTunes Account Type"] = nil
                    }
                case .mp4: mp4Tag.iTunesAccountType = newValue
            }
        }
    }
}
