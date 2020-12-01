//
//  AudioFile.Accessors.O-.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 9/30/20.
//

import Foundation

@available(OSX 11.0, iOS 10.0, *)
extension AudioFile {
    
    /// Original album/movie/show title. ID3 frame `TOAL`
    ///
    /// Intended for the title of the original recording (or source of sound), if for example the music in the file should be a cover of a previously released song.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Album`
    public var originalAlbum: String? {
        get {
            switch library {
                case .id3: return id3Tag.originalAlbum
                case .mp4: return mp4Tag["Original Album"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.originalAlbum = newValue
                case .mp4: mp4Tag["Original Album"] = newValue
            }
        }
    }
    
    /// Original artist/performer. ID3 frame `TOPE` MP4 atom `©ope`
    ///
    /// Intended for the performer of the original recording, if for example the music in the file should be a cover of a previously released song.
    public var originalArtist: String? {
        get {
            switch library {
                case .id3: return id3Tag.originalArtist
                case .mp4: return mp4Tag.originalArtist
            }
        }
        set {
            switch library {
                case .id3: id3Tag.originalArtist = newValue
                case .mp4: mp4Tag.originalArtist = newValue
            }
        }
    }
    
    /// Original filename. ID3 frame `TOFN`
    ///
    /// Contains the preferred filename for the file, since some media doesn't allow the desired length of the filename. The filename is case sensitive and includes its suffix.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Filename`
    public var originalFilename: String? {
        get {
            switch library {
                case .id3: return id3Tag.originalFilename
                case .mp4: return mp4Tag["Original Filename"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.originalFilename = newValue
                case .mp4: mp4Tag["Original Filename"] = newValue
            }
        }
    }
    
    /// Original lyricist/text writer. ID3 frame `TOLY`
    ///
    /// Intended for the text writer of the original recording, if for example the music in the file should be a cover of a previously released song.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Lyricist`
    public var originalLyricist: String? {
        get {
            switch library {
                case .id3: return id3Tag.originalLyricist
                case .mp4: return mp4Tag["Original Lyricist"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.originalLyricist = newValue
                case .mp4: mp4Tag["Original Lyricist"] = newValue
            }
        }
    }
    
    /// Original release time. ID3 frame `TDOR`
    ///
    /// Contains a timestamp describing when the original recording of the audio was released.
    ///
    /// There is no correspondin MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Release Date/Time`
    @available(OSX 11.0, iOS 10.0, *)
    public var originalReleaseDateTime: Date? {
        get {
            switch library {
                case .id3: return id3Tag.originalRelease
                case .mp4:
                    if let dateString = mp4Tag["Original Release Date/Time"] {
                        return dateString.attemptDateFromString
                    } else {
                        return nil
                    }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .id3: id3Tag.originalRelease = newValue
                    case .mp4:
                        let formatter = ISO8601DateFormatter()
                        formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
                        formatter.formatOptions = .withInternetDateTime
                        mp4Tag["Original Release Date/Time"] = formatter.string(from: new)
                }
            } else {
                switch library {
                    case .id3: id3Tag.originalRelease = nil
                    case .mp4: mp4Tag["Original Release Date/Time"] = nil
                }
            }
        }
    }
    
    /// File owner/licensee. ID3 frame `TOWN` MP4 atom `ownr`
    ///
    /// Contains the name of the owner or licensee of the file and it's contents.
    public var owner: String? {
        get {
            switch library {
                case .id3: return id3Tag.fileOwner
                case .mp4: return mp4Tag.owner
            }
        }
        set {
            switch library {
                case .id3: id3Tag.fileOwner = newValue
                case .mp4: mp4Tag.owner = newValue
            }
        }
    }
    
    /// Payment Webpage. ID3 frame `WPAY`
    ///
    /// URL pointing at a webpage that will handle the process of paying for this file.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Payment Webpage`
    public var paymentWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.paymentWebpage
                case .mp4: return mp4Tag["Payment Webpage"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.paymentWebpage = newValue
                case .mp4: mp4Tag["Payment Webpage"] = newValue
            }
        }
    }
    
