//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 8/17/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4

@available(OSX 10.13, *)
extension AudioFile {
    public var listMetadata: [(metadataID: MetadataItem, value: Any)] {
        var entries = [(MetadataItem, Any)]()
        if self.library == .mp4 {
            let tag = mp4Tag
            for item in tag.metadata {
                if let id = MetadataItem(from: item.identifier) {
                    let value = item.value
                    let entry = (id, value)
                    entries.append(entry)
                }
            }
        } else {
            let tag = id3Tag
            for item in tag.listMetadata() {
                if let id = MetadataItem(from: item.frameKey) {
                    let value = item.value
                    let entry = (id, value)
                    entries.append(entry)
                }
            }
        }
        return entries
    }
    
    func get(_ intMetadataID: MetadataID_Int) -> Int? {
        switch library {
            case .mp4:
                switch intMetadataID {
                    case .albumID:
                        return mp4Tag.albumID
                    case .appleStoreCountryID:
                        return mp4Tag.appleStoreCountryID
                    case .artistID:
                        return mp4Tag.artistID
                    case .bpm:
                        return mp4Tag.bpm
                    case .composerID:
                        return mp4Tag.composerID
                    case .conductorID:
                        return mp4Tag.conductorID
                    case .genreID:
                        return mp4Tag.genreID?.rawValue
                    case .length:
                        return mp4Tag.length
                    case .movementCount:
                        return mp4Tag.movementCount
                    case .movementNumber:
                        return mp4Tag.movementNumber
                    case .playlistID:
                        return mp4Tag.playlistID
                    case .tvEpisodeNumber:
                        return mp4Tag.tvEpisodeNumber
                    case .tvSeason:
                        return mp4Tag.tvSeason
                    case .playlistDelay:
                        if let bool = mp4Tag.gaplessPlayback {
                            if bool == true {
                                return 1
                            } else if bool == false {
                                return 0
                            }
                        } else {
                            return nil
                    }
            }
            case .id3:
                switch intMetadataID {
                    case .albumID:
                        return Int(id3Tag["albumID"] ?? "")
                    case .appleStoreCountryID:
                        return Int(id3Tag["appleStoreCountryID"] ?? "")
                    case .artistID:
                        return Int(id3Tag["artistID"] ?? "")
                    case .bpm:
                        return id3Tag.bpm
                    case .composerID:
                        return Int(id3Tag["composerID"] ?? "")
                    case .conductorID:
                        return Int(id3Tag["conductorID"] ?? "")
                    case .genreID:
                        return id3Tag.genre?.presetGenre?.code
                    case .length:
                        return id3Tag.length
                    case .movementCount:
                        return id3Tag.totalMovements
                    case .movementNumber:
                        return id3Tag.movementNumber
                    case .playlistID:
                        return Int(id3Tag["playlistID"] ?? "")
                    case .tvEpisodeNumber:
                        return Int(id3Tag["tvEpisodeNumber"] ?? "")
                    case .tvSeason:
                        return Int(id3Tag["tvSeason"] ?? "")
                    case .playlistDelay:
                        return id3Tag.playlistDelay
                }
        }; return nil
    }
    
