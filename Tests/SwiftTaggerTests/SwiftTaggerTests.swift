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
    
    // MARK: - Mp4 String
    func testReadWriteMp4StringMetadataA_L() throws {
        var file = try AudioFile(location: mp4Meta)
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
        XCTAssertEqual(file.artistWebpage, "Artist Url")
        file.artistWebpage = "New Artist Webpage"
        XCTAssertEqual(file.audioFileWebpage, "audio file webpage")
        file.audioFileWebpage = "New Audio File Webpage"
        XCTAssertEqual(file.audioSourceWebpage, "audio source webpage")
        file.audioSourceWebpage = "New Audio Source Webpage"
        XCTAssertEqual(file.comment, "Comment")
        file.comment = "New Comment"
        XCTAssertEqual(file.composer, "Composer")
        file.composer = "New Composer"
        XCTAssertEqual(file.composerSort, "Composer Sort")
        file.composerSort = "New Composer Sort"
        XCTAssertEqual(file.conductor, "Conductor")
        file.conductor = "New Conductor"
        XCTAssertEqual(file.copyright, "Copyright")
        file.copyright = "New Copyright"
        XCTAssertEqual(file.copyrightWebpage, "copyright webpage")
        file.copyrightWebpage = "New Copyright Webpage"
        XCTAssertEqual(file.description, "Description")
        file.description = "New Description"
        XCTAssertEqual(file.encodedBy, "Encoded By")
        file.encodedBy = "New EncodedBy"
        XCTAssertEqual(file.encodingSettings, "encoding settings")
        file.encodingSettings = "New Encoding Settings"
        XCTAssertEqual(file.encodingTool, "Encoding Tool")
        file.encodingTool = "New Encoding Tool"
        XCTAssertEqual(file.filmMakerWebpage, "Filmmaker Url")
        file.filmMakerWebpage = "New FilmMaker Webpage"
        XCTAssertEqual(file.genre, "Custom Genre")
        file.genre = "New Genre"
        XCTAssertEqual(file.grouping, "Grouping")
        file.grouping = "New Grouping"
        XCTAssertEqual(file.information, "Information")
        file.information = "New Information"
        XCTAssertEqual(file.isrc, "123456789012")
        file.isrc = "1234ISRC5678"
        
        XCTAssertEqual(file.label, "Label")
        file.label = "New Label"
        XCTAssertEqual(file.linerNotes, "Liner Notes")
        file.linerNotes = "New Liner Notes"
        XCTAssertEqual(file.longDescription, "Long Description")
        file.longDescription = "New Long Description"
        XCTAssertEqual(file.lyricist, "Lyricist")
        file.lyricist = "New Lyricist"
        XCTAssertEqual(file.lyrics, "Lyrics")
        file.lyrics = "New Lyrics"


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
        XCTAssertEqual(newFile.genre, "New Genre")
        XCTAssertEqual(newFile.grouping, "New Grouping")
        XCTAssertEqual(newFile.information, "New Information")
        XCTAssertEqual(newFile.isrc, "1234ISRC5678")
        XCTAssertEqual(newFile.label, "New Label")
        XCTAssertEqual(newFile.linerNotes,"New Liner Notes")
        XCTAssertEqual(newFile.longDescription,"New Long Description")
        XCTAssertEqual(newFile.lyricist,"New Lyricist")
        XCTAssertEqual(newFile.lyrics,"New Lyrics")
    }
    
    // MARK: - Mp3 String
    func testReadWriteMp3StringMetadataA_L() throws {
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
        XCTAssertEqual(file.genre, "Blues Refinement")
        file.genre = "New Genre"
        XCTAssertEqual(file.grouping, "Grouping")
        file.grouping = "New Grouping"
        XCTAssertNil(file.information)
        file.information = "New Information"
        XCTAssertEqual(file.isrc, "987654321098")
        file.isrc = "1234ISRC5678"

        XCTAssertEqual(file.label, "Publisher")
        file.label = "New Label"
        XCTAssertEqual(file.linerNotes, "Liner Notes")
        file.linerNotes = "New Liner Notes"
        XCTAssertEqual(file.longDescription, "Long Description")
        file.longDescription = "New Long Description"
        XCTAssertEqual(file.lyricist, "Lyricist")
        file.lyricist = "New Lyricist"
        XCTAssertEqual(file.lyrics, "Lyrics Content")
        file.lyrics = "New Lyrics"

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
        XCTAssertEqual(newFile.genre, "New Genre")
        XCTAssertEqual(newFile.grouping, "New Grouping")
        XCTAssertEqual(newFile.information, "New Information")
        XCTAssertEqual(newFile.isrc, "1234ISRC5678")
        XCTAssertEqual(newFile.label, "New Label")
        XCTAssertEqual(newFile.linerNotes,"New Liner Notes")
        XCTAssertEqual(newFile.longDescription,"New Long Description")
        XCTAssertEqual(newFile.lyricist,"New Lyricist")
        XCTAssertEqual(newFile.lyrics,"New Lyrics")
    }
}
/*
 */