    /// Names of performers MP4 atom `©prf`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `musicianCreditsList` frame with the role `performer`
    public var performers: [String] {
        get {
            switch library {
                case .id3: return id3Tag.musicianCreditsList[.performer] ?? []
                case .mp4: return mp4Tag.performers ?? []
            }
        }
        set {
            if !newValue.isEmpty {
                switch library {
                    case .id3: id3Tag.musicianCreditsList[.performer] = newValue
                    case .mp4: mp4Tag.performers = newValue
                }
            } else {
                switch library {
                    case .id3: id3Tag.musicianCreditsList[.performer] = nil
                    case .mp4: mp4Tag.performers = nil
                }
            }
        }
    }
    
    /// Playlist delay. ID3 frame `TDLY`
    ///
    /// Defines the numbers of milliseconds of silence that should be inserted before this audio. The value zero indicates that this is a part of a multifile audio track that should be played continuously.
    ///
    /// There is no corresponding MP4 atom. Instead, a 0 value entered here will result in the `gaplessPlayback` atom being set to `true`. Any other value in this atom will result in `gaplessPlayback` being set to `false`
    public var playlistDelay: Int? {
        get {
            switch library {
                case .id3: return id3Tag.playlistDelay
                case .mp4:
                    if mp4Tag.gaplessPlayback == true {
                        return 0
                    } else {
                        return nil
                    }
            }
        }
        set {
            switch library {
                case .id3: id3Tag.playlistDelay = newValue
                case .mp4:
                    if newValue == 0 {
                        mp4Tag.gaplessPlayback = true
                    } else {
                        mp4Tag.gaplessPlayback = false
                    }
            }
        }
    }
    