    func get(_ stringMetadataID: MetadataID_String) -> String? {
        switch library {
            case .mp4:
                switch stringMetadataID {
                    case .acknowledgment: return mp4Tag.acknowledgment
                    case .album: return mp4Tag.album
                    case .albumArtist: return mp4Tag.albumArtist
                    case .albumArtistSort: return mp4Tag.albumArtistSort
                    case .albumSort: return mp4Tag.albumSort
                    case .arranger: return mp4Tag.arranger
                    case .artist: return mp4Tag.artist
                    case .artistSort: return mp4Tag.artistSort
                    case .artistWebpage: return mp4Tag.artistUrl
                    case .audioFileWebpage: return mp4Tag.audioFileWebpage
                    case .audioSourceWebpage: return mp4Tag.audioSourceWebpage
                    case .comment: return mp4Tag.comment
                    case .composer: return mp4Tag.composer
                    case .composerSort: return mp4Tag.composerSort
                    case .conductor: return mp4Tag.conductor
                    case .copyright: return mp4Tag.copyright
                    case .copyrightWebpage: return mp4Tag.copyrightWebpage
                    case .description: return mp4Tag.description
                    case .encodedBy: return mp4Tag.encodedBy
                    case .encodingSettings: return mp4Tag.encodingSettings
                    case .encodingTool: return mp4Tag.encodingTool
                    case .filmMakerWebpage: return mp4Tag.filmMakerUrl
                    case .genre: return mp4Tag.customGenre
                    case .grouping: return mp4Tag.grouping
                    case .information: return mp4Tag.information
                    case .isrc: return mp4Tag.isrc
                    case .label: return mp4Tag.label
                    case .linerNotes: return mp4Tag.linerNotes
                    case .longDescription: return mp4Tag.longDescription
                    case .lyricist: return mp4Tag.lyricist
                    case .lyrics: return mp4Tag.lyrics
                    case .mood: return mp4Tag.mood
                    case .movementName: return mp4Tag.movementName
                    case .narrator: return mp4Tag.narrator
                    case .originalAlbum: return mp4Tag.originalAlbum
                    case .originalArtist: return mp4Tag.originalArtist
                    case .originalFilename: return mp4Tag.originalFilename
                    case .originalLyricist: return mp4Tag.originalLyricist
                    case .owner: return mp4Tag.owner
                    case .paymentWebpage: return mp4Tag.paymentWebpage
                    case .podcastCategory: return mp4Tag.category
                    case .podcastDescription: return mp4Tag["Podcast Description"]
                    case .podcastFeed: return mp4Tag.podcastUrl
                    case .podcastID: return mp4Tag.podcastID
                    case .producedNotice: return mp4Tag.producedNotice
                    case .publisher: return mp4Tag.publisher
                    case .publisherWebpage: return mp4Tag.publisherUrl
                    case .radioStation: return mp4Tag.radioStation
                    case .radioStationOwner: return mp4Tag.radioStationOwner
                    case .radioStationWebpage: return mp4Tag.radioStationWebpage
                    case .recordCompany: return mp4Tag.recordCompany
                    case .recordingCopyright: return mp4Tag.recordingCopyright
                    case .requirements: return mp4Tag.requirements
                    case .sellerID: return mp4Tag.sellerID
                    case .softwareVersion: return mp4Tag.softwareVersion
                    case .songDescription: return mp4Tag.songDescription
                    case .sourceCredit: return mp4Tag.sourceCredit
                    case .subtitle: return mp4Tag.subtitle
                    case .thanks: return mp4Tag.thanks
                    case .title: return mp4Tag.title
                    case .titleSort: return mp4Tag.titleSort
                    case .trackSubtitle: return mp4Tag.trackSubtitle
                    case .tvEpisodeTitle: return mp4Tag.tvEpisodeTitle
                    case .tvNetwork: return mp4Tag.tvNetwork
                    case .tvShow: return mp4Tag.tvShow
                    case .tvShowDescription: return mp4Tag.tvShowDescription
                    case .tvShowSort: return mp4Tag.tvShowSort
                    case .website: return mp4Tag.website
                    case .work: return mp4Tag.workName
                    case .writer: return mp4Tag.writer
            }
            case .id3:
                switch stringMetadataID {
                    case .acknowledgment: return id3Tag["Acknowledgment"]
                    case .album: return id3Tag.album
                    case .albumArtist: return id3Tag.albumArtist
                    case .albumArtistSort: return id3Tag.albumArtistSort
                    case .albumSort: return id3Tag.albumSort
                    case .arranger: return id3Tag.arranger
                    case .artist: return id3Tag.artist
                    case .artistSort: return id3Tag.artistSort
                    case .artistWebpage: return id3Tag.artistWebpage
                    case .audioFileWebpage: return id3Tag.audioFileWebpage
                    case .audioSourceWebpage: return id3Tag.audioSourceWebpage
                    case .comment: return id3Tag["Comment", .und]
                    case .composer: return id3Tag.composer
                    case .composerSort: return id3Tag.composerSort
                    case .conductor: return id3Tag.conductor
                    case .copyright: return id3Tag.copyright
                    case .copyrightWebpage: return id3Tag.copyrightWebpage
                    case .description: return id3Tag["Description", .und]
                    case .encodedBy: return id3Tag.encodedBy
                    case .encodingSettings: return id3Tag.encodingSettings
                    case .encodingTool: return id3Tag["Encoding Tool"]
                    case .filmMakerWebpage: return id3Tag["Filmmaker Webpage"]
                    case .genre: return id3Tag.genre?.customGenre
                    case .grouping: return id3Tag.grouping
                    case .information: return id3Tag["Information"]
                    case .isrc: return id3Tag.isrc
                    case .label: return id3Tag.label
                    case .linerNotes: return id3Tag["Liner Notes", .und]
                    case .longDescription: return id3Tag["Long Description", .und]
                    case .lyricist: return id3Tag.lyricist
                    case .lyrics: return id3Tag[lyrics: "Lyrics", .und]
                    case .mood: return id3Tag.mood
                    case .movementName: return id3Tag.movementName
                    case .narrator: return id3Tag.narrator
                    case .originalAlbum: return id3Tag.originalAlbum
                    case .originalArtist: return id3Tag.originalArtist
                    case .originalFilename: return id3Tag.originalFilename
                    case .originalLyricist: return id3Tag.originalLyricist
                    case .owner: return id3Tag.fileOwner
                    case .paymentWebpage: return id3Tag.paymentWebpage
                    case .podcastCategory: return id3Tag.podcastCategory
                    case .podcastDescription: return id3Tag.podcastDescription
                    case .podcastFeed: return id3Tag.podcastFeedLink
                    case .podcastID: return id3Tag.podcastID
                    case .producedNotice: return id3Tag.producedNotice
                    case .publisher: return id3Tag.publisher
                    case .publisherWebpage: return id3Tag.publisherWebpage
                    case .radioStation: return id3Tag.radioStation
                    case .radioStationOwner: return id3Tag.radioStationOwner
                    case .radioStationWebpage: return id3Tag.radioStationWebpage
                    case .recordCompany: return id3Tag.recordCompany
                    case .recordingCopyright: return id3Tag["Recording Copyright"]
                    case .requirements: return id3Tag["Requirements"]
                    case .sellerID: return id3Tag["Seller ID"]
                    case .softwareVersion: return id3Tag["Software Version"]
                    case .songDescription: return id3Tag["Song Description", .und]
                    case .sourceCredit: return id3Tag["Source Credit"]
                    case .subtitle: return id3Tag.subtitle
                    case .thanks: return id3Tag["Thanks"]
                    case .title: return id3Tag.title
                    case .titleSort: return id3Tag.titleSort
                    case .trackSubtitle: return id3Tag.setSubtitle
                    case .tvEpisodeTitle: return id3Tag["TV Episode Title"]
                    case .tvNetwork: return id3Tag["Network"]
                    case .tvShow: return id3Tag["TV Show"]
                    case .tvShowDescription: return id3Tag["TV Show Description", .und]
                    case .tvShowSort: return id3Tag["TV Show Sort"]
                    case .website: return id3Tag[userDefinedUrl: "Website"]
                    case .work: return id3Tag.contentGroup
                    case .writer: return id3Tag["Writer"]
            }
        }
    }
    
