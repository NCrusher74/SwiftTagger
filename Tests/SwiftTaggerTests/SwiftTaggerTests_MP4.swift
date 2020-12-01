//
//  SwiftTaggerTests_MP4.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 10/1/20.
//

import XCTest
@testable import SwiftTagger

@available(OSX 11.0, *)
final class SwiftTaggerTests_MP4: XCTestCase {
    
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
        XCTAssertEqual(tag.copyright,"©2020 Copyright")
        XCTAssertEqual(tag.copyrightStatement,"Copyright Statement")
        XCTAssertEqual(tag.customGenre,"Genre")
        XCTAssertEqual(tag.description,"Description")
        XCTAssertEqual(tag.director,"Director")
        XCTAssertEqual(tag.discNumber.index,1)
        XCTAssertEqual(tag.discNumber.total,2)
        XCTAssertEqual(tag.encodedBy,"Encoded By")
        XCTAssertEqual(tag.encodingTool,"Encoding Tool")
        XCTAssertEqual(tag.executiveProducer,"Executive Producer")
        XCTAssertEqual(tag.labelUrl,"www.filmmaker.url")
        XCTAssertEqual(tag.format,"Format")
        XCTAssertEqual(tag.gaplessPlayback,true)
        if let genreID = tag.genreID {
            XCTAssertEqual(genreID.identifier, GenreMP4.audiobooks(.audiobooks).identifier)
        }
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
        XCTAssertEqual(tag.predefinedGenre?.identifier, GenreMP4.audiobooks(.audiobooks).identifier)
        XCTAssertEqual(tag.producer,"Producer")
        XCTAssertEqual(tag.producerKeywords,["Producer", "Keywords"])
        XCTAssertEqual(tag.publisher,"Publisher")
        XCTAssertEqual(tag.recordCompanyUrl,"www.publisher.url")
        XCTAssertEqual(tag.purchaseDate, date)
        XCTAssertEqual(tag.rating,.clean)
        XCTAssertEqual(tag.recordCompany,"Record Company")
        XCTAssertEqual(tag.recordingCopyright,"℗Recording Copyright")
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
        XCTAssertEqual(tag.trackNumber.index,5)
        XCTAssertEqual(tag.trackNumber.total,6)
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
        
