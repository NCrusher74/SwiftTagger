//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 10/1/20.
//

import XCTest
@testable import SwiftTagger
import SwiftTaggerID3

final class SwiftTaggerTests_MP4_Read: XCTestCase {
    
    func testRead() throws {
        let file = try AudioFile(location: sampleMp4)
        let tag = file.mp4Tag
        
        let calendar = Calendar(identifier: .iso8601)
        let dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone(secondsFromGMT: 0) ?? .current, year: 2020, month: 09, day: 01)
        let date = calendar.date(from: dateComponents)

        let knownTitles = ["Chapter 1",
                           "Chapter 2",
                           "Chapter 3",
                           "Chapter 4",
                           "Chapter 5",
                           "Chapter 6"]
        let knownStarts = [0, 600, 1300, 2100, 3300, 4600]
        
        XCTAssertEqual(tag.acknowledgment,"Acknowledgment")
        XCTAssertEqual(tag.album,"Album")
        XCTAssertEqual(tag.albumArtist,"Album Artist")
        XCTAssertEqual(tag.albumArtistSort,"Album Artist Sort")
        XCTAssertEqual(tag.albumSort,"Album Sort")
        XCTAssertEqual(tag.appleStoreCountryID,23456)
        XCTAssertEqual(tag.arranger,"Arranger")
        XCTAssertEqual(tag.arrangerKeywords,["Arranger", "Keywords"])
        XCTAssertEqual(tag.artDirector,"Art Director")
        XCTAssertEqual(tag.artist,"Artist")
        XCTAssertEqual(tag.artistID,34567)
        XCTAssertEqual(tag.artistKeywords,["Artist", "Keywords"])
        XCTAssertEqual(tag.artistSort,"Artist Sort")
        XCTAssertEqual(tag.artistUrl,"www.artist.url")
        XCTAssertEqual(tag.bpm,99)
        XCTAssertEqual(tag.category,"Category")
        XCTAssertEqual(tag.comment,"Comment")
        XCTAssertEqual(tag.compilation,true)
        XCTAssertEqual(tag.composer,"Composer")
        XCTAssertEqual(tag.composerKeywords,["Composer", "Keywords"])
        XCTAssertEqual(tag.composerSort,"Composer Sort")
        XCTAssertEqual(tag.conductor,"Conductor")
        XCTAssertEqual(tag.conductorID,45678)
        XCTAssertEqual(tag.copyright,"2020 Copyright")
        XCTAssertEqual(tag.copyrightStatement,"Copyright Statement")
        XCTAssertEqual(tag.customGenre,"Genre")
        XCTAssertEqual(tag.description,"Description")
        XCTAssertEqual(tag.director,"Director")
        XCTAssertEqual(tag.discNumber.disc,1)
        XCTAssertEqual(tag.discNumber.totalDiscs,2)
        XCTAssertEqual(tag.encodedBy,"Encoded By")
        XCTAssertEqual(tag.encodingTool,"Encoding Tool")
        XCTAssertEqual(tag.executiveProducer,"Executive Producer")
        XCTAssertEqual(tag.labelUrl,"www.filmmaker.url")
        XCTAssertEqual(tag.format,"Format")
        XCTAssertEqual(tag.gaplessPlayback,true)
        XCTAssertEqual(tag.genreID,.audiobooks)
        XCTAssertEqual(tag.grouping,"Grouping")
        XCTAssertEqual(tag.information,"Information")
        XCTAssertEqual(tag.isrc,"123456789012")
        XCTAssertEqual(tag.iTunesAccount, "iTunes Account")
        XCTAssertEqual(tag.iTunesAccountType,123)
        XCTAssertEqual(tag.keywords,["Key", "Words"])
        XCTAssertEqual(tag.label,"Label")
        XCTAssertEqual(tag.linerNotes,"Liner Notes")
        XCTAssertEqual(tag.longDescription,"Long Description")
        XCTAssertEqual(tag.lyricist,"Lyricist")
        XCTAssertEqual(tag.lyrics,"Lyrics")
        XCTAssertEqual(tag.mediaKind,.audiobook)
        XCTAssertEqual(tag.movementCount,4)
        XCTAssertEqual(tag.movementNumber,3)
        XCTAssertEqual(tag.movement,"Movement Name")
        XCTAssertEqual(tag.narrator,"Narrator")
        XCTAssertEqual(tag.originalArtist,"Original Artist")
        XCTAssertEqual(tag.owner,"Owner")
        XCTAssertEqual(tag.performers,["Performer"])
        XCTAssertEqual(tag.playlistID,56789)
        XCTAssertEqual(tag.podcast,true)
        XCTAssertEqual(tag.podcastID,"Podcast ID")
        XCTAssertEqual(tag.podcastFeed,"www.podcast.url")
        XCTAssertEqual(tag.predefinedGenre,.audiobooks)
        XCTAssertEqual(tag.producer,"Producer")
        XCTAssertEqual(tag.producerKeywords,["Producer", "Keywords"])
        XCTAssertEqual(tag.publisher,"Publisher")
        XCTAssertEqual(tag.recordCompanyUrl,"www.publisher.url")
        XCTAssertEqual(tag.purchaseDate, date)
        XCTAssertEqual(tag.rating,.clean)
        XCTAssertEqual(tag.recordCompany,"Record Company")
        XCTAssertEqual(tag.recordingCopyright,"Recording Copyright")
        XCTAssertEqual(tag.recordingDate, date)
        XCTAssertEqual(tag.releaseDate, date)
        XCTAssertEqual(tag.requirements,"Requirements")
        XCTAssertEqual(tag.sellerID,"Seller ID")
        XCTAssertEqual(tag.showWorkAndMovement,true)
        XCTAssertEqual(tag.softwareVersion,"Software Version")
        XCTAssertEqual(tag.soloist,"Soloist")
        XCTAssertEqual(tag.songDescription,"Song Description")
        XCTAssertEqual(tag.songwriterKeywords,["Songwriter", "Keywords"])
        XCTAssertEqual(tag.songwriter,"Songwriter")
        XCTAssertEqual(tag.soundEngineer,"Song Engineer")
        XCTAssertEqual(tag.sourceCredit,"Source Credit")
        XCTAssertEqual(tag.subtitle,"Subtitle")
        XCTAssertEqual(tag.subtitleKeywords,["Subtitle", "Keywords"])
        XCTAssertEqual(tag.thanks,"Thanks")
        XCTAssertEqual(tag.title,"Title")
        XCTAssertEqual(tag.titleKeywords,["Title", "Keywords"])
        XCTAssertEqual(tag.titleSort,"Title Sort")
        XCTAssertEqual(tag.trackNumber.track,5)
        XCTAssertEqual(tag.trackNumber.totalTracks,6)
        XCTAssertEqual(tag.trackSubtitle,"Track Subtitle")
        XCTAssertEqual(tag.tvEpisodeNumber,7)
        XCTAssertEqual(tag.tvSeason,8)
        XCTAssertEqual(tag.tvShow,"TV Show")
        XCTAssertEqual(tag.tvNetwork,"TV Network")
        XCTAssertEqual(tag.tvShowSort,"TV Show Sort")
        XCTAssertEqual(tag.tvEpisodeTitle,"TV Episode Title")
        XCTAssertEqual(tag.tvShowDescription,"TV Show Description")
        XCTAssertEqual(tag.website,"www.website.url")
        XCTAssertEqual(tag.workName,"Work Name")
        XCTAssertEqual(tag.writer,"Writer")
        XCTAssertEqual(tag.year,2020)
        XCTAssertNotNil(tag.coverArt)
        XCTAssertEqual(tag["Unknown"], "unknown")

        var titles = [String]()
        var starts = [Int]()
        for chapter in tag.chapterList {
            titles.append(chapter.title)
            starts.append(chapter.startTime)
        }
        
        XCTAssertEqual(titles, knownTitles)
        XCTAssertEqual(starts, knownStarts)
    }
}