    mutating func set(_ stringMetadataID: MetadataID_String, stringValue: String?) {
        if let string = stringValue {
            switch library {
                case .mp4:
                    switch stringMetadataID {
                        case .acknowledgment:
                            self.mp4Tag.acknowledgment = string
                        case .album:
                            self.mp4Tag.album = string
                        case .albumArtist:
                            self.mp4Tag.albumArtist = string
                        case .albumArtistSort:
                            self.mp4Tag.albumArtistSort = string
                        case .albumSort:
                            self.mp4Tag.albumSort = string
                        case .arranger:
                            self.mp4Tag.arranger = string
                        case .artist:
                            self.mp4Tag.artist = string
                        case .artistSort:
                            self.mp4Tag.artistSort = string
                        case .artistWebpage:
                            self.mp4Tag.artistUrl = string
                        case .audioFileWebpage:
                            self.mp4Tag.audioFileWebpage = string
                        case .audioSourceWebpage:
                            self.mp4Tag.audioSourceWebpage = string
                        case .comment:
                            self.mp4Tag.comment = string
                        case .composer:
                            self.mp4Tag.composer = string
                        case .composerSort:
                            self.mp4Tag.composerSort = string
                        case .conductor:
                            self.mp4Tag.conductor = string
                        case .copyright:
                            self.mp4Tag.copyright = string
                        case .copyrightWebpage:
                            self.mp4Tag.copyrightWebpage = string
                        case .description:
                            self.mp4Tag.description = string
                        case .encodedBy:
                            self.mp4Tag.encodedBy = string
                        case .encodingSettings:
                            self.mp4Tag.encodingSettings = string
                        case .encodingTool:
                            self.mp4Tag.encodingTool = string
                        case .filmMakerWebpage:
                            self.mp4Tag.filmMakerUrl = string
                        case .genre:
                            self.mp4Tag.customGenre = string
                        case .grouping:
                            self.mp4Tag.grouping = string
                        case .information:
                            self.mp4Tag.information = string
                        case .isrc:
                            self.mp4Tag.isrc = string
                        case .label:
                            self.mp4Tag.label = string
                        case .linerNotes:
                            self.mp4Tag.linerNotes = string
                        case .longDescription:
                            self.mp4Tag.longDescription = string
                        case .lyricist:
                            self.mp4Tag.lyricist = string
                        case .lyrics:
                            self.mp4Tag.lyrics = string
                        case .mood:
                            self.mp4Tag.mood = string
                        case .movementName:
                            self.mp4Tag.movementName = string
                        case .narrator:
                            self.mp4Tag.narrator = string
                        case .originalAlbum:
                            self.mp4Tag.originalAlbum = string
                        case .originalArtist:
                            self.mp4Tag.originalArtist = string
                        case .originalFilename:
                            self.mp4Tag.originalFilename = string
                        case .originalLyricist:
                            self.mp4Tag.originalLyricist = string
                        case .owner:
                            self.mp4Tag.owner = string
                        case .paymentWebpage:
                            self.mp4Tag.paymentWebpage = string
                        case .podcastCategory:
                            self.mp4Tag.category = string
                        case .podcastDescription:
                            self.mp4Tag["Podcast Description"] = string
                        case .podcastFeed:
                            self.mp4Tag.podcastUrl = string
                        case .podcastID:
                            self.mp4Tag.podcastID = string
                        case .producedNotice:
                            self.mp4Tag.producedNotice = string
                        case .publisher:
                            self.mp4Tag.publisher = string
                        case .publisherWebpage:
                            self.mp4Tag.publisherUrl = string
                        case .radioStation:
                            self.mp4Tag.radioStation = string
                        case .radioStationOwner:
                            self.mp4Tag.radioStationOwner = string
                        case .radioStationWebpage:
                            self.mp4Tag.radioStationWebpage = string
                        case .recordCompany:
                            self.mp4Tag.recordCompany = string
                        case .recordingCopyright:
                            self.mp4Tag.recordingCopyright = string
                        case .requirements:
                            self.mp4Tag.requirements = string
                        case .sellerID:
                            self.mp4Tag.sellerID = string
                        case .softwareVersion:
                            self.mp4Tag.softwareVersion = string
                        case .songDescription:
                            self.mp4Tag.songDescription = string
                        case .sourceCredit:
                            self.mp4Tag.sourceCredit = string
                        case .subtitle:
                            self.mp4Tag.subtitle = string
                        case .title:
                            self.mp4Tag.title = string
                        case .titleSort:
                            self.mp4Tag.titleSort = string
                        case .thanks:
                            self.mp4Tag.thanks = string
                        case .trackSubtitle:
                            self.mp4Tag.trackSubtitle = string
                        case .tvEpisodeTitle:
                            self.mp4Tag.tvEpisodeTitle = string
                        case .tvNetwork:
                            self.mp4Tag.tvNetwork = string
                        case .tvShow:
                            self.mp4Tag.tvShow = string
                        case .tvShowDescription:
                            self.mp4Tag.tvShowDescription = string
                        case .tvShowSort:
                            self.mp4Tag.tvShowSort = string
                        case .website:
                            self.mp4Tag.website = string
                        case .work:
                            self.mp4Tag.workName = string
                        case .writer:
                            self.mp4Tag.writer = string
                }
                case .id3:
                    switch stringMetadataID {
                        case .acknowledgment:
                            self.id3Tag["Acknowledgment"] = string
                        case .album:
                            self.id3Tag.album = string
                        case .albumArtist:
                            self.id3Tag.albumArtist = string
                        case .albumArtistSort:
                            self.id3Tag.albumArtistSort = string
                        case .albumSort:
                            self.id3Tag.albumSort = string
                        case .arranger:
                            self.id3Tag.arranger = string
                        case .artist:
                            self.id3Tag.artist = string
                        case .artistSort:
                            self.id3Tag.artistSort = string
                        case .artistWebpage:
                            self.id3Tag.artistWebpage = string
                        case .audioFileWebpage:
                            self.id3Tag.audioFileWebpage = string
                        case .audioSourceWebpage:
                            self.id3Tag.audioSourceWebpage = string
                        case .comment:
                            self.id3Tag["Comment", .und] = string
                        case .composer:
                            self.id3Tag.composer = string
                        case .composerSort:
                            self.id3Tag.composerSort = string
                        case .conductor:
                            self.id3Tag.conductor = string
                        case .copyright:
                            self.id3Tag.copyright = string
                        case .copyrightWebpage:
                            self.id3Tag.copyrightWebpage = string
                        case .description:
                            self.id3Tag["Description", .und] = string
                        case .encodedBy:
                            self.id3Tag.encodedBy = string
                        case .encodingSettings:
                            self.id3Tag.encodingSettings = string
                        case .encodingTool:
                            self.id3Tag["Encoding Tool"] = string
                        case .filmMakerWebpage:
                            self.id3Tag["Filmmaker Webpage"] = string
                        case .genre:
                            self.id3Tag.genre?.customGenre = string
                        case .grouping:
                            self.id3Tag.grouping = string
                        case .information:
                            self.id3Tag["Information"] = string
                        case .isrc:
                            self.id3Tag.isrc = string
                        case .label:
                            self.id3Tag.label = string
                        case .linerNotes:
                            self.id3Tag["Liner Notes", .und] = string
                        case .longDescription:
                            self.id3Tag["Long Description", .und] = string
                        case .lyrics:
                            self.id3Tag[lyrics: "Lyrics", .und] = string
                        case .lyricist:
                            self.id3Tag.lyricist = string
                        case .mood:
                            self.id3Tag.mood = string
                        case .movementName:
                            self.id3Tag.movementName = string
                        case .narrator:
                            self.id3Tag.composer = string
                        case .originalAlbum:
                            self.id3Tag.originalAlbum = string
                        case .originalArtist:
                            self.id3Tag.originalArtist = string
                        case .originalFilename:
                            self.id3Tag.originalFilename = string
                        case .originalLyricist:
                            self.id3Tag.originalLyricist = string
                        case .owner:
                            self.id3Tag.fileOwner = string
                        case .paymentWebpage:
                            self.id3Tag.paymentWebpage = string
                        case .podcastCategory:
                            self.id3Tag.podcastCategory = string
                        case .podcastDescription:
                            self.id3Tag.podcastDescription = string
                        case .podcastFeed:
                            self.id3Tag.podcastFeedLink = string
                        case .podcastID:
                            self.id3Tag.podcastID = string
                        case .producedNotice:
                            self.id3Tag.producedNotice = string
                        case .publisher:
                            self.id3Tag.publisher = string
                        case .publisherWebpage:
                            self.id3Tag.publisherWebpage = string
                        case .radioStation:
                            self.id3Tag.radioStation = string
                        case .radioStationOwner:
                            self.id3Tag.radioStationOwner = string
                        case .radioStationWebpage:
                            self.id3Tag.radioStationWebpage = string
                        case .recordCompany:
                            self.id3Tag.recordCompany = string
                        case .recordingCopyright:
                            self.id3Tag["Recording Copyright"] = string
                        case .requirements:
                            self.id3Tag["Requirements"] = string
                        case .sellerID:
                            self.id3Tag["Seller ID"] = string
                        case .softwareVersion:
                            self.id3Tag["Software Version"] = string
                        case .songDescription:
                            self.id3Tag["Song Description", .und] = string
                        case .sourceCredit:
                            self.id3Tag["Source Credit"] = string
                        case .subtitle:
                            self.id3Tag.subtitle = string
                        case .title:
                            self.id3Tag.title = string
                        case .titleSort:
                            self.id3Tag.titleSort = string
                        case .thanks:
                            self.id3Tag["Thanks"] = string
                        case .trackSubtitle:
                            self.id3Tag.setSubtitle = string
                        case .tvEpisodeTitle:
                            self.id3Tag["TV Episode Title"] = string
                        case .tvNetwork:
                            self.id3Tag["Network"] = string
                        case .tvShow:
                            self.id3Tag["TV Show"] = string
                        case .tvShowDescription:
                            self.id3Tag["TV Show Description", .und] = string
                        case .tvShowSort:
                            self.id3Tag["TV Show Sort"] = string
                        case .website:
                            self.id3Tag[userDefinedUrl: "Website"] = string
                        case .work:
                            self.id3Tag.contentGroup = string
                        case .writer:
                            self.id3Tag["Writer"] = string
                }
            }
        } else {
            switch library {
                case .mp4:
                    switch stringMetadataID {
                        case .acknowledgment:
                            self.mp4Tag.acknowledgment = nil
                        case .album:
                            self.mp4Tag.album = nil
                        case .albumArtist:
                            self.mp4Tag.albumArtist = nil
                        case .albumArtistSort:
                            self.mp4Tag.albumArtistSort = nil
                        case .albumSort:
                            self.mp4Tag.albumSort = nil
                        case .arranger:
                            self.mp4Tag.arranger = nil
                        case .artist:
                            self.mp4Tag.artist = nil
                        case .artistSort:
                            self.mp4Tag.artistSort = nil
                        case .artistWebpage:
                            self.mp4Tag.artistUrl = nil
                        case .audioFileWebpage:
                            self.mp4Tag.audioFileWebpage = nil
                        case .audioSourceWebpage:
                            self.mp4Tag.audioSourceWebpage = nil
                        case .comment:
                            self.mp4Tag.comment = nil
                        case .composer:
                            self.mp4Tag.composer = nil
                        case .composerSort:
                            self.mp4Tag.composerSort = nil
                        case .conductor:
                            self.mp4Tag.conductor = nil
                        case .copyright:
                            self.mp4Tag.copyright = nil
                        case .copyrightWebpage:
                            self.mp4Tag.copyrightWebpage = nil
                        case .description:
                            self.mp4Tag.description = nil
                        case .encodedBy:
                            self.mp4Tag.encodedBy = nil
                        case .encodingSettings:
                            self.mp4Tag.encodingSettings = nil
                        case .encodingTool:
                            self.mp4Tag.encodingTool = nil
                        case .filmMakerWebpage:
                            self.mp4Tag.filmMakerUrl = nil
                        case .genre:
                            self.mp4Tag.customGenre = nil
                        case .grouping:
                            self.mp4Tag.grouping = nil
                        case .information:
                            self.mp4Tag.information = nil
                        case .isrc:
                            self.mp4Tag.isrc = nil
                        case .label:
                            self.mp4Tag.label = nil
                        case .linerNotes:
                            self.mp4Tag.linerNotes = nil
                        case .longDescription:
                            self.mp4Tag.longDescription = nil
                        case .lyricist:
                            self.mp4Tag.lyricist = nil
                        case .lyrics:
                            self.mp4Tag.lyrics = nil
                        case .mood:
                            self.mp4Tag.mood = nil
                        case .movementName:
                            self.mp4Tag.movementName = nil
                        case .narrator:
                            self.mp4Tag.narrator = nil
                        case .originalAlbum:
                            self.mp4Tag.originalAlbum = nil
                        case .originalArtist:
                            self.mp4Tag.originalArtist = nil
                        case .originalFilename:
                            self.mp4Tag.originalFilename = nil
                        case .originalLyricist:
                            self.mp4Tag.originalLyricist = nil
                        case .owner:
                            self.mp4Tag.owner = nil
                        case .paymentWebpage:
                            self.mp4Tag.paymentWebpage = nil
                        case .podcastCategory:
                            self.mp4Tag.category = nil
                        case .podcastDescription:
                            self.mp4Tag["Podcast Description"] = nil
                        case .podcastFeed:
                            self.mp4Tag.podcastUrl = nil
                        case .podcastID:
                            self.mp4Tag.podcastID = nil
                        case .producedNotice:
                            self.mp4Tag.producedNotice = nil
                        case .publisher:
                            self.mp4Tag.publisher = nil
                        case .publisherWebpage:
                            self.mp4Tag.publisherUrl = nil
                        case .radioStation:
                            self.mp4Tag.radioStation = nil
                        case .radioStationOwner:
                            self.mp4Tag.radioStationOwner = nil
                        case .radioStationWebpage:
                            self.mp4Tag.radioStationWebpage = nil
                        case .recordCompany:
                            self.mp4Tag.recordCompany = nil
                        case .recordingCopyright:
                            self.mp4Tag.recordingCopyright = nil
                        case .requirements:
                            self.mp4Tag.requirements = nil
                        case .sellerID:
                            self.mp4Tag.sellerID = nil
                        case .softwareVersion:
                            self.mp4Tag.softwareVersion = nil
                        case .songDescription:
                            self.mp4Tag.songDescription = nil
                        case .sourceCredit:
                            self.mp4Tag.sourceCredit = nil
                        case .subtitle:
                            self.mp4Tag.subtitle = nil
                        case .title:
                            self.mp4Tag.title = nil
                        case .titleSort:
                            self.mp4Tag.titleSort = nil
                        case .thanks:
                            self.mp4Tag.thanks = nil
                        case .trackSubtitle:
                            self.mp4Tag.trackSubtitle = nil
                        case .tvEpisodeTitle:
                            self.mp4Tag.tvEpisodeTitle = nil
                        case .tvNetwork:
                            self.mp4Tag.tvNetwork = nil
                        case .tvShow:
                            self.mp4Tag.tvShow = nil
                        case .tvShowDescription:
                            self.mp4Tag.tvShowDescription = nil
                        case .tvShowSort:
                            self.mp4Tag.tvShowSort = nil
                        case .website:
                            self.mp4Tag.website = nil
                        case .work:
                            self.mp4Tag.workName = nil
                        case .writer:
                            self.mp4Tag.writer = nil
                }
                case .id3:
                    switch stringMetadataID {
                        case .acknowledgment:
                            self.id3Tag["Acknowledgment"] = nil
                        case .album:
                            self.id3Tag.album = nil
                        case .albumArtist:
                            self.id3Tag.albumArtist = nil
                        case .albumArtistSort:
                            self.id3Tag.albumArtistSort = nil
                        case .albumSort:
                            self.id3Tag.albumSort = nil
                        case .arranger:
                            self.id3Tag.arranger = nil
                        case .artist:
                            self.id3Tag.artist = nil
                        case .artistSort:
                            self.id3Tag.artistSort = nil
                        case .artistWebpage:
                            self.id3Tag.artistWebpage = nil
                        case .audioFileWebpage:
                            self.id3Tag.audioFileWebpage = nil
                        case .audioSourceWebpage:
                            self.id3Tag.audioSourceWebpage = nil
                        case .comment:
                            self.id3Tag["Comment", .und] = nil
                        case .composer:
                            self.id3Tag.composer = nil
                        case .composerSort:
                            self.id3Tag.composerSort = nil
                        case .conductor:
                            self.id3Tag.conductor = nil
                        case .copyright:
                            self.id3Tag.copyright = nil
                        case .copyrightWebpage:
                            self.id3Tag.copyrightWebpage = nil
                        case .description:
                            self.id3Tag["Description", .und] = nil
                        case .encodedBy:
                            self.id3Tag.encodedBy = nil
                        case .encodingSettings:
                            self.id3Tag.encodingSettings = nil
                        case .encodingTool:
                            self.id3Tag["Encoding Tool"] = nil
                        case .filmMakerWebpage:
                            self.id3Tag["Filmmaker Webpage"] = nil
                        case .genre:
                            self.id3Tag.genre?.customGenre = nil
                        case .grouping:
                            self.id3Tag.grouping = nil
                        case .information:
                            self.id3Tag["Information"] = nil
                        case .isrc:
                            self.id3Tag.isrc = nil
                        case .label:
                            self.id3Tag.label = nil
                        case .linerNotes:
                            self.id3Tag["Liner Notes", .und] = nil
                        case .longDescription:
                            self.id3Tag["Long Description", .und] = nil
                        case .lyrics:
                            self.id3Tag[lyrics: "Lyrics", .und] = nil
                        case .lyricist:
                            self.id3Tag.lyricist = nil
                        case .mood:
                            self.id3Tag.mood = nil
                        case .movementName:
                            self.id3Tag.movementName = nil
                        case .narrator:
                            self.id3Tag.composer = nil
                        case .originalAlbum:
                            self.id3Tag.originalAlbum = nil
                        case .originalArtist:
                            self.id3Tag.originalArtist = nil
                        case .originalFilename:
                            self.id3Tag.originalFilename = nil
                        case .originalLyricist:
                            self.id3Tag.originalLyricist = nil
                        case .owner:
                            self.id3Tag.fileOwner = nil
                        case .paymentWebpage:
                            self.id3Tag.paymentWebpage = nil
                        case .podcastCategory:
                            self.id3Tag.podcastCategory = nil
                        case .podcastDescription:
                            self.id3Tag.podcastDescription = nil
                        case .podcastFeed:
                            self.id3Tag.podcastFeedLink = nil
                        case .podcastID:
                            self.id3Tag.podcastID = nil
                        case .producedNotice:
                            self.id3Tag.producedNotice = nil
                        case .publisher:
                            self.id3Tag.publisher = nil
                        case .publisherWebpage:
                            self.id3Tag.publisherWebpage = nil
                        case .radioStation:
                            self.id3Tag.radioStation = nil
                        case .radioStationOwner:
                            self.id3Tag.radioStationOwner = nil
                        case .radioStationWebpage:
                            self.id3Tag.radioStationWebpage = nil
                        case .recordCompany:
                            self.id3Tag.recordCompany = nil
                        case .recordingCopyright:
                            self.id3Tag["Recording Copyright"] = nil
                        case .requirements:
                            self.id3Tag["Requirements"] = nil
                        case .sellerID:
                            self.id3Tag["Seller ID"] = nil
                        case .softwareVersion:
                            self.id3Tag["Software Version"] = nil
                        case .songDescription:
                            self.id3Tag["Song Description", .und] = nil
                        case .sourceCredit:
                            self.id3Tag["Source Credit"] = nil
                        case .subtitle:
                            self.id3Tag.subtitle = nil
                        case .title:
                            self.id3Tag.title = nil
                        case .titleSort:
                            self.id3Tag.titleSort = nil
                        case .thanks:
                            self.id3Tag["Thanks"] = nil
                        case .trackSubtitle:
                            self.id3Tag.setSubtitle = nil
                        case .tvEpisodeTitle:
                            self.id3Tag["TV Episode Title"] = nil
                        case .tvNetwork:
                            self.id3Tag["Network"] = nil
                        case .tvShow:
                            self.id3Tag["TV Show"] = nil
                        case .tvShowDescription:
                            self.id3Tag["TV Show Description", .und] = nil
                        case .tvShowSort:
                            self.id3Tag["TV Show Sort"] = nil
                        case .website:
                            self.id3Tag[userDefinedUrl: "Website"] = nil
                        case .work:
                            self.id3Tag.contentGroup = nil
                        case .writer:
                            self.id3Tag["Writer"] = nil
                }
            }
        }
    }
    
