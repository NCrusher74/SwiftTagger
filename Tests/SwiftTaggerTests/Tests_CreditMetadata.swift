import XCTest
import SwiftTaggerID3
import SwiftTaggerMP4
@testable import SwiftTagger

@available(OSX 10.13, *)
final class SwiftTaggerTests_CreditMetadata: XCTestCase {

    func testCreditListsMp4() throws {
        var read = try AudioFile(location: mp4Meta)
        // test read
        XCTAssertEqual(read.performanceCreditsList[.artist], ["Artist"])
        XCTAssertEqual(read.performanceCreditsList[.soloist], ["Soloist"])
        XCTAssertEqual(read.performanceCreditsList[.narrator], ["Narrator"])
        XCTAssertEqual(read.performanceCreditsList[.performer], ["Performers"])
        XCTAssertEqual(read.involvementCreditsList[.arranger], ["Arranger"])
        XCTAssertEqual(read.involvementCreditsList[.artDirection], ["Art Director"])
        XCTAssertEqual(read.involvementCreditsList[.composer], ["Composer"])
        XCTAssertEqual(read.involvementCreditsList[.conductor], ["Conductor"])
        XCTAssertEqual(read.involvementCreditsList[.director], ["Director"])
        XCTAssertEqual(read.involvementCreditsList[.executiveProducer], ["Executive Producer"])
        XCTAssertEqual(read.involvementCreditsList[.lyricist], ["Lyricist"])
        XCTAssertEqual(read.involvementCreditsList[.producer], ["Producer"])
        XCTAssertEqual(read.involvementCreditsList[.publisher], ["Publisher"])
        XCTAssertEqual(read.involvementCreditsList[.soundEngineer], ["Sound Engineer"])
        XCTAssertEqual(read.involvementCreditsList[.writer], ["Writer"])

        var write = try AudioFile(location: mp4NoMeta)
        write.performanceCreditsList[.artist] = ["New Artist"]
        write.performanceCreditsList[.soloist] = ["New Soloist"]
        write.performanceCreditsList[.narrator] = ["New Narrator"]
        write.performanceCreditsList[.performer] = ["Performer 1", "Performer 2"]
        write.involvementCreditsList[.arranger] = ["New Arranger"]
        write.involvementCreditsList[.artDirection] = ["New Art Director"]
        write.involvementCreditsList[.composer] = ["New Composer"]
        write.involvementCreditsList[.conductor] = ["New Conductor"]
        write.involvementCreditsList[.director] = ["New Director"]
        write.involvementCreditsList[.executiveProducer] = ["New Exec Producer"]
        write.involvementCreditsList[.lyricist] = ["New Lyricist"]
        write.involvementCreditsList[.producer] = ["New Producer"]
        write.involvementCreditsList[.publisher] = ["New Publisher"]
        write.involvementCreditsList[.soundEngineer] = ["New Sound Engineer"]
        write.involvementCreditsList[.writer] = ["Writer 1", "Writer 2"]

        let outputUrl = try localDirectory(fileName: "testMp4-Credit", fileExtension: "m4a")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertEqual(newFile.performanceCreditsList[.artist], ["New Artist"])
        XCTAssertEqual(newFile.performanceCreditsList[.soloist], ["New Soloist"])
        XCTAssertEqual(newFile.performanceCreditsList[.narrator], ["New Narrator"])
        XCTAssertEqual(newFile.performanceCreditsList[.performer], ["Performer 1", "Performer 2"])
        XCTAssertEqual(newFile.involvementCreditsList[.arranger], ["New Arranger"])
        XCTAssertEqual(newFile.involvementCreditsList[.artDirection], ["New Art Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.composer], ["New Composer"])
        XCTAssertEqual(newFile.involvementCreditsList[.conductor], ["New Conductor"])
        XCTAssertEqual(newFile.involvementCreditsList[.director], ["New Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.executiveProducer], ["New Exec Producer"])
        XCTAssertEqual(newFile.involvementCreditsList[.lyricist], ["New Lyricist"])
        XCTAssertEqual(newFile.involvementCreditsList[.producer], ["New Producer"])
        XCTAssertEqual(newFile.involvementCreditsList[.publisher], ["New Publisher"])
        XCTAssertEqual(newFile.involvementCreditsList[.soundEngineer], ["New Sound Engineer"])
        XCTAssertEqual(newFile.involvementCreditsList[.writer], ["Writer 1", "Writer 2"])
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.soloist, "New Soloist")
        XCTAssertEqual(newFile.narrator, "New Narrator")
        XCTAssertEqual(newFile.performers, ["Performer 1", "Performer 2"])
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.artDirector, "New Art Director")
        XCTAssertEqual(newFile.composer, "New Composer")
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.executiveProducer, "New Exec Producer")
        XCTAssertEqual(newFile.lyricist, "New Lyricist")
        XCTAssertEqual(newFile.producer, "New Producer")
        XCTAssertEqual(newFile.publisher, "New Publisher")
        XCTAssertEqual(newFile.director, "New Director")
        XCTAssertEqual(newFile.soundEngineer, "New Sound Engineer")
        XCTAssertEqual(newFile.writer, "Writer 1;Writer 2")

        read.clearPerformanceCreditList()
        read.clearInvolvementCreditList()
        let outputUrl2 = try localDirectory(fileName: "testMp4-ClearList", fileExtension: "m4a")
        try read.write(outputLocation: outputUrl2)
        
        var newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertTrue(newFile2.performanceCreditsList.isEmpty)
        XCTAssertTrue(newFile2.involvementCreditsList.isEmpty)
        XCTAssertNil(newFile2.performanceCreditsList[.artist])
        XCTAssertNil(newFile2.performanceCreditsList[.soloist])
        XCTAssertNil(newFile2.performanceCreditsList[.narrator])
        XCTAssertNil(newFile2.performanceCreditsList[.performer])
        XCTAssertNil(newFile2.involvementCreditsList[.arranger])
        XCTAssertNil(newFile2.involvementCreditsList[.artDirection])
        XCTAssertNil(newFile2.involvementCreditsList[.composer])
        XCTAssertNil(newFile2.involvementCreditsList[.conductor])
        XCTAssertNil(newFile2.involvementCreditsList[.director])
        XCTAssertNil(newFile2.involvementCreditsList[.executiveProducer])
        XCTAssertNil(newFile2.involvementCreditsList[.lyricist])
        XCTAssertNil(newFile2.involvementCreditsList[.producer])
        XCTAssertNil(newFile2.involvementCreditsList[.publisher])
        XCTAssertNil(newFile2.involvementCreditsList[.soundEngineer])
        XCTAssertNil(newFile2.involvementCreditsList[.writer])
        XCTAssertNil(newFile2.artist)
        XCTAssertNil(newFile2.soloist)
        XCTAssertNil(newFile2.narrator)
        XCTAssertNil(newFile2.performers)
        XCTAssertNil(newFile2.arranger)
        XCTAssertNil(newFile2.artDirector)
        XCTAssertNil(newFile2.composer)
        XCTAssertNil(newFile2.conductor)
        XCTAssertNil(newFile2.director)
        XCTAssertNil(newFile2.executiveProducer)
        XCTAssertNil(newFile2.lyricist)
        XCTAssertNil(newFile2.producer)
        XCTAssertNil(newFile2.publisher)
        XCTAssertNil(newFile2.soundEngineer)
        XCTAssertNil(newFile2.writer)
        
        newFile2.addPerformanceCredit(.artist, person: "Other New Artist")
        newFile2.addPerformanceCredit(.narrator, person: "Other New Narrator")
        newFile2.addPerformanceCredit(.soloist, person: "Other New Soloist")
        newFile2.addPerformanceCredit(.performer, person: "Other New Performer")
        newFile2.addPerformanceCredit(.accompaniment, person: "Other New Accompanist")
        newFile2.addInvolvementCredit(.arranger, person: "Other New Arranger")
        newFile2.addInvolvementCredit(.artDirection, person: "Other New Art Director")
        newFile2.addInvolvementCredit(.composer, person: "Other New Composer")
        newFile2.addInvolvementCredit(.conductor, person: "Other New Conductor")
        newFile2.addInvolvementCredit(.director, person: "Other New Director")
        newFile2.addInvolvementCredit(.executiveProducer, person: "Other New Exec")
        newFile2.addInvolvementCredit(.lyricist, person: "Other New Lyricist")
        newFile2.addInvolvementCredit(.producer, person: "Other New Producer")
        newFile2.addInvolvementCredit(.publisher, person: "Other New Publisher")
        newFile2.addInvolvementCredit(.soundEngineer, person: "Other New Engineer")
        newFile2.addInvolvementCredit(.writer, person: "Other New Writer")
        newFile2.addInvolvementCredit(.writer, person: "Writer's Assistant")

        let accompanist = SwiftTagger.MusicianAndPerformerCredits.accompaniment.rawValue

        XCTAssertEqual(newFile2.artist, "Other New Artist")
        XCTAssertEqual(newFile2.narrator, "Other New Narrator")
        XCTAssertEqual(newFile2.soloist, "Other New Soloist")
        XCTAssertEqual(newFile2.performers, ["Other New Performer"])
        XCTAssertEqual(newFile2[accompanist], "Other New Accompanist")
        XCTAssertEqual(newFile2.arranger, "Other New Arranger")
        XCTAssertEqual(newFile2.artDirector, "Other New Art Director")
        XCTAssertEqual(newFile2.composer, "Other New Composer")
        XCTAssertEqual(newFile2.conductor, "Other New Conductor")
        XCTAssertEqual(newFile2.executiveProducer, "Other New Exec")
        XCTAssertEqual(newFile2.lyricist, "Other New Lyricist")
        XCTAssertEqual(newFile2.producer, "Other New Producer")
        XCTAssertEqual(newFile2.publisher, "Other New Publisher")
        XCTAssertEqual(newFile2.soundEngineer, "Other New Engineer")
        XCTAssertEqual(newFile2.writer, "Other New Writer;Writer's Assistant")

        let outputUrl3 = try localDirectory(fileName: "testMp4-AddCreditItems", fileExtension: "m4a")
        try newFile2.write(outputLocation: outputUrl3)
        
        var newFile3 = try AudioFile(location: outputUrl3)
        XCTAssertEqual(newFile3.artist, "Other New Artist")
        XCTAssertEqual(newFile3.narrator, "Other New Narrator")
        XCTAssertEqual(newFile3.soloist, "Other New Soloist")
        XCTAssertEqual(newFile3.performers, ["Other New Performer"])
        XCTAssertEqual(newFile3[accompanist], "Other New Accompanist")
        XCTAssertEqual(newFile3.arranger, "Other New Arranger")
        XCTAssertEqual(newFile3.artDirector, "Other New Art Director")
        XCTAssertEqual(newFile3.composer, "Other New Composer")
        XCTAssertEqual(newFile3.conductor, "Other New Conductor")
        XCTAssertEqual(newFile3.executiveProducer, "Other New Exec")
        XCTAssertEqual(newFile3.lyricist, "Other New Lyricist")
        XCTAssertEqual(newFile3.producer, "Other New Producer")
        XCTAssertEqual(newFile3.publisher, "Other New Publisher")
        XCTAssertEqual(newFile3.soundEngineer, "Other New Engineer")
        XCTAssertEqual(newFile3.writer, "Other New Writer;Writer's Assistant")
        
        newFile3.removeInvolvementCredit(.writer)
        newFile3.removePerformanceCredit(.soloist)
        newFile3.removePerformanceCredit(.accompaniment)
        
        let outputUrl4 = try localDirectory(fileName: "testMp4-RemoveSingleCreditItems", fileExtension: "m4a")
        try newFile3.write(outputLocation: outputUrl4)
        
        let newFile4 = try AudioFile(location: outputUrl4)
        XCTAssertNil(newFile4.writer)
        XCTAssertNil(newFile4.soloist)
        XCTAssertNil(newFile4[accompanist])
    }
    
    func testCreditListID3() throws {
        // test read
        var read = try AudioFile(location: mp3v24)
        XCTAssertEqual(read.performanceCreditsList[.soprano], ["Soprano Name"])
        XCTAssertEqual(read.performanceCreditsList[.alto], ["Alto Name"])

        var write = try AudioFile(location: mp3NoMeta)
        write.performanceCreditsList[.artist] = ["New Artist"]
        write.performanceCreditsList[.soloist] = ["New Soloist"]
        write.performanceCreditsList[.narrator] = ["New Narrator"]
        write.performanceCreditsList[.performer] = ["Performer 1", "Performer 2"]
        write.involvementCreditsList[.arranger] = ["New Arranger"]
        write.involvementCreditsList[.artDirection] = ["New Art Director"]
        write.involvementCreditsList[.composer] = ["New Composer"]
        write.involvementCreditsList[.conductor] = ["New Conductor"]
        write.involvementCreditsList[.director] = ["New Director"]
        write.involvementCreditsList[.executiveProducer] = ["New Exec Producer"]
        write.involvementCreditsList[.lyricist] = ["New Lyricist"]
        write.involvementCreditsList[.producer] = ["New Producer"]
        write.involvementCreditsList[.publisher] = ["New Publisher"]
        write.involvementCreditsList[.soundEngineer] = ["New Sound Engineer"]
        write.involvementCreditsList[.writer] = ["Writer 1", "Writer 2"]

        let outputUrl = try localDirectory(fileName: "testMp3-Credits", fileExtension: "mp3")
        try write.write(outputLocation: outputUrl)
        
        let newFile = try AudioFile(location: outputUrl)
        XCTAssertNil(newFile.performanceCreditsList[.artist])
        XCTAssertEqual(newFile.artist, "New Artist")
        XCTAssertEqual(newFile.performanceCreditsList[.soloist], ["New Soloist"])
        XCTAssertEqual(newFile.performanceCreditsList[.narrator], ["New Narrator"])
        XCTAssertEqual(newFile.performanceCreditsList[.performer], ["Performer 1", "Performer 2"])
        XCTAssertNil(newFile.involvementCreditsList[.arranger])
        XCTAssertEqual(newFile.arranger, "New Arranger")
        XCTAssertEqual(newFile.involvementCreditsList[.artDirection], ["New Art Director"])
        XCTAssertNil(newFile.involvementCreditsList[.composer])
        XCTAssertEqual(newFile.composer, "New Composer")
        XCTAssertNil(newFile.involvementCreditsList[.conductor])
        XCTAssertEqual(newFile.conductor, "New Conductor")
        XCTAssertEqual(newFile.involvementCreditsList[.director], ["New Director"])
        XCTAssertEqual(newFile.involvementCreditsList[.executiveProducer], ["New Exec Producer"])
        XCTAssertEqual(newFile.lyricist, "New Lyricist")
        XCTAssertEqual(newFile.involvementCreditsList[.producer], ["New Producer"])
        XCTAssertNil(newFile.involvementCreditsList[.publisher])
        XCTAssertEqual(newFile.publisher, "New Publisher")
        XCTAssertEqual(newFile.involvementCreditsList[.soundEngineer], ["New Sound Engineer"])
        XCTAssertEqual(newFile.involvementCreditsList[.writer], ["Writer 1", "Writer 2"])

        read.clearPerformanceCreditList()
        read.clearInvolvementCreditList()
        let outputUrl2 = try localDirectory(fileName: "testMp3-ClearList", fileExtension: "mp3")
        try read.write(outputLocation: outputUrl2)
        
        var newFile2 = try AudioFile(location: outputUrl2)
        XCTAssertTrue(newFile2.performanceCreditsList.isEmpty)
        XCTAssertTrue(newFile2.involvementCreditsList.isEmpty)
        XCTAssertNil(newFile2.performanceCreditsList[.soloist])
        XCTAssertNil(newFile2.performanceCreditsList[.narrator])
        XCTAssertNil(newFile2.performanceCreditsList[.performer])
        XCTAssertNil(newFile2.involvementCreditsList[.artDirection])
        XCTAssertNil(newFile2.involvementCreditsList[.director])
        XCTAssertNil(newFile2.involvementCreditsList[.executiveProducer])
        XCTAssertNil(newFile2.involvementCreditsList[.producer])
        XCTAssertNil(newFile2.involvementCreditsList[.soundEngineer])
        XCTAssertNil(newFile2.involvementCreditsList[.writer])
        
        newFile2.addPerformanceCredit(.artist, person: "Other New Artist")
        newFile2.addPerformanceCredit(.narrator, person: "Other New Narrator")
        newFile2.addPerformanceCredit(.soloist, person: "Other New Soloist")
        newFile2.addPerformanceCredit(.performer, person: "Other New Performer")
        newFile2.addPerformanceCredit(.accompaniment, person: "Other New Accompanist")
        newFile2.addInvolvementCredit(.arranger, person: "Other New Arranger")
        newFile2.addInvolvementCredit(.artDirection, person: "Other New Art Director")
        newFile2.addInvolvementCredit(.composer, person: "Other New Composer")
        newFile2.addInvolvementCredit(.conductor, person: "Other New Conductor")
        newFile2.addInvolvementCredit(.director, person: "Other New Director")
        newFile2.addInvolvementCredit(.executiveProducer, person: "Other New Exec")
        newFile2.addInvolvementCredit(.lyricist, person: "Other New Lyricist")
        newFile2.addInvolvementCredit(.producer, person: "Other New Producer")
        newFile2.addInvolvementCredit(.publisher, person: "Other New Publisher")
        newFile2.addInvolvementCredit(.soundEngineer, person: "Other New Engineer")
        newFile2.addInvolvementCredit(.writer, person: "Other New Writer")
        newFile2.addInvolvementCredit(.writer, person: "Writer's Assistant")
        
        let outputUrl3 = try localDirectory(fileName: "testMp3-AddCreditItems", fileExtension: "mp3")
        try newFile2.write(outputLocation: outputUrl3)
        
        var newFile3 = try AudioFile(location: outputUrl3)
        XCTAssertEqual(newFile3.artist, "Other New Artist")
        XCTAssertEqual(newFile3.narrator, "Other New Composer")
        XCTAssertEqual(newFile3.performanceCreditsList[.soloist], ["Other New Soloist"])
        XCTAssertEqual(newFile3.performanceCreditsList[.performer], ["Other New Performer"])
        XCTAssertEqual(newFile3.performanceCreditsList[.accompaniment], ["Other New Accompanist"])
        XCTAssertEqual(newFile3.arranger, "Other New Arranger")
        XCTAssertEqual(newFile3.involvementCreditsList[.artDirection], ["Other New Art Director"])
        XCTAssertEqual(newFile3.composer, "Other New Composer")
        XCTAssertEqual(newFile3.conductor, "Other New Conductor")
        XCTAssertEqual(newFile3.involvementCreditsList[.executiveProducer], ["Other New Exec"])
        XCTAssertEqual(newFile3.lyricist, "Other New Lyricist")
        XCTAssertEqual(newFile3.involvementCreditsList[.producer], ["Other New Producer"])
        XCTAssertEqual(newFile3.publisher, "Other New Publisher")
        XCTAssertEqual(newFile3.involvementCreditsList[.soundEngineer], ["Other New Engineer"])
        XCTAssertEqual(newFile3.involvementCreditsList[.writer], ["Other New Writer","Writer's Assistant"])
        
        newFile3.removeInvolvementCredit(.writer)
        newFile3.removePerformanceCredit(.soloist)
        newFile3.removePerformanceCredit(.accompaniment)
        
        let outputUrl4 = try localDirectory(fileName: "testMp3-RemoveSingleCreditItems", fileExtension: "mp3")
        try newFile3.write(outputLocation: outputUrl4)
        
        let newFile4 = try AudioFile(location: outputUrl4)
        XCTAssertNil(newFile4.involvementCreditsList[.writer])
        XCTAssertNil(newFile4.performanceCreditsList[.soloist])
        XCTAssertNil(newFile4.performanceCreditsList[.accompaniment])
    }
}
