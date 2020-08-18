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
        var file = try AudioFile(location: mp4Meta)
        XCTAssertEqual(file.acknowledgment, "ACKNOWLEDGMENT")
        file.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(file.album, "ALBUM")
        file.album = "New Album"
        XCTAssertEqual(file.albumArtist, "ALBUMARTIST")
        file.albumArtist = "New Album Artist"
        XCTAssertEqual(file.albumArtistSort, "SORTALBUMARTIST")
        file.albumArtistSort = "New Album Artist Sort"
        XCTAssertEqual(file.albumSort, "SORTALBUM")
        file.albumSort = "New Album Sort"
        XCTAssertEqual(file.arranger, "ARRANGER")
        file.arranger = "New Arranger"
        XCTAssertEqual(file.artist, "ARTIST")
        file.artist = "New Artist"
        XCTAssertEqual(file.artistSort, "SORTARTIST")
        file.artistSort = "New Artist Sort"
        XCTAssertEqual(file.artistWebpage, "WWW.ARTIST.URL")
        file.artistWebpage = "New Artist Webpage"
        XCTAssertNil(file.audioFileWebpage)
        file.audioFileWebpage = "New Audio File Webpage"
        XCTAssertNil(file.audioSourceWebpage)
        file.audioSourceWebpage = "New Audio Source Webpage"
        XCTAssertEqual(file.comment, "COMMENT")
        file.comment = "New Comment"
        XCTAssertEqual(file.composer, "COMPOSER")
        file.composer = "New Composer"
        XCTAssertEqual(file.composerSort, "SORTCOMPOSER")
        file.composerSort = "New Composer Sort"
        XCTAssertEqual(file.conductor, "CONDUCTOR")
        file.conductor = "New Conductor"
        XCTAssertEqual(file.copyright, "2020 COPYRIGHT")
        file.copyright = "New Copyright"
        XCTAssertNil(file.copyrightWebpage)
        file.copyrightWebpage = "New Copyright Webpage"

        XCTAssertEqual(file.description, "DESCRIPTION")
        file.description = "New Description"
        XCTAssertEqual(file.encodedBy, "ENCODED BY")
        file.encodedBy = "New EncodedBy"
        XCTAssertNil(file.encodingSettings)
        file.encodingSettings = "New Encoding Settings"
        XCTAssertEqual(file.encodingTool, "ENCODING TOOL")
        file.encodingTool = "New Encoding Tool"
        XCTAssertEqual(file.filmMakerWebpage, "FILMMAKER.COM")
        file.filmMakerWebpage = "New FilmMaker Webpage"

        let mp4Output = try localDirectory(fileName: "testMp4", fileExtension: "m4a")
        try file.write(outputLocation: mp4Output)
        
        let newFile = try AudioFile(location: mp4Output)
        XCTAssertEqual(newFile.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newFile.album, "New Album")
        XCTAssertEqual(newFile.albumArtist, "New Album Artist")
        XCTAssertEqual(newFile.albumArtistSort, "New Album Artist Sort")
        XCTAssertEqual(newFile.albumSort, "New Album Sort")
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.artistSort, "New Artist Sort")
        XCTAssertEqual(newFile.artistWebpage, "New Artist Webpage")
        XCTAssertEqual(newFile.audioFileWebpage, "New Audio File Webpage")
        XCTAssertEqual(newFile.audioSourceWebpage, "New Audio Source Webpage")
        XCTAssertEqual(newFile.comment, "New Comment")
        XCTAssertEqual(newFile.composer, "New Composer")
        XCTAssertEqual(newFile.composerSort, "New Composer Sort")
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.copyright, "New Copyright")
        XCTAssertEqual(newFile.copyrightWebpage, "New Copyright Webpage")
        XCTAssertEqual(newFile.description, "New Description")
        XCTAssertEqual(newFile.encodedBy, "New EncodedBy")
        XCTAssertEqual(newFile.encodingSettings, "New Encoding Settings")
        XCTAssertEqual(newFile.encodingTool, "New Encoding Tool")
        XCTAssertEqual(newFile.filmMakerWebpage, "New FilmMaker Webpage")
    }
    
    func testReadWriteMp3StringMetadataA_F() throws {
        var file = try AudioFile(location: mp3v24)
        XCTAssertEqual(file.acknowledgment, "Acknowledgment")
        file.acknowledgment = "New Acknowledgment"
        XCTAssertEqual(file.album, "Album")
        file.album = "New Album"
        XCTAssertEqual(file.albumArtist, "Album Artist")
        file.albumArtist = "New Album Artist"
        XCTAssertEqual(file.albumArtistSort, "Album Artist Sort")
        file.albumArtistSort = "New Album Artist Sort"
        XCTAssertEqual(file.albumSort, "Album Sort")
        file.albumSort = "New Album Sort"
        XCTAssertEqual(file.arranger, "Arranger")
        file.arranger = "New Arranger"
        XCTAssertEqual(file.artist, "Artist")
        file.artist = "New Artist"
        XCTAssertEqual(file.artistSort, "Artist Sort")
        file.artistSort = "New Artist Sort"
        XCTAssertEqual(file.artistWebpage, "http://artist.url")
        file.artistWebpage = "New Artist Webpage"
        XCTAssertEqual(file.audioFileWebpage, "http://audiofile.url")
        file.audioFileWebpage = "New Audio File Webpage"
        XCTAssertEqual(file.audioSourceWebpage, "http://audiosource.url")
        file.audioSourceWebpage = "New Audio Source Webpage"
        XCTAssertEqual(file.comment, "Comment Content")
        file.comment = "New Comment"
        XCTAssertEqual(file.composer, "Composer")
        file.composer = "New Composer"
        XCTAssertEqual(file.composerSort, "Composer Sort")
        file.composerSort = "New Composer Sort"
        XCTAssertEqual(file.conductor, "Conductor")
        file.conductor = "New Conductor"
        XCTAssertEqual(file.copyright, "2020 Copyright")
        file.copyright = "New Copyright"
        XCTAssertEqual(file.copyrightWebpage, "http://copyright.url")
        file.copyrightWebpage = "New Copyright Webpage"
        XCTAssertEqual(file.description, "Description")
        file.description = "New Description"
        XCTAssertEqual(file.encodedBy, "Encoded By")
        file.encodedBy = "New EncodedBy"
        XCTAssertEqual(file.encodingSettings, "Encoding Settings")
        file.encodingSettings = "New Encoding Settings"
        XCTAssertNil(file.encodingTool)
        file.encodingTool = "New Encoding Tool"
        XCTAssertNil(file.filmMakerWebpage)
        file.filmMakerWebpage = "New FilmMaker Webpage"

        let mp3Output = try localDirectory(fileName: "testMp3", fileExtension: "mp3")
        try file.write(outputLocation: mp3Output)
        
        let newFile = try AudioFile(location: mp3Output)
        XCTAssertEqual(newFile.acknowledgment, "New Acknowledgment")
        XCTAssertEqual(newFile.album, "New Album")
        XCTAssertEqual(newFile.albumArtist, "New Album Artist")
        XCTAssertEqual(newFile.albumArtistSort, "New Album Artist Sort")
        XCTAssertEqual(newFile.albumSort, "New Album Sort")
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.artistSort, "New Artist Sort")
        XCTAssertEqual(newFile.artistWebpage, "New Artist Webpage")
        XCTAssertEqual(newFile.audioFileWebpage, "New Audio File Webpage")
        XCTAssertEqual(newFile.audioSourceWebpage, "New Audio Source Webpage")
        XCTAssertEqual(newFile.comment, "New Comment")
        XCTAssertEqual(newFile.composer, "New Composer")
        XCTAssertEqual(newFile.composerSort, "New Composer Sort")
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.copyright, "New Copyright")
        XCTAssertEqual(newFile.copyrightWebpage, "New Copyright Webpage")
        XCTAssertEqual(newFile.description, "New Description")
        XCTAssertEqual(newFile.encodedBy, "New EncodedBy")
        XCTAssertEqual(newFile.encodingSettings, "New Encoding Settings")
        XCTAssertEqual(newFile.encodingTool, "New Encoding Tool")
        XCTAssertEqual(newFile.filmMakerWebpage, "New FilmMaker Webpage")
    }
}

/*
 /*
 case description
 case encodedBy
 case encodingSettings
 case encodingTool
 case filmMakerWebpage
 */
 */


