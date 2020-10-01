//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 10/1/20.
//

import XCTest
@testable import SwiftTagger
import SwiftTaggerID3

final class SwiftTaggerTests_ID3_Read: XCTestCase {
    
    let calendar = Calendar(identifier: .iso8601)
    let testAllDate: Date = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current

        guard let date = formatter.date(from: "2002-11-07T09:23:00Z") else {
            fatalError()
        }
        return date
    }()

    func testRead() throws {
        let file = try AudioFile(location: sampleMp3)
        let tag = file.id3Tag
        
        XCTAssertEqual(tag.album, "Album")
        XCTAssertEqual(tag.albumArtist, "Album Artist")
        XCTAssertEqual(tag.albumSort, "Album Sort")
        XCTAssertEqual(tag.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(tag.arranger, "Arranger")
        XCTAssertEqual(tag.artist, "Artist")
        XCTAssertEqual(tag.artistSort, "Artist Sort")
        XCTAssertEqual(tag.composer, "Composer")
        XCTAssertEqual(tag.composerSort, "Composer Sort")
        XCTAssertEqual(tag.conductor, "Conductor")
        XCTAssertEqual(tag.contentGroup, "Content Group")
        XCTAssertEqual(tag.copyright, "2020 Copyright")
        XCTAssertEqual(tag.encodedBy, "Encoded By")
        XCTAssertEqual(tag.encodingSettings, "Encoding Settings")
        XCTAssertEqual(tag.fileOwner, "File Owner")
        XCTAssertEqual(tag.grouping, "Grouping")
        XCTAssertEqual(tag.initialKey, .aFlatMinor)
        XCTAssertEqual(tag.lyricist, "Lyricist")
        XCTAssertEqual(tag.mood, "Mood")
        XCTAssertEqual(tag.movement, "Movement Name")
        XCTAssertEqual(tag.originalAlbum, "Original Album")
        XCTAssertEqual(tag.originalArtist, "Original Artist")
        XCTAssertEqual(tag.originalFilename, "Original Filename")
        XCTAssertEqual(tag.originalLyricist, "Original Lyricist")
        XCTAssertEqual(tag.podcastID, "Podcast ID")
        XCTAssertEqual(tag.podcastCategory, "Podcast Category")
        XCTAssertEqual(tag.podcastFeed, "http://podcast.url")
        XCTAssertEqual(tag.podcastDescription, "Podcast Description")
        XCTAssertEqual(tag.podcastKeywords, ["Podcast", "Keywords"])
        XCTAssertEqual(tag.publisher, "Publisher")
        XCTAssertEqual(tag.producedNotice, "2020 Produced Notice")
        XCTAssertEqual(tag.radioStation, "Radio Station")
        XCTAssertEqual(tag.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(tag.subtitle, "Subtitle")
        XCTAssertEqual(tag.setSubtitle, "Set Subtitle")
        XCTAssertEqual(tag.title, "Title")
        XCTAssertEqual(tag.titleSort, "Title Sort")
        
        XCTAssertEqual(tag.compilation, true)
        XCTAssertEqual(tag.bpm, 99)
        XCTAssertEqual(tag.isrc, "987654321098")
        XCTAssertEqual(tag.movementNumber, 5)
        XCTAssertEqual(tag.movementCount, 6)
        XCTAssertEqual(tag.playlistDelay, 0)
        
        XCTAssertEqual(tag.audioSourceWebpage, "http://audiosource.url")
        XCTAssertEqual(tag.audioFileWebpage, "http://audiofile.url")
        XCTAssertEqual(tag.artistWebpage, "http://artist.url")
        XCTAssertEqual(tag.copyrightWebpage, "http://copyright.url")
        XCTAssertEqual(tag.paymentWebpage, "http://payment.url")
        XCTAssertEqual(tag.publisherWebpage, "http://publisher.url")
        XCTAssertEqual(tag.radioStationWebpage, "http://radiostation.url")
        
        XCTAssertEqual(tag.languages, [.eng])
        
        XCTAssertEqual(tag.trackNumber.track, 6)
        XCTAssertEqual(tag.trackNumber.totalTracks, 7)
        XCTAssertEqual(tag.discNumber.disc, 4)
        XCTAssertEqual(tag.discNumber.totalDiscs, 5)
        
        XCTAssertEqual(tag.involvementCreditsList[.director], ["Director Name"])
        XCTAssertEqual(tag.involvementCreditsList[.producer], ["Producer Name"])
        XCTAssertEqual(tag.musicianCreditsList[.soprano], ["Soprano Name"])
        XCTAssertEqual(tag.musicianCreditsList[.alto], ["Alto Name"])
        XCTAssertEqual(tag.encodingDateTime, testAllDate)
        XCTAssertEqual(tag.taggingDateTime, testAllDate)
        XCTAssertEqual(tag.releaseDateTime, testAllDate)
        XCTAssertEqual(tag.originalRelease, testAllDate)
        XCTAssertEqual(tag.recordingDateTime, testAllDate)
        
        XCTAssertEqual(tag[comment: "Comment", .eng], "Comment Content")
        XCTAssertEqual(tag[lyrics: "Lyrics", .eng], "Lyrics Content")
        XCTAssertEqual(tag[userDefinedUrl: "UserURL"], "http://userdefined.url")
        XCTAssertEqual(tag["UserText"], "User Text Content")
        
        XCTAssertEqual(tag.discNumber.disc, 4)
        XCTAssertEqual(tag.discNumber.totalDiscs, 5)
        XCTAssertEqual(tag.trackNumber.track, 6)
        XCTAssertEqual(tag.trackNumber.totalTracks, 7)
        
        XCTAssertEqual(tag.genre.genreCategory, .Blues)
        XCTAssertEqual(tag.genre.genre, "Blues Refinement")
        
        XCTAssertEqual(tag.mediaType.mediaType, .otherDigital)
        XCTAssertEqual(tag.mediaType.mediaTypeRefinement, .analogTransfer)
        XCTAssertEqual(tag.mediaType.additionalInformation, "Additional Information")
        
        XCTAssertEqual(tag.fileType.fileType, .MPG)
        XCTAssertEqual(tag.fileType.fileTypeRefinement, .mpegLayerIII)
        XCTAssertEqual(tag.fileType.additionalInformation, "Additional Information")
        
        let chapter1 = tag.chapterList[0]
        let chapter2 = tag.chapterList[1]
        let chapter3 = tag.chapterList[2]
        let chapter4 = tag.chapterList[3]
        let chapter5 = tag.chapterList[4]
        XCTAssertEqual(chapter1.startTime, 0)
        XCTAssertEqual(chapter2.startTime, 900)
        XCTAssertEqual(chapter3.startTime, 1950)
        XCTAssertEqual(chapter4.startTime, 3120)
        XCTAssertEqual(chapter5.startTime, 4230)
        XCTAssertEqual(chapter1.title, "Chapter 01")
        XCTAssertEqual(chapter2.title, "Chapter 02")
        XCTAssertEqual(chapter3.title, "Chapter 03")
        XCTAssertEqual(chapter4.title, "Chapter 04")
        XCTAssertEqual(chapter5.title, "Chapter 05")
    }
}
