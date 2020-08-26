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
    case albumID // int 1
    case appleStoreCountryID // int 2
    case artistID // int 3
    case bpm // int 4
    case composerID // int 5
    case conductorID // int 6
    case genreID // int 7
    case length // int 8
    case movementCount // int 9
    case movementNumber // int 10
    case playlistDelay
    case playlistID // int 11
    case tvEpisodeNumber // int 12
    case tvSeason // int 13
    
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
        }
    }
}

@available(OSX 10.13, *)
extension AudioFile {
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
    
    public var genreID: (mp4Genre: Genres?, id3Genre: GenreType?) {
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
    
    public var length: Int? {
        get {
            if let value = self.get(.length) {
                return value
            } else {
                return nil
            }
        }
        set {
            return
        }
    }
    
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

}
