//
//  AudioFile.Accessors.A.swift
//  
//
//  Created by Nolaine Crusher on 9/29/20.
//

import Foundation

@available(OSX 10.13, *)
extension AudioFile {
    /// Acknowledgments. MP4 atom `©cak`.
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Acknowledgments`
    var acknowledgment: String? {
        get {
            switch library {
                case .id3: return id3Tag["Acknowledgment"]
                case .mp4: return mp4Tag.acknowledgment
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag["Acknowledgment"] = new
                    case .mp4: mp4Tag.acknowledgment = new
                }
            } else {
                switch library {
                    case .id3: id3Tag["Acknowledgment"] = nil
                    case .mp4: mp4Tag.acknowledgment = nil
                }
            }
        }
    }
    
    /// Album title. ID3 frame `TALB`, MP4 atom `©alb`.
    ///
    /// Intended for the title of the recording (or source of sound) from which the audio in the file is taken.
    var album: String? {
        get {
            switch library {
                case .id3: return id3Tag.album
                case .mp4: return mp4Tag.album
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.album = new
                    case .mp4: mp4Tag.album = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.album = nil
                    case .mp4: mp4Tag.album = nil
                }
            }
        }
    }
    
    /// Album artist or band. ID3 frame `TPE2`, MP4 atom `aART`
    ///
    /// The ID3 spec describes this frame as: `Band/Orchestra/Accompaniment` frame used for additional information about the performers in the recording. But usually it just serves as the AlbumArtist frame
    var albumArtist: String? {
        get {
            switch library {
                case .id3: return id3Tag.albumArtist
                case .mp4: return mp4Tag.albumArtist
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.albumArtist = new
                    case .mp4: mp4Tag.albumArtist = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.albumArtist = nil
                    case .mp4: mp4Tag.albumArtist = nil
                }
            }
        }
    }
    
    /// Album artist sort order. ID3 frame `TSO2`, MP4 atom `soaa`
    ///
    /// Defines a string which should be used instead of the performer for sorting purposes.
    var albumArtistSort: String? {
        get {
            switch library {
                case .id3: return id3Tag.albumArtistSort
                case .mp4: return mp4Tag.albumArtistSort
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.albumArtistSort = new
                    case .mp4: mp4Tag.albumArtistSort = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.albumArtistSort = nil
                    case .mp4: mp4Tag.albumArtistSort = nil
                }
            }
        }
    }
    
    /// Album sort order. ID3 frame `TSOA`, MP4 atom `soal`
    ///
    /// Defines a string which should be used instead of the album name for sorting purposes. E.g. an album named "A Soundtrack" might preferably be sorted as "Soundtrack".
    var albumSort: String? {
        get {
            switch library {
                case .id3: return id3Tag.albumSort
                case .mp4: return mp4Tag.albumSort
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.albumSort = new
                    case .mp4: mp4Tag.albumSort = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.albumSort = nil
                    case .mp4: mp4Tag.albumSort = nil
                }
            }
        }
    }
    
    /// The country code of the iTunes store. MP4 atom `sfID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `iTunesStoreCountry`
    var appleStoreCountryID: Int? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["AppleStoreCountryID"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.appleStoreCountryID
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag["AppleStoreCountryID"] = String(new)
                    case .mp4: mp4Tag.appleStoreCountryID = new
                }
            } else {
                switch library {
                    case .id3: id3Tag["AppleStoreCountryID"] = nil
                    case .mp4: mp4Tag.appleStoreCountryID = nil
                }
            }
        }
    }
    
    /// Interpreted, remixed, or otherwise modified by. ID3 frame `TSE4`, MP4 atom `©arg`
    ///
    /// Contains more information about the people behind a remix and similar interpretations of another existing piece.
    var arranger: String? {
        get {
            switch library {
                case .id3: return id3Tag.arranger
                case .mp4: return mp4Tag.arranger
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.arranger = new
                    case .mp4: mp4Tag.arranger = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.arranger = nil
                    case .mp4: mp4Tag.arranger = nil
                }
            }
        }
    }
    
    /// Keywords for arranger. MP4 atom `©ark`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ArrangerKeywords`
    var arrangerKeywords: [String] {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Arranger Keywords"] {
                        return string.toArray
                    } else {
                        return []
                    }
                case .mp4: return mp4Tag.arrangerKeywords ?? []
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3: id3Tag["Arranger Keywords"] = newValue.toString
                    case .mp4: mp4Tag.arrangerKeywords = newValue
                }
            } else {
                switch library {
                    case .id3: id3Tag["Arranger Keywords"] = nil
                    case .mp4: mp4Tag.arrangerKeywords = nil
                }
            }
        }
    }
    
    /// The art director of the movie. MP4 atom `©ard`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `artDirection`
    var artDirector: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.artDirection]?.toString
                case .mp4: return mp4Tag.artDirector
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.involvementCreditsList[.artDirection] = new.toArray
                    case .mp4: mp4Tag.artDirector = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.involvementCreditsList[.artDirection] = nil
                    case .mp4: mp4Tag.artDirector = nil
                }
            }
        }
    }
    
    /// Lead artist/Lead performer/Soloist/Performing group. ID3 frame `TPE1` MP4 atom `©ART`
    ///
    /// The main artist. Also commonly used in audiobook metadata for the name of a book's author.
    var artist: String? {
        get {
            switch library {
                case .id3: return id3Tag.artist
                case .mp4: return mp4Tag.artist
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.artist = new
                    case .mp4: mp4Tag.artist = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.artist = nil
                    case .mp4: mp4Tag.artist = nil
                }
            }
        }
    }
    
    /// The iTunes-store artist identifier. MP4 atom `atID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ArtistID`
    var artistID: Int? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["ArtistID"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.artistID
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag["ArtistID"] = String(new)
                    case .mp4: mp4Tag.artistID = new
                }
            } else {
                switch library {
                    case .id3: id3Tag["ArtistID"] = nil
                    case .mp4: mp4Tag.artistID = nil
                }
            }
        }
    }
    
    /// Keywords of main artist/performer. MP4 atom `©prk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Artist Keywords`
    var artistKeywords: [String] {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Artist Keywords"] {
                        return string.toArray
                    } else {
                        return []
                    }
                case .mp4: return mp4Tag.artistKeywords ?? []
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3: id3Tag["Artist Keywords"] = newValue.toString
                    case .mp4: mp4Tag.artistKeywords = newValue
                }
            } else {
                switch library {
                    case .id3: id3Tag["Artist Keywords"] = nil
                    case .mp4: mp4Tag.artistKeywords = nil
                }
            }
        }
    }
    
    /// Used for sorting by performer in iTunes. ID3 frame `TSOP` MP4 atom `soar`
    var artistSort: String? {
        get {
            switch library {
                case .id3: return id3Tag.artistSort
                case .mp4: return mp4Tag.artistSort
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.artistSort = new
                    case .mp4: mp4Tag.artistSort = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.artistSort = nil
                    case .mp4: mp4Tag.artistSort = nil
                }
            }
        }
    }
    
    /// Official artist/performer webpage. ID3 frame `WOAR` MP4 atom `©prl`
    ///
    /// A URL pointing at the artists official webpage. There may be more than one "WOAR" frame in a tag if the audio contains more than one performer, but not with the same content.
    var artistWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.artistWebpage
                case .mp4: return mp4Tag.artistUrl
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.artistWebpage = new
                    case .mp4: mp4Tag.artistUrl = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.artistWebpage = nil
                    case .mp4: mp4Tag.artistUrl = nil
                }
            }
        }
    }
    
    /// Official audio file webpage. ID3 frame `WOAF`
    ///
    /// URL pointing at a file specific webpage.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `AudioFileWebpage`
    var officialAudioFileWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.audioFileWebpage
                case .mp4: return mp4Tag["Audio File Webpage"]
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.audioFileWebpage = new
                    case .mp4: mp4Tag["Audio File Webpage"] = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.audioFileWebpage = nil
                    case .mp4: mp4Tag["Audio File Webpage"] = nil
                }
            }
        }
    }
    
    /// Official audio source webpage. ID3 frame `WOAS`
    ///
    /// URL pointing at the official webpage for the source of the audio file, e.g. a movie.
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `AudioSourceWebpage`
    var officialAudioSourceWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.audioSourceWebpage
                case .mp4: return mp4Tag["Audio Source Webpage"]
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.audioSourceWebpage = new
                    case .mp4: mp4Tag["Audio Source Webpage"] = new
                }
            } else {
                switch library {
                    case .id3: id3Tag.audioSourceWebpage = nil
                    case .mp4: mp4Tag["Audio Source Webpage"] = nil
                }
            }
        }
    }
}
