//
//  AudioFile.Accessors.R-S.swift
//  
//
//  Created by Nolaine Crusher on 9/30/20.
//

import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    
    /// Internet radio station name. ID3 frame `TRSN`
    ///
    /// Contains the name of the internet radio station from which the audio is streamed.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Radio Station`
    var radioStation: String? {
        get {
            switch library {
                case .id3: return id3Tag.radioStation
                case .mp4: return mp4Tag["Radio Station"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.radioStation = newValue
                case .mp4: mp4Tag["Radio Station"] = newValue
            }
        }
    }
    
    /// Internet radio station owner. ID3 frame `TRSO`
    ///
    /// Contains the name of the owner of the internet radio station from which the audio is streamed.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Radio Station Owner`
    var radioStationOwner: String? {
        get {
            switch library {
                case .id3: return id3Tag.radioStationOwner
                case .mp4: return mp4Tag["Radio Station Owner"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.radioStationOwner = newValue
                case .mp4: mp4Tag["Radio Station Owner"] = newValue
            }
        }
    }

    /// Official Internet radio station homepage. ID3 frame `WORS`
    ///
    /// A URL pointing at the homepage of the internet radio station.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Radio Station Webpage`
    var radioStationWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.radioStationWebpage
                case .mp4: return mp4Tag["Radio Station Webpage"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.radioStationWebpage = newValue
                case .mp4: mp4Tag["Radio Station Webpage"] = newValue
            }
        }
    }
    
    /// Rating indicator for `clean`, `explicit`, or `none` MP4 atom `rtng`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Rating`
    var rating: Rating? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Rating"] {
                        return Rating(stringValue: string)
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.rating
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["Rating"] = new.stringValue
                    } else {
                        id3Tag["Rating"] = nil
                    }
                case .mp4: mp4Tag.rating = newValue
            }
        }
    }
    
    /// Name of file creator or maker MP4 atom `©mak`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Record Company`
    var recordCompany: String? {
        get {
            switch library {
                case .id3: return id3Tag["Record Company"]
                case .mp4: return mp4Tag.recordCompany
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Record Company"] = newValue
                case .mp4: mp4Tag.recordCompany = newValue
            }
        }
    }

    /// URL of file creator or maker MP4 atom `©mal`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedWebpage frame with the description `Record Company Webpage`
    var recordCompanyWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag["Record Company Webpage"]
                case .mp4: return mp4Tag.recordCompanyUrl
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Record Company Webpage"] = newValue
                case .mp4: mp4Tag.recordCompanyUrl = newValue
            }
        }
    }

    /// Recording copyright statement, aka producedNotice (id3) or phonogram rights (mp4). Normally preceded by the symbol (P) ( P in a circle) ID3 frame `TPRO`, MP4 atom `©phg`
    var recordingCopyright: String? {
        get {
            switch library {
                case .id3: return id3Tag.producedNotice
                case .mp4: return mp4Tag.recordingCopyright
            }
        }
        set {
            switch library {
                case .id3: id3Tag.producedNotice = newValue
                case .mp4: mp4Tag.recordingCopyright = newValue
            }
        }
    }
    
    /// Recording date/time. ID3 frame `TDRC` MP4 atom `©day`
    ///
    /// (versions 2.2 and 2.3 only) Intended to be used as complement to the "TYE", "TDA" and "TIM" frames. E.g. "4th-7th June, 12th June" in combination with the "TYE" frame.
    var recordingDateTime: Date? {
        get {
            switch library {
                case .id3: return id3Tag.recordingDateTime
                case .mp4: return mp4Tag.recordingDate
            }
        }
        set {
            switch library {
                case .id3: id3Tag.recordingDateTime = newValue
                case .mp4: mp4Tag.recordingDate = newValue
            }
        }
    }
    
    /// Release time/time. ID3 tag `TDRL` MP4 atom `rldt`
    ///
    /// Contains a timestamp describing when the audio was first released. NEW IN VERSION 2.4
    var releaseDateTime: Date? {
        get {
            switch library {
                case .id3: return id3Tag.releaseDateTime
                case .mp4: return mp4Tag.releaseDate
            }
        }
        set {
            switch library {
                case .id3: id3Tag.releaseDateTime = newValue
                case .mp4: mp4Tag.releaseDate = newValue
            }
        }
    }

    /// Special hardware and software requirements `©req`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Requirements`
    var requirements: String? {
        get {
            switch library {
                case .id3: return id3Tag["Requirements"]
                case .mp4: return mp4Tag.requirements
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Requirements"] = newValue
                case .mp4: mp4Tag.requirements = newValue
            }
        }
    }

    /// iTunes seller. ID MP4 atom "xid "
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SellerID`
    var sellerID: String? {
        get {
            switch library {
                case .id3: return id3Tag["SellerID"]
                case .mp4: return mp4Tag.sellerID
            }
        }
        set {
            switch library {
                case .id3: id3Tag["SellerID"] = newValue
                case .mp4: mp4Tag.sellerID = newValue
            }
        }
    }
    
    /// Set/track subtitle. ID3 frame `TSST` (set subtitle) MP4 atom `©st3` (track subtitle)
    ///
    /// Intended for the subtitle of the part of a set this track belongs to (ID3), or the subtitle of a track (MP4).
    var trackOrSetSubtitle: String? {
        get {
            switch library {
                case .id3: return id3Tag.setSubtitle
                case .mp4: return mp4Tag.trackSubtitle
            }
        }
        set {
            switch library {
                case .id3: id3Tag.setSubtitle = newValue
                case .mp4: mp4Tag.trackSubtitle = newValue
            }
        }
    }
    
    /// Boolean value indicating whether Work and Movement data should be displayed. MP4 atom`shwm`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Show work and movement`
    var showWorkAndMovement: Bool? {
        get {
            switch library {
                case .id3: if let string = id3Tag["Show Work and Movement"] {
                    if string == "1" {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return nil
                }
                case .mp4: return mp4Tag.showWorkAndMovement
            }
        }
        set {
            switch library {
                case .id3:  if let new = newValue {
                    if new == true {
                        id3Tag["Show Work and Movement"] = "1"
                    } else {
                        id3Tag["Show Work and Movement"] = "0"
                    }
                } else {
                    id3Tag["Show Work and Movement"] = nil
                }
                case .mp4: mp4Tag.showWorkAndMovement = newValue
            }
        }
    }
    
    /// Sound engineer of track. MP4 atom `©sne`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `soundEngineer`
    var soundEngineer: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.soundEngineer]?.toString
                case .mp4: return mp4Tag.soundEngineer
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag.addInvolvementCredit(role: .soundEngineer, person: new)
                    } else {
                        id3Tag.removeInvolvementCredit(role: .soundEngineer)
                    }
                case .mp4: mp4Tag.soundEngineer = newValue
            }
        }
    }
    
    /// Name and version number of the software (or hardware) that generated this movie. MP4 atom `©swr`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Software Version`
    var softwareVersion: String? {
        get {
            switch library {
                case .id3: return id3Tag["Software Version"]
                case .mp4: return mp4Tag.softwareVersion
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Software Version"] = newValue
                case .mp4: mp4Tag.softwareVersion = newValue
            }
        }
    }
    
    /// Featured soloist. MP4 atom `©sol`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `musicianCreditsList` frame with the role `soloist`
    var soloist: String? {
        get {
            switch library {
                case .id3: return id3Tag.musicianCreditsList[.soloist]?.toString
                case .mp4: return mp4Tag.soloist
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag.addMusicianCredit(role: .soloist, person: new)
                    } else {
                        id3Tag.removeMusicianCredit(role: .soloist)
                    }
                case .mp4: mp4Tag.soloist = newValue
            }
        }
    }
    
    /// Song description. MP4 atom `desc`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Song Description`
    var songDescription: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "Song Description", .und]
                case .mp4: return mp4Tag.songDescription
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: "Song Description", .und] = newValue
                case .mp4: mp4Tag.songDescription = newValue
            }
        }
    }
    
    /// Name of songwriter. MP4 atom `©swf`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `songwriter`
    var songwriter: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.songwriter]?.toString
                case .mp4: return mp4Tag.songwriter
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag.addInvolvementCredit(role: .songwriter, person: new)
                    } else {
                        id3Tag.removeInvolvementCredit(role: .songwriter)
                    }
                case .mp4: mp4Tag.songwriter = newValue
            }
        }
    }
    
    /// Keywords for songwriter. MP4 atom `©swk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Songwriter Keywords`
    var songwriterKeywords: [String] {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Songwriter Keywords"] {
                        return string.toArray
                    } else {
                        return []
                    }
                case .mp4: return mp4Tag.songwriterKeywords ?? []
            }
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        id3Tag["Songwriter Keywords"] = newValue.toString
                    } else {
                        id3Tag["Songwriter Keywords"] = nil
                    }
                case .mp4:
                    mp4Tag.songwriterKeywords = nil
            }
        }
    }
    
    /// Credits for those who provided movie source content. MP4 atom `©src`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SourceCredit`
    var sourceCredit: String? {
        get {
            switch library {
                case .id3: return id3Tag["Source Credit"]
                case .mp4: return mp4Tag.sourceCredit
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Source Credit"] = newValue
                case .mp4: mp4Tag.sourceCredit = newValue
            }
        }
    }
    
    /// Subtitle of content. ID3 frame `TIT3` MP4 atom `©snm`
    ///
    /// Used for information directly related to the contents title (e.g. "Op. 16" or "Performed live at Wembley").
    var subtitle: String? {
        get {
            switch library {
                case .id3: return id3Tag.subtitle
                case .mp4: return mp4Tag.subtitle
            }
        }
        set {
            switch library {
                case .id3: id3Tag.subtitle = newValue
                case .mp4: mp4Tag.subtitle = newValue
            }
        }
    }
    
    /// Subtitle keywords of the content. MP4 atom `©snk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Subtitle Keywords`
    var subtitleKeywords: [String] {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Subtitle Keywords"] {
                        return string.toArray
                    } else {
                        return []
                    }
                case .mp4: return mp4Tag.subtitleKeywords ?? []
            }
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        id3Tag["Subtitle Keywords"] = newValue.toString
                    } else {
                        id3Tag["Subtitle Keywords"] = nil
                    }
                case .mp4:
                    mp4Tag.subtitleKeywords = nil
            }
        }
    }
}