        XCTAssertEqual(file.acknowledgment,"Acknowledgment")
        XCTAssertEqual(file.album,"Album")
        XCTAssertEqual(file.albumArtist,"Album Artist")
        XCTAssertEqual(file.albumArtistSort,"Album Artist Sort")
        XCTAssertEqual(file.albumSort,"Album Sort")
        XCTAssertEqual(file.appleStoreCountryID,23456)
        XCTAssertEqual(file.arranger,"Arranger")
        XCTAssertEqual(file.arrangerKeywords,["Arranger", "Keywords"])
        XCTAssertEqual(file.artDirector,"Art Director")
        XCTAssertEqual(file.artist,"Artist")
        XCTAssertEqual(file.artistID,34567)
        XCTAssertEqual(file.artistKeywords,["Artist", "Keywords"])
        XCTAssertEqual(file.artistSort,"Artist Sort")
        XCTAssertEqual(file.artistWebpage,"www.artist.url")
        XCTAssertEqual(file.bpm,99)
        XCTAssertEqual(file.podcastCategory,"Category")
        XCTAssertEqual(file.comments,"Comment")
        XCTAssertEqual(file.compilation,true)
        XCTAssertEqual(file.composer,"Composer")
        XCTAssertEqual(file.composerKeywords,["Composer", "Keywords"])
        XCTAssertEqual(file.composerSort,"Composer Sort")
        XCTAssertEqual(file.conductor,"Conductor")
        XCTAssertEqual(file.conductorID,45678)
        XCTAssertEqual(file.copyright,"©2020 Copyright")
        XCTAssertEqual(file.genreCustom,"Genre")
        XCTAssertEqual(file.description,"Description")
        XCTAssertEqual(file.director,"Director")
        XCTAssertEqual(file.discNumber.index,1)
        XCTAssertEqual(file.discNumber.total,2)
        XCTAssertEqual(file.encodedBy,"Encoded By")
        XCTAssertEqual(file.encoderSettings,"Encoding Tool")
        XCTAssertEqual(file.executiveProducer,"Executive Producer")
        XCTAssertEqual(file.labelWebpage,"www.filmmaker.url")
        XCTAssertEqual(file.gaplessPlayback,true)
        XCTAssertEqual(file.genreID, 50000024)
        XCTAssertEqual(file.grouping,"Grouping")
        XCTAssertEqual(file.information,"Information")
        XCTAssertEqual(file.isrc,"123456789012")
        XCTAssertEqual(file.iTunesAccount, "iTunes Account")
        XCTAssertEqual(file.iTunesAccountType,123)
        XCTAssertEqual(file.podcastKeywords,["Key", "Words"])
        XCTAssertEqual(file.label,"Label")
        XCTAssertEqual(file.linerNotes,"Liner Notes")
        XCTAssertEqual(file.longDescription,"Long Description")
        XCTAssertEqual(file.lyricist,"Lyricist")
        XCTAssertEqual(file.lyrics,"Lyrics")
        XCTAssertEqual(file.mediaKind,.audiobook)
        XCTAssertEqual(file.movementCount,4)
        XCTAssertEqual(file.movementNumber,3)
        XCTAssertEqual(file.movement,"Movement Name")
        XCTAssertEqual(file.narrator,"Narrator")
        XCTAssertEqual(file.originalArtist,"Original Artist")
        XCTAssertEqual(file.owner,"Owner")
        XCTAssertEqual(file.performers,["Performer"])
        XCTAssertEqual(file.playlistID,56789)
        XCTAssertEqual(file.podcast,true)
        XCTAssertEqual(file.podcastID,"Podcast ID")
        XCTAssertEqual(file.podcastFeed,"www.podcast.url")
        XCTAssertEqual(file.genrePredefined.mp4?.identifier,GenreMP4.audiobooks(.audiobooks).identifier)
        XCTAssertEqual(file.producer,"Producer")
        XCTAssertEqual(file.producerKeywords,["Producer", "Keywords"])
        XCTAssertEqual(file.publisher,"Publisher")
        XCTAssertEqual(file.recordCompanyWebpage,"www.publisher.url")
        XCTAssertEqual(file.purchaseDateTime, date)
        XCTAssertEqual(file.rating,.clean)
        XCTAssertEqual(file.recordCompany,"Record Company")
        XCTAssertEqual(file.recordingCopyright,"℗Recording Copyright")
        XCTAssertEqual(file.recordingDateTime, date)
        XCTAssertEqual(file.releaseDateTime, date)
        XCTAssertEqual(file.requirements,"Requirements")
        XCTAssertEqual(file.sellerID,"Seller ID")
        XCTAssertEqual(file.showWorkAndMovement,true)
        XCTAssertEqual(file.softwareVersion,"Software Version")
        XCTAssertEqual(file.soloist,"Soloist")
        XCTAssertEqual(file.songDescription,"Song Description")
        XCTAssertEqual(file.songwriterKeywords,["Songwriter", "Keywords"])
        XCTAssertEqual(file.songwriter,"Songwriter")
        XCTAssertEqual(file.soundEngineer,"Song Engineer")
        XCTAssertEqual(file.sourceCredit,"Source Credit")
        XCTAssertEqual(file.subtitle,"Subtitle")
        XCTAssertEqual(file.subtitleKeywords,["Subtitle", "Keywords"])
        XCTAssertEqual(file.thanks,"Thanks")
        XCTAssertEqual(file.title,"Title")
        XCTAssertEqual(file.titleKeywords,["Title", "Keywords"])
        XCTAssertEqual(file.titleSort,"Title Sort")
        XCTAssertEqual(file.trackNumber.index,5)
        XCTAssertEqual(file.trackNumber.total,6)
        XCTAssertEqual(file.trackOrSetSubtitle,"Track Subtitle")
        XCTAssertEqual(file.seriesEpisodeNumber,7)
        XCTAssertEqual(file.seriesSeason,8)
        XCTAssertEqual(file.series,"TV Show")
        XCTAssertEqual(file.seriesNetworkOrChannel,"TV Network")
        XCTAssertEqual(file.seriesSort,"TV Show Sort")
        XCTAssertEqual(file.seriesEpisodeTitle,"TV Episode Title")
        XCTAssertEqual(file.seriesDescription,"TV Show Description")
        XCTAssertEqual(file.work,"Work Name")
        XCTAssertEqual(file.writer,"Writer")
        XCTAssertEqual(file.year,2020)
        XCTAssertNotNil(file.coverArt)
        XCTAssertEqual(file["Unknown"], "unknown")
        
