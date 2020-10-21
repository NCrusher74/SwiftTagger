//
//  AudioFile.Accessors.K-N.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 9/30/20.
//

import Foundation
import SwiftLanguageAndLocaleCodes

@available(OSX 10.13, *)
extension AudioFile {
    /// Name of record label MP4 atom `©lab`
    ///
    /// There is no corresponding ID3 frame. For MP3al files, this metadata will be written to a userDefinedText frame with the description `Label`
    public var label: String? {
        get {
            switch library {
                case .id3: return id3Tag["Label"]
                case .mp4: return mp4Tag.label
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Label"] = newValue
                case .mp4: mp4Tag.label = newValue
            }
        }
    }
    
    /// URL of record label MP4 atom `©lal`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedWebpage frame with the description `Label Webpage`
    public var labelWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag[userDefinedUrl: "Label Webpage"]
                case .mp4: return mp4Tag.labelUrl
            }
        }
        set {
            switch library {
                case .id3: id3Tag[userDefinedUrl: "Label Webpage"] = newValue
                case .mp4: mp4Tag.labelUrl = newValue
            }
        }
    }
    
    /// Language ID3 frame `TLAN`, MP4 atom `elng`
    ///
    /// Should contain the languages of the text or lyrics spoken or sung in the audio. The language is represented with three characters according to ISO-639-2 [ISO-639-2]. If more than one language is used in the text their language codes should follow according to the amount of their usage, e.g. "eng" $00 "sve" $00.
    public var language: [Language] {
        get {
            switch library {
                case .id3:  return id3Tag.languages
                case .mp4: return mp4Tag.languages
                    
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3: id3Tag.languages = newValue
                    case .mp4: mp4Tag.languages = newValue
                }
            } else {
                switch library {
                    case .id3: id3Tag.languages = []
                    case .mp4: mp4Tag.languages = []
                }
            }
        }
    }
    
    /// Length frame ID3 frame `TLEN` MP4 atom `mvhd`
    ///
    /// Contains the length of the audio file in milliseconds. Because SwiftTagger does not support editing media files, this property is read-only
    public var length: Int? {
        switch library {
            case .id3: return id3Tag.length
            case .mp4: return mp4Tag.duration
        }
    }
    
    /// Liner notes. MP4 atom `©lnt`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Liner Notes`
    public var linerNotes: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Liner Notes", .und]
                case .mp4: return mp4Tag.linerNotes
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: "Liner Notes", .und] = newValue
                case .mp4: mp4Tag.linerNotes = newValue
            }
        }
    }
    
    /// Long desccription MP4 atom `ldes`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Long Description`
    public var longDescription: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Long Description", .und]
                case .mp4: return mp4Tag.longDescription
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: "Long Description", .und] = newValue
                case .mp4: mp4Tag.longDescription = newValue
            }
        }
    }
    
    /// Lyrics (unsynchronized) ID3 frame `USLT` MP4 atom `©lyr`
    ///
    /// This frame contains the lyrics of the song or a text transcription of other vocal activities.
    ///
    /// For audiobooks, this is commonly used to contain a long book-jacket description or "blurb"
    public var lyrics: String? {
        get {
            switch library {
                case .id3: return id3Tag[lyrics: "Lyrics", .und]
                case .mp4: return mp4Tag.lyrics
            }
        }
        set {
            switch library {
                case .id3: id3Tag[lyrics: "Lyrics", .und] = newValue
                case .mp4: mp4Tag.lyrics = newValue
            }
        }
    }
    
    /// Lyricist/Text writer. ID3 frame `TEXT` MP4 atom `©aut`
    ///
    /// Intended for the writer of the text or lyrics in the recording.
    public var lyricist: String? {
        get {
            switch library {
                case .id3: return id3Tag.lyricist
                case .mp4: return mp4Tag.lyricist
            }
        }
        set {
            switch library {
                case .id3: id3Tag.lyricist = newValue
                case .mp4: mp4Tag.lyricist = newValue
            }
        }
    }
    
    /// The media kind value for the media. MP4 atom `stik`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Media Kind`
    public var mediaKind: Stik? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Media Kind"] {
                        let stik = Stik(stringValue: string)
                        return stik
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.mediaKind
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Media Kind"] = newValue?.stringValue
                case .mp4: mp4Tag.mediaKind = newValue
            }
        }
    }
    
    /// Mood. ID3 frame `TMOO`
    ///
    /// Intended to reflect the mood of the audio with a few keywords, e.g. "Romantic" or "Sad".
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Mood`
    public var mood: String? {
        get {
            switch library {
                case .id3: return id3Tag.mood
                case .mp4: return mp4Tag["Mood"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.mood = newValue
                case .mp4: mp4Tag["Mood"] = newValue
            }
        }
    }
    
    /// Movement Count. ID3 frame `MVCN` MP4 atom `©mvc`
    ///
    /// Used by iTunes to denote the number of movements in a work
    public var movementCount: Int? {
        get {
            switch library {
                case .id3: return id3Tag.movementCount
                case .mp4: return mp4Tag.movementCount
            }
        }
        set {
            switch library {
                case .id3: id3Tag.movementCount = newValue
                case .mp4: mp4Tag.movementCount = newValue
            }
        }
    }
    
    /// Movement Name. ID3 frame `MVNM` MP4 atom `©mvn`
    ///
    /// Used by iTunes to name the movements of a multi-part work
    public var movement: String? {
        get {
            switch library {
                case .id3: return id3Tag.movement
                case .mp4: return mp4Tag.movement
            }
        }
        set {
            switch library {
                case .id3: id3Tag.movement = newValue
                case .mp4: mp4Tag.movement = newValue
            }
        }
    }
    
    /// Movement Number. ID3 frame `MVIN` MP4 atom `©mvi`
    ///
    /// Used by iTunes to denote the total number of movements in a work
    public var movementNumber: Int? {
        get {
            switch library {
                case .id3: return id3Tag.movementNumber
                case .mp4: return mp4Tag.movementNumber
            }
        }
        set {
            switch library {
                case .id3: id3Tag.movementNumber = newValue
                case .mp4: mp4Tag.movementNumber = newValue
            }
        }
    }
    
    /// Musician credits list. ID3 frame `TMCL`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to the appropriate atom for the role, if one exists. Otherwise, a userDefined atom will be created with a description that corresponds to the role
    public var musicianCreditsList: [MusicianCredits : [String]] {
        get {
            switch library {
                case .id3: var list = id3Tag.musicianCreditsList
                    list[.artist] = id3Tag.artist?.toArray
                    return list 
                case .mp4:
                    var list = [MusicianCredits : [String]]()
                    list[.artist] = mp4Tag.artist?.toArray
                    list[.soloist] = mp4Tag.soloist?.toArray
                    list[.narrator] = mp4Tag.narrator?.toArray
                    list[.performer] = mp4Tag.performers

                    for atom in mp4Tag.unknownAtoms {
                        if let credit = MusicianCredits(rawValue: atom.name) {
                            list[credit] = atom.stringValue.toArray
                        }
                    }
                    return list
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3:
                        id3Tag.musicianCreditsList = newValue
                        id3Tag.artist = newValue[.artist]?.toString
                    case .mp4:
                        mp4Tag.artist = newValue[.artist]?.toString
                        mp4Tag.soloist = newValue[.soloist]?.toString
                        mp4Tag.narrator = newValue[.narrator]?.toString
                        mp4Tag.performers = newValue[.performer]
                        let filteredNew = newValue.filter(
                            {$0.key != .artist &&
                                $0.key != .soloist &&
                                $0.key != .narrator &&
                                $0.key != .performer})
                        for (role, personArray) in filteredNew {
                            mp4Tag[role.rawValue] = personArray.toString
                        }
                }
            } else {
                switch library {
                    case .id3: id3Tag.frames[.musicianCreditsList] = nil
                    case .mp4: break
                }
            }
        }
    }
    
    /// Narrator (as listed by Audible in audiobooks) MP4 atom `©nrt`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Narrator`
    public var narrator: String? {
        get {
            switch library {
                case .id3: return id3Tag.musicianCreditsList[.narrator]?.toString
                case .mp4: return mp4Tag.narrator
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.addMusicianCredit(role: .narrator, person: new)
                    case .mp4: mp4Tag.narrator = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.removeMusicianCredit(role: .narrator)
                    case .mp4: mp4Tag.narrator = nil
                }
            }
        }
    }
}
