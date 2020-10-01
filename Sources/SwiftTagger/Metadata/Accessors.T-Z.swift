//
//  AudioFile.Accessors.T-Z.swift
//  
//
//  Created by Nolaine Crusher on 9/30/20.
//

import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    
    /// Tagging date/time. ID3 frame `TDTG`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Tagging Date`
    var taggingDateTime: Date? {
        get {
            switch library {
                case .id3: return id3Tag.encodingDateTime
                case .mp4:
                    if let dateString = mp4Tag["Tagging Date/Time"] {
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
                        mp4Tag["Tagging Date/Time"] = formatter.string(from: new)
                }
            } else {
                switch library {
                    case .id3: id3Tag.encodingDateTime = nil
                    case .mp4: mp4Tag["Tagging Date/Time"] = nil
                }
            }
        }
    }
    
    /// Title/Song name. ID3 frame `TIT2` MP4 atom `©nam`
    ///
    /// The actual name of the piece (e.g. "Adagio", "Hurricane Donna").
    ///
    /// For audiobooks that are stored in multiple files, this is usually the title of the part contained in the file, rather than the book title.
    var title: String? {
        get {
            switch library {
                case .id3: return id3Tag.title
                case .mp4: return mp4Tag.title
            }
        }
        set {
            switch library {
                case .id3: id3Tag.title = newValue
                case .mp4: mp4Tag.title = newValue
            }
        }
    }
    
    /// Title keywords of the content. MP4 atom `©nak`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Title Keywords`
    var titleKeywords: [String] {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Title Keywords"] {
                        return string.toArray
                    } else {
                        return []
                    }
                case .mp4: return mp4Tag.titleKeywords ?? []
            }
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        id3Tag["Title Keywords"] = newValue.toString
                    } else {
                        id3Tag["Title Keywords"] = nil
                    }
                case .mp4:
                    mp4Tag.titleKeywords = nil
            }
        }
    }

    /// Title sort order. ID3 frame `TSOT` MP4 atom`sonm`
    ///
    /// Defines a string which should be used instead of the title (TIT2) for sorting purposes.
    var titleSort: String? {
        get {
            switch library {
                case .id3: return id3Tag.titleSort
                case .mp4: return mp4Tag.titleSort
            }
        }
        set {
            switch library {
                case .id3: id3Tag.titleSort = newValue
                case .mp4: mp4Tag.titleSort = newValue
            }
        }
    }

    /// Thanks MP4 atom `©thx`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Thanks`
    var thanks: String? {
        get {
            switch library {
                case .id3: return id3Tag["Thanks"]
                case .mp4: return mp4Tag.thanks
            }
        }
        set {
            switch library {
                case .id3: id3Tag["Thanks"] = newValue
                case .mp4: mp4Tag.thanks = newValue
            }
        }
    }

    /// Track number/Position in set. ID3 frame `TRCK` MP4 atom `trkn`
    ///
    /// A numeric string containing the order number of the audio-file on its original recording. This MAY be extended with a "/" character and a numeric string containing the total number of tracks/elements on the original recording. E.g. "4/9".
    var trackNumber: (track: Int, totalTracks: Int?) {
        get {
            switch library {
                case .id3: return id3Tag.trackNumber 
                case .mp4: return mp4Tag.trackNumber 
            }
        }
        set {
            switch library {
                case .id3: id3Tag.trackNumber = newValue
                case .mp4: mp4Tag.trackNumber = newValue
            }
        }
    }

    /// MP4 atom `tves` (TV Episode Number)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesEpisodeNumber`
    var seriesEpisodeNumber: Int? {        
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["seriesEpisodeNumber"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.tvEpisodeNumber
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["seriesEpisodeNumber"] = String(new)
                    } else {
                        id3Tag["seriesEpisodeNumber"] = nil
                    }
                case .mp4: mp4Tag.tvEpisodeNumber = newValue
            }
        }
    }

    /// MP4 atom `tven` (TV Episode Title)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesEpisodeTitle`
    var seriesEpisodeTitle: String? {
        get {
            switch library {
                case .id3: return id3Tag["seriesEpisodeTitle"]
                case .mp4: return mp4Tag.tvEpisodeTitle
            }
        }
        set {
            switch library {
                case .id3: id3Tag["seriesEpisodeTitle"] = newValue
                case .mp4: mp4Tag.tvEpisodeTitle = newValue
            }
        }
    }
    
    /// MP4 atom `tvsn` (TV Season)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesSeason`
    var seriesSeason: Int? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["seriesSeason"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.tvSeason
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["seriesSeason"] = String(new)
                    } else {
                        id3Tag["seriesSeason"] = nil
                    }
                case .mp4: mp4Tag.tvSeason = newValue
            }
        }
    }
    
    /// MP4 atom `tvnn` (TV Network)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesNetworkOrChannel`
    var seriesNetworkOrChannel: String? {
        get {
            switch library {
                case .id3: return id3Tag["seriesNetworkOrChannel"]
                case .mp4: return mp4Tag.tvNetwork
            }
        }
        set {
            switch library {
                case .id3: id3Tag["seriesNetworkOrChannel"] = newValue
                case .mp4: mp4Tag.tvNetwork = newValue
            }
        }
    }

    /// MP4 atom `tvsh` (TV Show)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `series`
    var series: String? {
        get {
            switch library {
                case .id3: return id3Tag["series"]
                case .mp4: return mp4Tag.tvShow
            }
        }
        set {
            switch library {
                case .id3: id3Tag["series"] = newValue
                case .mp4: mp4Tag.tvShow = newValue
            }
        }
    }

    /// MP4 atom `sdes` (TV show description)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `SeriesDescription`
    var seriesDescription: String? {
        get {
            switch library {
                case .id3: return id3Tag[comment: "seriesDescription", .und]
                case .mp4: return mp4Tag.tvShowDescription
            }
        }
        set {
            switch library {
                case .id3: id3Tag[comment: "seriesDescription", .und] = newValue
                case .mp4: mp4Tag.tvShowDescription = newValue
            }
        }
    }

    /// MP4 atom `sosn` (sort by TV Show)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SeriesSort`
    var seriesSort: String? {
        get {
            switch library {
                case .id3: return id3Tag["seriesSort"]
                case .mp4: return mp4Tag.tvShowSort
            }
        }
        set {
            switch library {
                case .id3: id3Tag["seriesSort"] = newValue
                case .mp4: mp4Tag.tvShowSort = newValue
            }
        }
    }

    /// User Defined. ID3 frame `TXXX` MP4 atom `----`
    ///
    /// A freeform text frame/atom intended to hold user-defined items. Data is stored as a string, though it may be used for numeric strings (including boolean 1/0 strings), arrays, and so forth.
    subscript(_ description: String) -> String? {
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
    subscript(webpage description: String) -> String? {
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
    
    /// Work name/Content group description. ID3 frame `TT1/TIT1`, MP4 atom `©wrk`
    ///
    /// Used if the sound belongs to a larger category of sounds/music. For example, classical music is often sorted in different musical sections (e.g. "Piano Concerto", "Weather - Hurricane").
    ///
    /// For audiobooks, this may be used to contain series data
    var work: String? {
        get {
            switch library {
                case .id3: return id3Tag.contentGroup
                case .mp4: return mp4Tag.workName
            }
        }
        set {
            switch library {
                case .id3: id3Tag.contentGroup = newValue
                case .mp4: mp4Tag.workName = newValue
            }
        }
    }
    
    /// Name of movie’s writer. MP4 atom `©wrt`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeoplesList` frame with the role `writer`
    var writer: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.writer]?.toString
                case .mp4: return mp4Tag.writer
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag.addInvolvementCredit(role: .writer, person: new)
                    } else {
                        id3Tag.removeInvolvementCredit(role: .writer)
                    }
                case .mp4: mp4Tag.writer = newValue
            }
        }
    }

    /// Year. MP4 atom `yrrc`
    ///
    /// This is a read-only item that corresponds to the `year` value of the recording date/time.
    var year: Int? {
        if let date = self.recordingDateTime {
            let calendar = Calendar(identifier: .iso8601)
            let timeZone = TimeZone(secondsFromGMT: 0) ?? .current
            let components = calendar.dateComponents(in: timeZone, from: date)
            return components.year
        } else {
            return nil
        }
    }
}