        var titles = [String]()
        var starts = [Int]()
        for chapter in tag.chapterList {
            titles.append(chapter.title)
            starts.append(chapter.startTime)
        }
        
        XCTAssertEqual(titles, knownTitles)
        XCTAssertEqual(starts, knownStarts)
    }
    
    func testRemoveAll() throws {
        var file = try AudioFile(location: sampleMp4)
        
        file.removeAllChapters()
        let tag1 = file.mp4Tag
        
        XCTAssertTrue(file.chapterList.isEmpty)
        XCTAssertTrue(tag1.chapterList.isEmpty)
        XCTAssertFalse(tag1.metadataAtoms.isEmpty)
        
        file.removeAllMetadata()
        let tag2 = file.mp4Tag
        XCTAssertTrue(tag2.metadataAtoms.isEmpty)
        
        let outputUrl = tempOutputDirectory(fileExtension: .m4a)
        try file.write(outputLocation: outputUrl)
        let output = try AudioFile(location: outputUrl)
        
        XCTAssertTrue(output.mp4Tag.metadataAtoms.isEmpty)
        XCTAssertTrue(output.chapterList.isEmpty)
    }
    
    func testRemoveChapter() throws {
        var file = try AudioFile(location: sampleMp4)
        file.removeChapter(startTime: 1300)
        
        let knownTitles = ["Chapter 1",
                           "Chapter 2",
                           "Chapter 4",
                           "Chapter 5",
                           "Chapter 6"]
        let knownStarts = [0, 600, 2100, 3300, 4600]
        
        let tag = file.mp4Tag
        var titles = [String]()
        var starts = [Int]()
        for chapter in tag.chapterList {
            titles.append(chapter.title)
            starts.append(chapter.startTime)
        }
        
        let outputUrl = tempOutputDirectory(fileExtension: .m4a)
        try file.write(outputLocation: outputUrl)
        let output = try AudioFile(location: outputUrl)
        
        let calendar = Calendar(identifier: .iso8601)
        let dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone(secondsFromGMT: 0) ?? .current, year: 2020, month: 09, day: 01)
        let date = calendar.date(from: dateComponents)
        
        var outputStarts = [Int]()
        var outputTitles = [String]()
        for chapter in output.chapterList {
            outputStarts.append(chapter.startTime)
            outputTitles.append(chapter.title)
        }
        XCTAssertEqual(outputTitles, knownTitles)
        XCTAssertEqual(outputStarts, knownStarts)
        
        XCTAssertEqual(output.acknowledgment,"Acknowledgment")
        XCTAssertEqual(output.album,"Album")
        XCTAssertEqual(output.albumArtist,"Album Artist")
        XCTAssertEqual(output.albumArtistSort,"Album Artist Sort")
        XCTAssertEqual(output.albumSort,"Album Sort")
        XCTAssertEqual(output.appleStoreCountryID,23456)
        XCTAssertEqual(output.arranger,"Arranger")
        XCTAssertEqual(output.arrangerKeywords,["Arranger", "Keywords"])
        XCTAssertEqual(output.artDirector,"Art Director")
        XCTAssertEqual(output.artist,"Artist")
        XCTAssertEqual(output.artistID,34567)
        XCTAssertEqual(output.artistKeywords,["Artist", "Keywords"])
        XCTAssertEqual(output.artistSort,"Artist Sort")
        XCTAssertEqual(output.artistWebpage,"www.artist.url")
        XCTAssertEqual(output.bpm,99)
        XCTAssertEqual(output.podcastCategory,"Category")
        XCTAssertEqual(output.comments,"Comment")
        XCTAssertEqual(output.compilation,true)
        XCTAssertEqual(output.composer,"Composer")
        XCTAssertEqual(output.composerKeywords,["Composer", "Keywords"])
        XCTAssertEqual(output.composerSort,"Composer Sort")
        XCTAssertEqual(output.conductor,"Conductor")
        XCTAssertEqual(output.conductorID,45678)
        XCTAssertEqual(output.copyright,"©2020 Copyright")
        XCTAssertEqual(output.genreCustom,"Genre")
        XCTAssertEqual(output.description,"Description")
        XCTAssertEqual(output.director,"Director")
        XCTAssertEqual(output.discNumber.index,1)
        XCTAssertEqual(output.discNumber.total,2)
        XCTAssertEqual(output.encodedBy,"Encoded By")
        XCTAssertEqual(output.encoderSettings,"Encoding Tool")
        XCTAssertEqual(output.executiveProducer,"Executive Producer")
        XCTAssertEqual(output.labelWebpage,"www.filmmaker.url")
        XCTAssertEqual(output.gaplessPlayback,true)
        XCTAssertEqual(output.genreID, 50000024)
        XCTAssertEqual(output.grouping,"Grouping")
        XCTAssertEqual(output.information,"Information")
        XCTAssertEqual(output.isrc,"123456789012")
        XCTAssertEqual(output.iTunesAccount, "iTunes Account")
        XCTAssertEqual(output.iTunesAccountType,123)
        XCTAssertEqual(output.podcastKeywords,["Key", "Words"])
        XCTAssertEqual(output.label,"Label")
        XCTAssertEqual(output.linerNotes,"Liner Notes")
        XCTAssertEqual(output.longDescription,"Long Description")
        XCTAssertEqual(output.lyricist,"Lyricist")
        XCTAssertEqual(output.lyrics,"Lyrics")
        XCTAssertEqual(output.mediaKind,.audiobook)
        XCTAssertEqual(output.movementCount,4)
        XCTAssertEqual(output.movementNumber,3)
        XCTAssertEqual(output.movement,"Movement Name")
        XCTAssertEqual(output.narrator,"Narrator")
        XCTAssertEqual(output.originalArtist,"Original Artist")
        XCTAssertEqual(output.owner,"Owner")
        XCTAssertEqual(output.performers,["Performer"])
        XCTAssertEqual(output.playlistID,56789)
        XCTAssertEqual(output.podcast,true)
        XCTAssertEqual(output.podcastID,"Podcast ID")
        XCTAssertEqual(output.podcastFeed,"www.podcast.url")
        XCTAssertEqual(output.genrePredefined.mp4?.identifier,GenreMP4.audiobooks(.audiobooks).identifier)
        XCTAssertEqual(output.producer,"Producer")
        XCTAssertEqual(output.producerKeywords,["Producer", "Keywords"])
        XCTAssertEqual(output.publisher,"Publisher")
        XCTAssertEqual(output.recordCompanyWebpage,"www.publisher.url")
        XCTAssertEqual(output.purchaseDateTime, date)
        XCTAssertEqual(output.rating,.clean)
        XCTAssertEqual(output.recordCompany,"Record Company")
        XCTAssertEqual(output.recordingCopyright,"℗Recording Copyright")
        XCTAssertEqual(output.recordingDateTime, date)
        XCTAssertEqual(output.releaseDateTime, date)
        XCTAssertEqual(output.requirements,"Requirements")
        XCTAssertEqual(output.sellerID,"Seller ID")
        XCTAssertEqual(output.showWorkAndMovement,true)
        XCTAssertEqual(output.softwareVersion,"Software Version")
        XCTAssertEqual(output.soloist,"Soloist")
        XCTAssertEqual(output.songDescription,"Song Description")
        XCTAssertEqual(output.songwriterKeywords,["Songwriter", "Keywords"])
        XCTAssertEqual(output.songwriter,"Songwriter")
        XCTAssertEqual(output.soundEngineer,"Song Engineer")
        XCTAssertEqual(output.sourceCredit,"Source Credit")
        XCTAssertEqual(output.subtitle,"Subtitle")
        XCTAssertEqual(output.subtitleKeywords,["Subtitle", "Keywords"])
        XCTAssertEqual(output.thanks,"Thanks")
        XCTAssertEqual(output.title,"Title")
        XCTAssertEqual(output.titleKeywords,["Title", "Keywords"])
        XCTAssertEqual(output.titleSort,"Title Sort")
        XCTAssertEqual(output.trackNumber.index,5)
        XCTAssertEqual(output.trackNumber.total,6)
        XCTAssertEqual(output.trackOrSetSubtitle,"Track Subtitle")
        XCTAssertEqual(output.seriesEpisodeNumber,7)
        XCTAssertEqual(output.seriesSeason,8)
        XCTAssertEqual(output.series,"TV Show")
        XCTAssertEqual(output.seriesNetworkOrChannel,"TV Network")
        XCTAssertEqual(output.seriesSort,"TV Show Sort")
        XCTAssertEqual(output.seriesEpisodeTitle,"TV Episode Title")
        XCTAssertEqual(output.seriesDescription,"TV Show Description")
        XCTAssertEqual(output.work,"Work Name")
        XCTAssertEqual(output.writer,"Writer")
        XCTAssertEqual(output.year,2020)
        XCTAssertNotNil(output.coverArt)
        XCTAssertEqual(file["Unknown"], "unknown")
    }
    
    func testAddAll() throws {
        var file = try AudioFile(location: sampleMp4NoMeta)
        let test = try testSettings(&file)
        let outputUrl = try localOutputDirectory(fileName: "mp4Test", fileExtension: .m4a)
        try test.write(outputLocation: outputUrl)
        let output = try AudioFile(location: outputUrl)
        
        print(output.chapterList)
        let chapter1 = output.chapterList[0]
        XCTAssertEqual(chapter1.startTime, 0)
        XCTAssertEqual(chapter1.title, "Chapter 01")
        let chapter2 = output.chapterList[1]
        XCTAssertEqual(chapter2.startTime, 700)
        XCTAssertEqual(chapter2.title, "Chapter 02")
        let chapter3 = output.chapterList[2]
        XCTAssertEqual(chapter3.startTime, 1670)
        XCTAssertEqual(chapter3.title, "Chapter 03")
        let chapter4 = output.chapterList[3]
        XCTAssertEqual(chapter4.startTime, 3165)
        XCTAssertEqual(chapter4.title, "Chapter 04")
        let chapter5 = output.chapterList[4]
        XCTAssertEqual(chapter5.startTime, 3976)
        XCTAssertEqual(chapter5.title, "Chapter 05")

        XCTAssertEqual(output.acknowledgment, "Acknowledgment")
        XCTAssertEqual(output.album, "Album")
        XCTAssertEqual(output.albumArtist, "Album Artist Name")
        XCTAssertEqual(output.albumArtistSort, "Album Artist Sort")
        XCTAssertEqual(output.albumSort, "Album Sort")
        XCTAssertEqual(output.appleStoreCountryID, 12345678)
        XCTAssertEqual(output.arranger, "Arranger Name")
        XCTAssertEqual(output.involvementCreditsList[.arranger], ["Arranger Name"])
        XCTAssertEqual(output.arrangerKeywords, ["Arranger", "Key", "Words"])
        XCTAssertEqual(output.artDirector, "Art Director Name")
        XCTAssertEqual(output.involvementCreditsList[.artDirection], ["Art Director Name"])
        XCTAssertEqual(output.artist, "Artist Name")
        XCTAssertEqual(output.musicianCreditsList[.artist], ["Artist Name"])
        XCTAssertEqual(output.artistID, 23456789)
        XCTAssertEqual(output.artistKeywords, ["Artist", "Key", "Words"])
        XCTAssertEqual(output.artistSort, "Artist Sort")
        XCTAssertEqual(output.artistWebpage, "ArtistURL.com")
        XCTAssertEqual(output.bpm, 99)
        XCTAssertEqual(output.comments, "Comments")
        XCTAssertEqual(output.compilation, true)
        XCTAssertEqual(output.composer, "Composer Name")
        XCTAssertEqual(output.involvementCreditsList[.composer], ["Composer Name"])
        XCTAssertEqual(output.composerKeywords, ["Composer", "Key", "Words"])
        XCTAssertEqual(output.composerID, 34567890)
        XCTAssertEqual(output.composerSort, "Composer Sort")
        XCTAssertEqual(output.conductor, "Conductor Name")
        XCTAssertEqual(output.conductorID, 45678901)
        XCTAssertEqual(output.contentRating.contentRating, .au_Movie_G)
        XCTAssertEqual(output.contentRating.ratingNotes, "Notes")
        XCTAssertEqual(output.copyright, "\u{00A9}2020 Copyright")
        XCTAssertEqual(output.copyrightWebpage, "CopyrightURL.com")
        XCTAssertNotNil(output.coverArt)
        XCTAssertEqual(output.description, "Description")
        XCTAssertEqual(output.director, "Director Name")
        XCTAssertEqual(output.involvementCreditsList[.director], ["Director Name"])
        XCTAssertEqual(output.discNumber.index, 1)
        XCTAssertEqual(output.discNumber.total, 2)
        XCTAssertEqual(output.encodedBy, "Encoded By")
        XCTAssertEqual(output.encoderSettings, "Encoding Tool And Settings")
        XCTAssertEqual(output.encodingDateTime, testAllDate)
        XCTAssertEqual(output.mp4Tag["Encoding Date/Time"], formatter.string(from: testAllDate))
        XCTAssertEqual(output.executiveProducer, "Exec Producer Name")
        XCTAssertEqual(output.involvementCreditsList[.executiveProducer], ["Exec Producer Name"])
        XCTAssertEqual(output.gaplessPlayback, true)
        XCTAssertEqual(output.genreCustom, "Genre")
        XCTAssertEqual(output.genreID, 50000024)
        XCTAssertEqual(output.genrePredefined.mp4?.identifier, GenreMP4.audiobooks(.audiobooks).identifier)
        XCTAssertEqual(output.grouping, "Grouping")
        XCTAssertEqual(output.iTunesAccount, "iTunes Account")
        XCTAssertEqual(output.iTunesAccountType, 1)
        XCTAssertEqual(output.information, "Information")
        XCTAssertEqual(output.initialKey, .aFlatMajor)
        XCTAssertEqual(output.mp4Tag["Initial key"], "Ab")
        XCTAssertEqual(output.involvementCreditsList[.accounting], ["Accountant Name"])
        XCTAssertEqual(output.mp4Tag["Accounting"], "Accountant Name")
        XCTAssertEqual(output.isrc, "987654321098")
        XCTAssertEqual(output.label, "Label")
        XCTAssertEqual(output.labelWebpage, "LabelURL.com")
        XCTAssertEqual(output.language, [.english])
        XCTAssertEqual(output.linerNotes, "Liner Notes")
        XCTAssertEqual(output.longDescription, "Long Description")
        XCTAssertEqual(output.lyricist, "Lyricist Name")
        XCTAssertEqual(output.involvementCreditsList[.lyricist], ["Lyricist Name"])
        XCTAssertEqual(output.lyrics, "Lyrics")
        XCTAssertEqual(output.mediaKind, .audiobook)
        XCTAssertEqual(output.mood, "Mood")
        XCTAssertEqual(output.mp4Tag["Mood"], "Mood")
        XCTAssertEqual(output.movement, "Movement")
        XCTAssertEqual(output.movementCount, 4)
        XCTAssertEqual(output.movementNumber, 3)
        XCTAssertEqual(output.musicianCreditsList[.accompaniedBy], ["Accompanist Name"])
        XCTAssertEqual(output.mp4Tag["Accompanied By"], "Accompanist Name")
        XCTAssertEqual(output.narrator, "Narrator Name")
        XCTAssertEqual(output.musicianCreditsList[.narrator], ["Narrator Name"])
        XCTAssertEqual(output.officialAudioFileWebpage, "AudioFileURL.com")
        XCTAssertEqual(output.mp4Tag["Audio File Webpage"], "AudioFileURL.com")
        XCTAssertEqual(output.officialAudioSourceWebpage, "AudioSourceURL.com")
        XCTAssertEqual(output.mp4Tag["Audio Source Webpage"], "AudioSourceURL.com")
        XCTAssertEqual(output.originalAlbum, "Original Album")
        XCTAssertEqual(output.mp4Tag["Original Album"], "Original Album")
        XCTAssertEqual(output.originalArtist, "Original Artist Name")
        XCTAssertEqual(output.originalFilename, "Original Filename")
        XCTAssertEqual(output.mp4Tag["Original Filename"], "Original Filename")
        XCTAssertEqual(output.originalLyricist, "Original Lyricist Name")
        XCTAssertEqual(output.mp4Tag["Original Lyricist"], "Original Lyricist Name")
        XCTAssertEqual(output.originalReleaseDateTime, testAllDate)
        XCTAssertEqual(output.mp4Tag["Original Release Date/Time"], formatter.string(from: testAllDate))
        XCTAssertEqual(output.owner, "Owner Name")
        XCTAssertEqual(output.paymentWebpage, "PaymentURL.com")
        XCTAssertEqual(output.mp4Tag["Payment Webpage"], "PaymentURL.com")
        XCTAssertEqual(output.performers, ["Singer Name", "Guitarist Name"])
        XCTAssertEqual(output.musicianCreditsList[.performer], ["Singer Name", "Guitarist Name"])
        XCTAssertEqual(output.playlistDelay, 0)
        XCTAssertEqual(output.playlistID, 56789012)
        XCTAssertEqual(output.podcast, true)
        XCTAssertEqual(output.podcastCategory, "Podcast Category")
        XCTAssertEqual(output.podcastDescription, "Song Description")
        XCTAssertEqual(output.podcastFeed, "PodcastFeedUrl.com")
        XCTAssertEqual(output.podcastID, "PodcastID")
        XCTAssertEqual(output.podcastKeywords, ["Podcast", "Key", "Words"])
        XCTAssertEqual(output.publisher, "Publisher Name")
        XCTAssertEqual(output.involvementCreditsList[.publisher], ["Publisher Name"])
        XCTAssertEqual(output.publisherWebpage, "PublisherURL.com")
        XCTAssertEqual(output.mp4Tag["Publisher Webpage"], "PublisherURL.com")
        XCTAssertEqual(output.purchaseDateTime, testAllDate)
        XCTAssertEqual(output.radioStation, "Radio Station")
        XCTAssertEqual(output.mp4Tag["Radio Station"], "Radio Station")
        XCTAssertEqual(output.radioStationOwner, "Radio Station Owner")
        XCTAssertEqual(output.mp4Tag["Radio Station Owner"], "Radio Station Owner")
        XCTAssertEqual(output.radioStationWebpage, "RadioStationURL.com")
        XCTAssertEqual(output.mp4Tag["Radio Station Webpage"], "RadioStationURL.com")
        XCTAssertEqual(output.rating, .clean)
        XCTAssertEqual(output.recordCompany, "Record Company")
        XCTAssertEqual(output.recordCompanyWebpage, "RecordCompanyURL.com")
        XCTAssertEqual(output.recordingCopyright, "\u{2117}2020 Recording Copyright")
        XCTAssertEqual(output.recordingDateTime, testAllDate)
        XCTAssertEqual(output.releaseDateTime, testAllDate)
        XCTAssertEqual(output.requirements, "Requirements")
        XCTAssertEqual(output.sellerID, "SellerID")
        XCTAssertEqual(output.series, "Series")
        XCTAssertEqual(output.seriesDescription, "Series Description")
        XCTAssertEqual(output.seriesEpisodeNumber, 5)
        XCTAssertEqual(output.seriesEpisodeTitle, "Episode Title")
        XCTAssertEqual(output.seriesNetworkOrChannel, "Network")
        XCTAssertEqual(output.seriesSeason, 6)
        XCTAssertEqual(output.seriesSort, "Series Sort")
        XCTAssertEqual(output.showWorkAndMovement, true)
        XCTAssertEqual(output.softwareVersion, "Software Version")
        XCTAssertEqual(output.soloist, "Soloist Name")
        XCTAssertEqual(output.musicianCreditsList[.soloist], ["Soloist Name"])
        XCTAssertEqual(output.songDescription, "Song Description")
        XCTAssertEqual(output.songwriter, "Songwriter Name")
        XCTAssertEqual(output.involvementCreditsList[.songwriter], ["Songwriter Name"])
        XCTAssertEqual(output.songwriterKeywords, ["Songwriter", "Key", "Words"])
        XCTAssertEqual(output.soundEngineer, "Sound Engineer Name")
        XCTAssertEqual(output.involvementCreditsList[.soundEngineer], ["Sound Engineer Name"])
        XCTAssertEqual(output.sourceCredit, "Source Credit")
        XCTAssertEqual(output.subtitle, "Subtitle")
        XCTAssertEqual(output.subtitleKeywords, ["Subtitle", "Key", "Words"])
        XCTAssertEqual(output.taggingDateTime, testAllDate)
        XCTAssertEqual(output.mp4Tag["Tagging Date/Time"], formatter.string(from: testAllDate))
        XCTAssertEqual(output.thanks, "Thanks")
        XCTAssertEqual(output.title, "Title")
        XCTAssertEqual(output.titleKeywords, ["Title", "Key", "Words"])
        XCTAssertEqual(output.titleSort, "Title Sort")
        XCTAssertEqual(output.trackNumber.index, 7)
        XCTAssertEqual(output.trackNumber.total, 8)
        XCTAssertEqual(output.trackOrSetSubtitle, "Track/Set Subtitle")
        XCTAssertEqual(output.work, "Work")
        XCTAssertEqual(output.writer, "Writer Name")
        XCTAssertEqual(output.involvementCreditsList[.writer], ["Writer Name"])
        XCTAssertEqual(output.year, components.year)
    }
//    
//    func testAudibleCopyrightString() throws {
//        let path = "/Users/nolainecrusher/Downloads/audiobook_tools/samples/October262020_ep7.aax"
//        let url = URL(fileURLWithPath: path)
//        var file = try AudioFile(location: url)
//        print(file.copyright)
//        print(file.recordingCopyright)
//        print(file.copyright)
//    }
}
