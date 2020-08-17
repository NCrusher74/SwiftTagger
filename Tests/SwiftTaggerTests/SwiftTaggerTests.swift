import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests: XCTestCase {
    
    func testCompletion() throws {
        XCTAssertEqual(MetadataItem.allCases.count, (MetadataID_Int.allCases.count + MetadataID_Bool.allCases.count + MetadataID_Date.allCases.count + MetadataID_Image.allCases.count + MetadataID_Other.allCases.count + MetadataID_PartOfTotal.allCases.count + MetadataID_StringArray.allCases.count + MetadataID_String.allCases.count))
        print(MetadataItem.allCases.count)
    }
    func testAudioFileInit() throws {
        XCTAssertNoThrow(try AudioFile(location: mp4NoMeta))
        XCTAssertNoThrow(try AudioFile(location: mp3NoMeta))        
    }
    
    func testListMetadataID3() throws {
        let mp4 = try AudioFile(location: mp4Meta)
        XCTAssertNotNil(mp4.mp4Tag)
        XCTAssertFalse(mp4.listMetadata.isEmpty)
        for item in mp4.listMetadata {
            print(item)
        }
        
        let mp3 = try AudioFile(location: mp3v24)
        XCTAssertNotNil(mp3.id3Tag)
        XCTAssertFalse(mp3.listMetadata.isEmpty)
        for item in mp3.listMetadata {
            print(item)
        }
    }
    
    func testReadWriteMp4StringMetadataA_C() throws {
        var mp4 = try AudioFile(location: mp4Meta)
        XCTAssertEqual(mp4.acknowledgment, "ACKNOWLEDGMENT")
        mp4.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(mp4.album, "ALBUM")
        mp4.album = "New Album"
        XCTAssertEqual(mp4.albumArtist, "ALBUMARTIST")
        mp4.albumArtist = "New Album Artist"
        XCTAssertEqual(mp4.albumArtistSort, "SORTALBUMARTIST")
        mp4.albumArtistSort = "New Album Artist Sort"
        XCTAssertEqual(mp4.albumSort, "SORTALBUM")
        mp4.albumSort = "New Album Sort"
        XCTAssertEqual(mp4.arranger, "ARRANGER")
        mp4.arranger = "New Arranger"
        XCTAssertEqual(mp4.artist, "ARTIST")
        mp4.artist = "New Artist"
        XCTAssertEqual(mp4.artistSort, "SORTARTIST")
        mp4.artistSort = "New Artist Sort"
        XCTAssertEqual(mp4.artistWebpage, "WWW.ARTIST.URL")
        mp4.artistWebpage = "New Artist Webpage"
        XCTAssertNil(mp4.audioFileWebpage)
        mp4.audioFileWebpage = "New Audio File Webpage"
        XCTAssertNil(mp4.audioSourceWebpage)
        mp4.audioSourceWebpage = "New Audio Source Webpage"
        XCTAssertEqual(mp4.comment, "COMMENT")
        mp4.comment = "New Comment"
        XCTAssertEqual(mp4.composer, "COMPOSER")
        mp4.composer = "New Composer"
        XCTAssertEqual(mp4.composerSort, "SORTCOMPOSER")
        mp4.composerSort = "New Composer Sort"
        XCTAssertEqual(mp4.conductor, "CONDUCTOR")
        mp4.conductor = "New Conductor"
        XCTAssertEqual(mp4.copyright, "2020 COPYRIGHT")
        mp4.copyright = "New Copyright"
        XCTAssertNil(mp4.copyrightWebpage)
        mp4.copyrightWebpage = "New Copyright Webpage"

        let mp4Output = try localDirectory(fileName: "testMp4", fileExtension: "m4a")
        try mp4.write(outputLocation: mp4Output)
        
        let newMp4 = try AudioFile(location: mp4Output)
        XCTAssertEqual(newMp4.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newMp4.album, "New Album")
        XCTAssertEqual(newMp4.albumArtist, "New Album Artist")
        XCTAssertEqual(newMp4.albumArtistSort, "New Album Artist Sort")
        XCTAssertEqual(newMp4.albumSort, "New Album Sort")
        XCTAssertEqual(newMp4.arranger, "New Arranger")
        XCTAssertEqual(newMp4.artist, "New Artist")
        XCTAssertEqual(newMp4.artistSort, "New Artist Sort")
        XCTAssertEqual(newMp4.artistWebpage, "New Artist Webpage")
        XCTAssertEqual(newMp4.audioFileWebpage, "New Audio File Webpage")
        XCTAssertEqual(newMp4.audioSourceWebpage, "New Audio Source Webpage")
        XCTAssertEqual(newMp4.comment, "New Comment")
        XCTAssertEqual(newMp4.composer, "New Composer")
        XCTAssertEqual(newMp4.composerSort, "New Composer Sort")
        XCTAssertEqual(newMp4.conductor, "New Conductor")
        XCTAssertEqual(newMp4.copyright, "New Copyright")
        XCTAssertEqual(newMp4.copyrightWebpage, "New Copyright Webpage")
    }
    
    func testReadWriteMp3StringMetadataA() throws {
        var mp3 = try AudioFile(location: mp3v24)
        XCTAssertEqual(mp3.acknowledgment, "Acknowledgment")
        mp3.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(mp3.album, "Album")
        mp3.album = "New Album"
        XCTAssertEqual(mp3.albumArtist, "Album Artist")
        mp3.albumArtist = "New Album Artist"
        XCTAssertEqual(mp3.albumArtistSort, "Album Artist Sort")
        mp3.albumArtistSort = "New Album Artist Sort"
        XCTAssertEqual(mp3.albumSort, "Album Sort")
        mp3.albumSort = "New Album Sort"
        XCTAssertEqual(mp3.arranger, "Arranger")
        mp3.arranger = "New Arranger"
        XCTAssertEqual(mp3.artist, "Artist")
        mp3.artist = "New Artist"
        XCTAssertEqual(mp3.artistSort, "Artist Sort")
        mp3.artistSort = "New Artist Sort"
        XCTAssertEqual(mp3.artistWebpage, "http://artist.url")
        mp3.artistWebpage = "New Artist Webpage"
        XCTAssertEqual(mp3.audioFileWebpage, "http://audiofile.url")
        mp3.audioFileWebpage = "New Audio File Webpage"
        XCTAssertEqual(mp3.audioSourceWebpage, "http://audiosource.url")
        mp3.audioSourceWebpage = "New Audio Source Webpage"
        XCTAssertEqual(mp3.comment, "Comment Content")
        mp3.comment = "New Comment"
        XCTAssertEqual(mp3.composer, "Composer")
        mp3.composer = "New Composer"
        XCTAssertEqual(mp3.composerSort, "Composer Sort")
        mp3.composerSort = "New Composer Sort"
        XCTAssertEqual(mp3.conductor, "Conductor")
        mp3.conductor = "New Conductor"
        XCTAssertEqual(mp3.copyright, "2020 Copyright")
        mp3.copyright = "New Copyright"
        XCTAssertEqual(mp3.copyrightWebpage, "http://copyright.url")
        mp3.copyrightWebpage = "New Copyright Webpage"
        
        let mp3Output = try localDirectory(fileName: "testMp3", fileExtension: "mp3")
        try mp3.write(outputLocation: mp3Output)
        
        let newMp3 = try AudioFile(location: mp3Output)
        XCTAssertEqual(newMp3.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newMp3.album, "New Album")
        XCTAssertEqual(newMp3.albumArtist, "New Album Artist")
        XCTAssertEqual(newMp3.albumArtistSort, "New Album Artist Sort")
        XCTAssertEqual(newMp3.albumSort, "New Album Sort")
        XCTAssertEqual(newMp3.arranger, "New Arranger")
        XCTAssertEqual(newMp3.artist, "New Artist")
        XCTAssertEqual(newMp3.artistSort, "New Artist Sort")
        XCTAssertEqual(newMp3.artistWebpage, "New Artist Webpage")
        XCTAssertEqual(newMp3.audioFileWebpage, "New Audio File Webpage")
        XCTAssertEqual(newMp3.audioSourceWebpage, "New Audio Source Webpage")
        XCTAssertEqual(newMp3.comment, "New Comment")
        XCTAssertEqual(newMp3.composer, "New Composer")
        XCTAssertEqual(newMp3.composerSort, "New Composer Sort")
        XCTAssertEqual(newMp3.conductor, "New Conductor")
        XCTAssertEqual(newMp3.copyright, "New Copyright")
        XCTAssertEqual(newMp3.copyrightWebpage, "New Copyright Webpage")
    }
}

/*
 case comment
 case composer
 case composerSort
 case conductor
 case copyright
 case copyrightWebpage
 */