    /// The iTunes playlist identifier MP4 atom `plID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `PlaylistID`
    public var playlistID: Int? {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["PlaylistID"] {
                        if let int = Int(string) {
                            return int
                        } else {
                            return nil
                        }
                    } else {
                        return nil
                    }
                case .mp4: return mp4Tag.playlistID
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag["PlaylistID"] = String(new)
                    } else {
                        id3Tag["PlaylistID"] = nil
                    }
                case .mp4: mp4Tag.playlistID = newValue
            }
        }
    }
    
    /// Boolean value indicating whether or not the track is a podcast MP4 atom `pcst`
    ///
    /// While there *is* a corresponding frame for ID3 with the identifier (`PCST`), attempts to implement this frame in SwiftTaggerID3 resulted in files that iTunes/Apple Music wouldn't recognize, so this value will not retrieve or set a frame for ID3
    public var podcast: Bool? {
        get {
            switch library {
                case .id3: return nil
                case .mp4: return mp4Tag.podcast
            }
        }
        set {
            switch library {
                case .id3: return
                case .mp4: mp4Tag.podcast = newValue
            }
        }
    }
    
    /// Podcast Category. ID3 frame `TCAT` MP4 atom `catg`
    ///
    /// Used by iTunes to categorize podcasts
    public var podcastCategory: String? {
        get {
            switch library {
                case .id3: return id3Tag.podcastCategory
                case .mp4: return mp4Tag.category
            }
        }
        set {
            switch library {
                case .id3: id3Tag.podcastCategory = newValue
                case .mp4: mp4Tag.category = newValue
            }
        }
    }
    
    /// Podcast Description. ID3 frame `TDES`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to the `songDescription` atom, since it is unlikely both will be in use at the same time
    public var podcastDescription: String? {
        get {
            switch library {
                case .id3: return id3Tag.podcastDescription
                case .mp4: return mp4Tag.songDescription
            }
        }
        set {
            switch library {
                case .id3: id3Tag.podcastDescription = newValue
                case .mp4: mp4Tag.songDescription = newValue
            }
        }
    }
    
    /// PodcastID. ID3 frame `TGID` MP4 atom `egid`
    ///
    /// Used by iTunes to list a podcast's ID
    public var podcastID: String? {
        get {
            switch library {
                case .id3: return id3Tag.podcastID
                case .mp4: return mp4Tag.podcastID
            }
        }
        set {
            switch library {
                case .id3: id3Tag.podcastID = newValue
                case .mp4: mp4Tag.podcastID = newValue
            }
        }
    }
    
    /// Podcast keywords. ID3 frame `TKWD` MP3 atom `keyw`
    ///
    /// Used by iTunes to for keywords describing a podcast
    public var podcastKeywords: [String] {
        get {
            switch library {
                case .id3: return id3Tag.podcastKeywords 
                case .mp4: return mp4Tag.keywords ?? []
            }
        }
        set {
            switch library {
                case .id3: id3Tag.podcastKeywords = newValue
                case .mp4: mp4Tag.keywords = newValue
            }
        }
    }
    
    /// Podcast feed. ID3 frame `WFED` MP4 atom `purl`
    ///
    /// Used by iTunes to list the web feed of a podcast (despite the identifier beginning with W in ID3, this is a string frame
    public var podcastFeed: String? {
        get {
            switch library {
                case .id3: return id3Tag.podcastFeed
                case .mp4: return mp4Tag.podcastFeed
            }
        }
        set {
            switch library {
                case .id3: id3Tag.podcastFeed = newValue
                case .mp4: mp4Tag.podcastFeed = newValue
            }
        }
    }
    
    /// Name of producer. MP4 atom `©prd`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `producer`
    public var producer: String? {
        get {
            switch library {
                case .id3: return id3Tag.involvementCreditsList[.producer]?.toString
                case .mp4: return mp4Tag.producer
            }
        }
        set {
            switch library {
                case .id3:
                    if let new = newValue {
                        id3Tag.addInvolvementCredit(role: .producer, person: new)
                    } else {
                        id3Tag.removeInvolvementCredit(role: .producer)
                    }
                case .mp4: mp4Tag.producer = newValue
            }
        }
    }
    
    /// Keywords for producer. MP4 atom `©prk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Producer Keywords`
    public var producerKeywords: [String] {
        get {
            switch library {
                case .id3:
                    if let string = id3Tag["Producer Keywords"] {
                        return string.toArray
                    } else {
                        return []
                    }
                case .mp4: return mp4Tag.producerKeywords ?? []
            }
        }
        set {
            switch library {
                case .id3:
                    if !newValue.isEmpty {
                        id3Tag["Producer Keywords"] = newValue.toString
                    } else {
                        id3Tag["Producer Keywords"] = nil
                    }
                case .mp4:
                    mp4Tag.producerKeywords = nil
            }
        }
    }
    
    /// Publisher. ID3 frame `TPUB` MP4 atom `©pub`
    ///
    /// Simply contains the name of the label or publisher.
    public var publisher: String? {
        get {
            switch library {
                case .id3: return id3Tag.publisher
                case .mp4: return mp4Tag.publisher
            }
        }
        set {
            switch library {
                case .id3: id3Tag.publisher = newValue
                case .mp4: mp4Tag.publisher = newValue
            }
        }
    }

    /// Publishers official webpage. ID3 frame `WPUB`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Publisher Webpage`
    public var publisherWebpage: String? {
        get {
            switch library {
                case .id3: return id3Tag.publisherWebpage
                case .mp4: return mp4Tag["Publisher Webpage"]
            }
        }
        set {
            switch library {
                case .id3: id3Tag.publisherWebpage = newValue
                case .mp4: mp4Tag["Publisher Webpage"] = newValue
            }
        }
    }
    
    /// Purchase Date/Time. MP4 atom `purd`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Purchase Date/Time`
    public var purchaseDateTime: Date? {
        get {
            switch library {
                case .mp4: return mp4Tag.purchaseDate
                case .id3:
                    if let dateString = id3Tag["Purchase Date/Time"] {
                        return dateString.attemptDateFromString
                    } else {
                        return nil
                    }
            }
        }
        set {
            if let new = newValue {
                switch library {
                    case .mp4: mp4Tag.purchaseDate = newValue
                    case .id3:
                        let formatter = ISO8601DateFormatter()
                        formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
                        formatter.formatOptions = .withInternetDateTime
                        id3Tag["Purchase Date/Time"] = formatter.string(from: new)
                }
            } else {
                switch library {
                    case .mp4: mp4Tag.purchaseDate = nil
                    case .id3: id3Tag["Purchase Date/Time"] = nil
                }
            }
        }
    }
}
