//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/18/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
enum MetadataID_Int: CaseIterable {
    case albumID
    case appleStoreCountryID
    case artistID
    case bpm
    case composerID
    case conductorID
    case genreID
    case length
    case movementCount
    case movementNumber
    case playlistDelay
    case playlistID
    case tvEpisodeNumber
    case tvSeason
    case year
    
    var metadataItem: MetadataItem {
        switch self {
            case .albumID: return .albumID
            case .appleStoreCountryID: return .appleStoreCountryID
            case .artistID: return .artistID
            case .bpm: return .bpm
            case .composerID: return .composerID
            case .conductorID: return .conductorID
            case .genreID: return .genreID
            case .length: return .length
            case .movementCount: return .movementCount
            case .movementNumber: return .movementNumber
            case .playlistDelay: return .playlistDelay
            case .playlistID: return .playlistID
            case .tvEpisodeNumber: return .tvEpisodeNumber
            case .tvSeason: return .tvSeason
            case .year: return .year
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
    
    /// Accesses the MP4 `akID` atom.
    ///
    /// There is no equivalent frame for ID3, so this will create a `TXXX` freeform text frame with the description `AlbumID`
    public var albumID: Int? {
        get {
            if let value = self.get(.albumID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.albumID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `sfID` atom.
    ///
    /// There is no equivalent frame for ID3, so this will create a `TXXX` freeform text frame with the description `AppleCountryStoreID`
    public var appleStoreCountryID: Int? {
        get {
            if let value = self.get(.appleStoreCountryID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.appleStoreCountryID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `atID` atom.
    ///
    /// There is no equivalent frame for ID3, so this will create a `TXXX` freeform text frame with the description `ArtistID`
    public var artistID: Int? {
        get {
            if let value = self.get(.artistID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.artistID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `tmpo` atom, or the ID3 `TBPM` frame
    public var bpm: Int? {
        get {
            if let value = self.get(.bpm) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.bpm, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `cmID` atom.
    ///
    /// There is no equivalent frame for ID3, so this will create a `TXXX` freeform text frame with the description `ComposerID`
    public var composerID: Int? {
        get {
            if let value = self.get(.composerID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.composerID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `cnID` atom.
    ///
    /// There is no equivalent frame for ID3, so this will create a `TXXX` freeform text frame with the description `ConductorID`
    public var conductorID: Int? {
        get {
            if let value = self.get(.conductorID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.conductorID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `genr` atom
    ///
    /// There is no equivalent frame in ID3, so this will set the `genreCategory` parameter of the ID3 `genre` frame.
    ///
    /// Setting this option will store a integer value representing the selected genre. Some apps may not recognize or display this format correctly.
    public var genreID: (mp4Genre: Genre?, id3Genre: GenreType?) {
        get {
            switch library {
                case .mp4:
                    if let genre = mp4Tag.genreID {
                        return (genre, nil)
                    } else {
                        return (nil, nil)
                }
                case .id3:
                    if let genre = id3Tag.genre.genreCategory {
                        return (nil, genre)
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
                            mp4Tag.genreID = genre
                        } else {
                            mp4Tag.genreID = nil
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
                    case .mp4:
                        mp4Tag.genreID = nil
                    case .id3:
                        id3Tag.genre.genreCategory = nil
                }
            }
        }
    }
    
    /// Accesses the ID3 `TLEN` frame.
    ///
    /// There is no equivalent metadata atom for MP4, so this will return the value of the media duration stored in the `mvhd`.
    ///
    /// Since `SwiftTagger` does not handle editing the duration of the audio file, setting this to a different value is not recommended.
    public var length: Int? {
        get {
            if let value = self.get(.length) {
                return value
            } else {
                return nil
            }
        }
        set {
            _ = newValue
            /// this should prevent the value being changed
            set(.length, intValue: self.length)
        }
    }
    
    /// Accesses the MP4 atom `\u{00A9}mvc` or the ID3 frame `MVCN`
    public var movementCount: Int? {
        get {
            if let value = self.get(.movementCount) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.movementCount, intValue: newValue)
        }
    }

    /// Accesses the MP4 atom `\u{00A9}mvi` or the ID3 frame `MVCI`
    public var movementNumber: Int? {
        get {
            if let value = self.get(.movementNumber) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.movementNumber, intValue: newValue)
        }
    }
    
    /// Accesses the ID3 frame `TDLY`
    ///
    /// Since there is no equivalent atom for MP4, setting this accessor to `0` will change the MP4 `gaplessPlayback` atom to `true`. Setting it to `1` will change `gaplessPlayback` to false.
    /// This is the reverse of how such boolean-integer conversions are handled, however, since setting this value to `0` ensures gapless playback on the ID3 side, logically setting the playlist delay to `0` should equate to a `gaplessPlayback` value of `true`
    public var playlistDelay: Int? {
        get {
            switch library {
                case .id3:
                    if let value = self.get(.playlistDelay) {
                        return value
                    } else {
                        return nil
                }
                case .mp4:
                    if let int = self.get(.playlistDelay) {
                        return int
                    } else {
                        return nil
                }
            }
        }
       set {
            set(.playlistID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 `plID` atom.
    ///
    /// There is no equivalent frame for ID3, so this will create a `TXXX` freeform text frame with the description `PlaylistID`
    public var playlistID: Int? {
        get {
            if let value = self.get(.playlistID) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.playlistID, intValue: newValue)
        }
    }
    
    /// Accesses the MP4 atom `tves`
    ///
    /// There is no equivalent ID3 frame, so this accessor will create a freeform `TXXX` frame with the descriptor `TVEpisodeNumber`
    public var tvEpisodeNumber: Int? {
        get {
            if let value = self.get(.tvEpisodeNumber) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvEpisodeNumber, intValue: newValue)
        }
    }

    /// Accesses the MP4 atom `tvsn`
    ///
    /// There is no equivalent ID3 frame, so this accessor will create a freeform `TXXX` frame with the descriptor `TVSeason`
    public var tvSeason: Int? {
        get {
            if let value = self.get(.tvSeason) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.tvSeason, intValue: newValue)
        }
    }

    /// Accesses the MP4 atom `yrrc` or the id3 frame `TYER`
    public var year: Int? {
        get {
            if let value = self.get(.year) {
                return value
            } else {
                return nil
            }
        }
        set {
            set(.year, intValue: newValue)
        }
    }
}
