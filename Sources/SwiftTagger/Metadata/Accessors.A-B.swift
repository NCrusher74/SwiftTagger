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
            switch library {
                case .id3: id3Tag["Acknowledgment"] = newValue
                case .mp4: mp4Tag.acknowledgment = newValue
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
            switch library {
                case .id3: id3Tag.album = newValue
                case .mp4: mp4Tag.album = newValue
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
            switch library {
                case .id3: id3Tag.albumArtist = newValue
                case .mp4: mp4Tag.albumArtist = newValue
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
            switch library {
                case .id3: id3Tag.albumArtistSort = newValue
                case .mp4: mp4Tag.albumArtistSort = newValue
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
            switch library {
                case .id3: id3Tag.albumSort = newValue
                case .mp4: mp4Tag.albumSort = newValue
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
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["AppleStoreCountryID"] = String(new)
                    } else {
                        id3Tag["AppleStoreCountryID"] = nil
                    }
                case .mp4: mp4Tag.appleStoreCountryID = newValue
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
            switch library {
                case .id3: id3Tag.arranger = newValue
                case .mp4: mp4Tag.arranger = newValue
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
            switch library {
                case .id3: id3Tag.involvementCreditsList[.artDirection] = newValue?.toArray
                case .mp4: mp4Tag.artDirector = newValue
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
            switch library {
                case .id3: id3Tag.artist = newValue
                case .mp4: mp4Tag.artist = newValue
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
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["ArtistID"] = String(new)
                    } else {
                        id3Tag["ArtistID"] = nil
                    }
                case .mp4: mp4Tag.artistID = newValue
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
            switch library {
                case .id3: id3Tag.artistSort = newValue
                case .mp4: mp4Tag.artistSort = newValue
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
            switch library {
                case .id3: id3Tag.artistWebpage = newValue
                case .mp4: mp4Tag.artistUrl = newValue
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
            switch library {
                case .id3: id3Tag.audioFileWebpage = newValue
                case .mp4: mp4Tag["Audio File Webpage"] = newValue
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
            switch library {
                case .id3: id3Tag.audioSourceWebpage = newValue
                case .mp4: mp4Tag["Audio Source Webpage"] = newValue
            }
        }
    }
    
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
            switch library {
                case .id3: id3Tag.bpm = newValue
                case .mp4: mp4Tag.bpm = newValue
            }
        }
    }
}