    mutating func set(_ intMetadataID: MetadataID_Int, intValue: Int?) {
        if let int = intValue {
            switch library {
                case .mp4:
                    switch intMetadataID {
                        case .albumID:
                            mp4Tag.albumID = int
                        case .appleStoreCountryID:
                            mp4Tag.appleStoreCountryID = int
                        case .artistID:
                            mp4Tag.artistID = int
                        case .bpm:
                            mp4Tag.bpm = int
                        case .composerID:
                            mp4Tag.composerID = int
                        case .conductorID:
                            mp4Tag.conductorID = int
                        case .genreID:
                            mp4Tag.genreID = SwiftTaggerMP4.Genres(rawValue: int)
                        case .length:
                            break
                        case .movementCount:
                            mp4Tag.movementCount = int
                        case .movementNumber:
                            mp4Tag.movementNumber = int
                        case .playlistID:
                            mp4Tag.playlistID = int
                        case .tvEpisodeNumber:
                            mp4Tag.tvEpisodeNumber = int
                        case .tvSeason:
                            mp4Tag.tvSeason = int
                        case .playlistDelay:
                            if int == 1 {
                                mp4Tag.gaplessPlayback = true
                            } else if int == 0 {
                                mp4Tag.gaplessPlayback = false
                        }
                }
                case .id3:
                    switch intMetadataID {
                        case .albumID:
                        id3Tag["albumID"] = String(int)
                        case .appleStoreCountryID:
                            id3Tag["appleStoreCountryID"] = String(int)
                        case .artistID:
                            id3Tag["artistID"] = String(int)
                        case .bpm:
                            id3Tag.bpm = int
                        case .composerID:
                        id3Tag["composerID"] = String(int)
                        case.conductorID:
                        id3Tag["conductorID"] = String(int)
                        case .genreID:
                            id3Tag.genre?.presetGenre = SwiftTaggerID3.GenreType(code: int)
                        case .length:
                            id3Tag.length = int
                        case .movementCount:
                            id3Tag.totalMovements = int
                        case .movementNumber:
                            id3Tag.movementNumber = int
                        case .playlistID:
                            id3Tag["playlistID"] = String(int)
                        case .tvEpisodeNumber:
                            id3Tag["tvEpisodeNumber"] = String(int)
                        case .tvSeason:
                            id3Tag["tvSeason"] = String(int)
                        case .playlistDelay:
                            id3Tag.playlistDelay = int
                }
            }
        } else {
            switch library {
                case .mp4:
                    switch intMetadataID {
                        case .albumID:
                            mp4Tag.albumID = nil
                        case .appleStoreCountryID:
                            mp4Tag.appleStoreCountryID = nil
                        case .artistID:
                            mp4Tag.artistID = nil
                        case .bpm:
                            mp4Tag.bpm = nil
                        case .composerID:
                            mp4Tag.composerID = nil
                        case .conductorID:
                            mp4Tag.conductorID = nil
                        case .genreID:
                            mp4Tag.genreID = nil
                        case .length:
                            break
                        case .movementCount:
                            mp4Tag.movementCount = nil
                        case .movementNumber:
                            mp4Tag.movementNumber = nil
                        case .playlistID:
                            mp4Tag.playlistID = nil
                        case .tvEpisodeNumber:
                            mp4Tag.tvEpisodeNumber = nil
                        case .tvSeason:
                            mp4Tag.tvSeason = nil
                        case .playlistDelay:
                            mp4Tag.gaplessPlayback = nil
                }
                case .id3:
                    switch intMetadataID {
                        case .albumID:
                            id3Tag["albumID"] = nil
                        case .appleStoreCountryID:
                            id3Tag["appleStoreCountryID"] = nil
                        case .artistID:
                            id3Tag["artistID"] = nil
                        case .bpm:
                            id3Tag.bpm = nil
                        case .composerID:
                            id3Tag["composerID"] = nil
                        case.conductorID:
                            id3Tag["conductorID"] = nil
                        case .genreID:
                            id3Tag.genre?.presetGenre = nil
                        case .length:
                            id3Tag.length = nil
                        case .movementCount:
                            id3Tag.totalMovements = nil
                        case .movementNumber:
                            id3Tag.movementNumber = nil
                        case .playlistID:
                            id3Tag["playlistID"] = nil
                        case .tvEpisodeNumber:
                            id3Tag["tvEpisodeNumber"] = nil
                        case .tvSeason:
                            id3Tag["tvSeason"] = nil
                        case .playlistDelay:
                            id3Tag.playlistDelay = nil
                }
            }
        }
    }
}
