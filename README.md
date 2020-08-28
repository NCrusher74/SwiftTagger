# SwiftTagger

SwiftTagger combines the `SwiftTaggerMP4` and `SwiftTaggerID3` libraries into a comprehensive audio file tagging and chaptering library, including bridging the gaps where a tag exists in `ID3` but not for `Mp4` and vice versa.

You can find `SwiftTaggerMP4` [here:](https://github.com/NCrusher74/SwiftTaggerMP4)
You can find `SwiftTaggerID3` [here:](https://github.com/NCrusher74/SwiftTaggerID3)

`SwiftTaggerMP4` is built upon `SwiftMp4MetadataParser`, which can be found [here:](https://github.com/NCrusher74/SwiftMp4MetadataParser)

## Usage

Add dependency to your `package.swift` manifest:

```swift
let package = Package(
    name: "MetadataEditor",
    dependencies: [
        .package(
            name: "SwiftTagger",
            url: "https://github.com/NCrusher74/SwiftTagger",
            from: "0.1.1"
        ),
    ],
    targets: [
        .target(
            name: "MetadataEditor",
                dependencies: [
                    .product(name: "SwiftTaggerID3", package: "SwiftTagger"),
                    .product(name: "SwiftTaggerMP4", package: "SwiftTagger"),
                ]
        )
    ]
)
```

*Reading metadata*:
```swift
let source = try AudioFile(location: file.url)

print(source.album)
print(source.artist)
print(source.trackNumber.track)
print(source.trackNumber.totalTracks)
print(source["FreeformTag"]) // prints freeform tag with the descriptor "FreeformTag"
print(source.involvementCreditsList[.accounting])
print(source.performanceCreditsList[.actor])
```

*Editing metadata*:
```swift
var source = try AudioFile(location: file.url)

source.album = "New Album Title"
source.artist = "New Artist"
source.trackNumber.track = 3
source.trackNumber.totalTracks = 17
source.compilation = true
source.titleKeywords = ["Title", "Keywords"]

// adding credits list tags - edits TIPL frame for ID3, or creates a freeform atom for the involvement for MP4
source.involvementCreditsList[.adaptation] = "Involved Person"

// edits TMCL frame for ID3, or adds performer name to performers tag for MP4
source.performanceCreditsList[.actress] = "Actress Name"

// adding freeform tags
source["MyFreeformTagDescription"] = "New Tag Content"
source[comment: "MyCommentDescription", .eng] = "New Comment in English"
source[lyrics: "My Lyrics Description", .eng] = "New Lyrics in English"
```

*Reading Chapter Data*:
```swift
let source = try AudioFile(location: file.url)

for chapter in source.chapterList {
    print(chapter)
}

// (startTime: 0, title: "Chapter 1")
// (startTime: 10000, title: "Chapter 1")
// (startTime: 25000, title: "Chapter 2")
// (startTime: 43000, title: "Chapter 3")
// (startTime: 64000, title: "Chapter 4")
// (startTime: 81000, title: "Chapter 5")
// startTime is in milliseconds
```

*Editing Chapter Data*:
```swift
var source = try AudioFile(location: file.url)

try source.removeAllChapters()

// or

source.removeChapter(at: 64000) // removes chapter at startTime 64000

source.addChapter(at: 95000, title: "Chapter 6")

// To edit the title of an existing chapter, add a chapter at the same startTime with a different title.
// To edit the startTime of an existing chapter, remove the old chapter and create a new one
```

*Writing the new file*:
```swift
var source = try AudioFile(location: file.url)

source.album = "New Album Title"
source.artist = "New Artist"
source.trackNumber.track = 3
source.trackNumber.totalTracks = 17
source.compilation = true
source.addChapter(at: 95000, title: "Chapter 6")

try source.write(outputLocation: output.url)
```

### Handled metadata items:
*If a frame is specified but not an atom (or vice versa) it is because the item exists for ID3 but not for MP4. Instead, a freeform atom or user-defined text frame will be created for it.*

**A-C**
*  `acknowledgment`: (MP4 atom: `\u{00A9}cak`)
*  `album`: (MP4 atom: `\u{00A9}alb` - ID3 frame: `TALB`)
*  `albumID`: (MP4 atom: `akID`)
* `albumArtist`: (MP4 atom: `aART` - ID3 frame: `TPE2`)
* `albumArtistSort`: (MP4 atom: `soaa` - ID3 frame: `TSO2`)
* `albumSort`: (MP4 atom: `soal` - ID3 frame: `TSOA`)
* `appleCountryStoreID`: (MP4 atom: `sfID`)
*  `arranger`: (MP4 atom: `\u{00A9}arg` - ID3 frame: `TPE4`)
*  `arrangerKeywords`: (MP4 atom: `\u{00A9}ark`)
*  `artDirector`: (MP4 atom: `\u{00A9}ard`)
*  `artist`: (MP4 atom: `\u{00A9}ART` - ID3 frame: `TPE1`)
* `artistID`: (MP4 atom: `atID`)
*  `artistKeywords`: (MP4 atom: `\u{00A9}prk`)
*  `artistSort`: (MP4 atom: `soar` - ID3 frame: `TSOP`)
*  `artistWebpage`: (MP4 atom: `\u{00A9}prl` - ID3 frame: `WOAR`)
* `audioFileWebpage`: (ID3 frame: `WOAF`)
* `audioSourceWebpage`: (ID3 frame: `WOAS`)
* `bpm`: (MP4 atom: `tmpo` - ID3 frame: `TBPM`)
* `comment`: (MP4 atom: `\u{00A9}cmt` - ID3 frame: `COMM`)
* `compilation`: (MP4 atom: `cpil` - ID3 frame: `TCMP`)
* `composer`: (MP4 atom: `\u{00A9}com` - ID3 frame: `TCOM`)
* `composerID`: (MP4 atom: `cmID`)
* `composerKeywords`: (MP4 atom: `\u{00A9}cok`)
* `composerSort`: (MP4 atom: `soco` - ID3 frame: `TSOC`)
* `conductor`: (MP4 atom: `\u{00A9}con` - ID3 frame: `TPE3`)
* `conductorID`: (MP4 atom: `cnID`)
* `contentAdvisory`: (MP4 atom: `iTunEXTC`)
* `contentRating`: (MP4 atom: `rtng`)
* `copyright`: (MP4 atom: `cprt` - ID3 frame: `TCOP`)
* `copyrightWebpage`: (ID3 frame: `WCOP`)
* `coverArt`: (MP4 atom: `covr` - ID3 frame: `APIC`)
**D-F**
* `description`: (MP4 atom: `\u{00A9}des`)
* `director`: (MP4 atom: `\u{00A9}dir`)
* `discNumber`: (MP4 atom: `disk` - ID3 frame: `TPOS`)
* `encodedBy`: (MP4 atom: `\u{00A9}enc` - ID3 frame: `TENC`)
* `encodingSettings`: (ID3 frame: `TSSE`)
* `encodingTime`: (ID3 frame: `TDEN`)
* `encodingTool`: (MP4 atom: `\u{00A9}too`)
* `executiveProducer`: (MP4 atom: `\u{00A9}xpd`)
* `filmMakerWebpage`: (MP4 atom: `\u{00A9}mal`)
**G-L**
* `gaplessPlayback`: (MP4 atom: `pgap`)
* `genre`: (MP4 atom: `\u{00A9}gen` - ID3 frame: `TCON`)
* `genreID`: (MP4 atom: `geID`)
* `grouping`: (MP4 atom: `\u{00A9}grp` - ID3 frame: `GRP1`)
* `information`: (MP4 atom: `\u{00A9}inf`)
* `initialKey`: (ID3 frame: `TKEY`)
* `involvedPeopleList (aka involvementCreditsList)`: (ID3 frame: `TIPL`) (values for many of the MP4 tags such as director, producer, etc, will create an entry to this list)
* `isrc`: (MP4 atom: `\u{00A9}isr` - ID3 frame: `TSRC`)
* `label`: (MP4 atom: `\u{00A9}lab`)
* `languages`: (MP4 atom: `enlg` - ID3 frame: `TLAN`)
* `length`: (ID3 frame: `TLEN`)
* `linerNotes`: (MP4 atom: `\u{00A9}lnt`)
* `longDescription`: (MP4 atom: `ldes`)
* `lyricist`: (MP4 atom: `\u{00A9}aut` - ID3 frame: `TEXT`)
* `lyrics`: (MP4 atom: `\u{00A9}lyr` - ID3 frame: `USLT`)
**M-N**
* `mediaType`: (MP4 atom: `stik`)
* `mood`: (ID3 frame: `TMOO`)
* `movementName`: (MP4 atom: `\u{00A9}mvn` - ID3 frame: `MVNM`)
* `movementCount`: (MP4 atom: `\u{00A9}mvc` - ID3 frame: `MVCN`)
* `movementNumber`: (MP4 atom: `\u{00A9}mvi` - ID3 frame: `MVIN`)
* `musicianCreditsList (aka performanceCreditsList)`: (ID3 frame: `TMCL`)
* `narrator`: (MP4 atom: `\u{00A9}nrt`)
* `originalAlbum`: (ID3 frame: `TOAL`)
* `originalArtist`: (MP4 atom: `\u{00A9}ope` - ID3 frame: ``)
* `originalFilename`: (ID3 frame: `TOFN`)
* `originalLyricist`: (ID3 frame: `TOLY`)
* `originalReleaseTime`: (ID3 frame: `TDOR`)
* `owner`: (MP4 atom: `ownr` - ID3 frame: `TOWN`)
**P**
* `paymentWebpage`: (ID3 frame: `WPAY`)
* `performers`: (MP4 atom: `\u{00A9}prf`) (values entered here will write the `performanceCreditsList` for ID3)
* `playlistDelay`: (ID3 frame: `TDLY`)
* `playlistID`: (MP4 atom: `plID`)
* `podcast`: (MP4 atom: `pcst`) (this frame exists in ID3, but setting it will cause iTunes not to recognize the audio or metadata)
* `podcastCategory`: (MP4 atom: `catg` - ID3 frame: `TCAT`)
* `podcastDescription`: (ID3 frame: `TDES`)
* `podcastFeed`: (MP4 atom: `purl` - ID3 frame: `WFED`)
* `podcastID`: (MP4 atom: `egid` - ID3 frame: `TGID`)
* `podcastKeywords`: (MP4 atom: `keyw` - ID3 frame: `TKWD`)
* `predefinedGenre`: (MP4 atom: `genr` - ID3 frame: `TCON`)
* `producedNotice`: (ID3 frame: `TPRO`)
* `producer`: (MP4 atom: `\u{00A9}prd`)
* `producerKeywords`: (MP4 atom: `\u{00A9}pdk`)
* `publisher`: (MP4 atom: `\u{00A9}pub` - ID3 frame: `TPUB`)
* `publisherWebpage`: (MP4 atom: `\u{00A9}lal` - ID3 frame: `WPUB`)
* `purchaseDate`: (MP4 atom: `purd`)
**R-S**
* `radioStation`: (ID3 frame: `TRSN`)
* `radioStationOwner`: (ID3 frame: `TRSO`)
* `radioStationWebpage`: (ID3 frame: `WORS`)
* `recordCompany`: (MP4 atom: `\u{00A9}mak`)
* `recordingDate`: (MP4 atom: `\u{00A9}day` - ID3 frame: `TDRC`)
* `recordingCopyright aka Phonogram Rights`: (MP4 atom: `\u{00A9}phg`) 
* `releaseDate`: (MP4 atom: `rldt` - ID3 frame: `TDRL`)
* `requirements`: (MP4 atom: `\u{00A9}req`)
* `sellerID`: (MP4 atom: `xid `)
* `showWork`: (MP4 atom: `shwm`)
* `soundEngineer`: (MP4 atom: `\u{00A9}sne`)
* `softwareVersion`: (MP4 atom: `\u{00A9}swr`)
* `soloist`: (MP4 atom: `\u{00A9}sol`)
* `songDescription`: (MP4 atom: `desc`)
* `songwriter`: (MP4 atom: `\u{00A9}swf`)
* `songwriterKeywords`: (MP4 atom: `\u{00A9}swk`)
* `sourceCredit`: (MP4 atom: `\u{00A9}src`)
* `subtitle`: (MP4 atom: `\u{00A9}snm` - ID3 frame: `TIT3`)
* `subtitleKeywords`: (MP4 atom: `\u{00A9}snk`)
**T-Z**
* `taggingTime`: (ID3 frame: `TDTG`)
* `title`: (MP4 atom: `\u{00A9}nam` - ID3 frame: `TIT2`)
* `titleKeywords`: (MP4 atom: `\u{00A9}nak`)
* `titleSort`: (MP4 atom: `sonm` - ID3 frame: `TSOT`)
* `thanks`: (MP4 atom: `\u{00A9}thx`)
* `trackNumber`: (MP4 atom: `trkn` - ID3 frame: ``)
* `trackSubtitle (aka setSubtitle)`: (MP4 atom: `\u{00A9}st3` - ID3 frame: `TSST`)
* `tvEpisodeNumber`: (MP4 atom: `tves`)
* `tvEpisodeTitle`: (MP4 atom: `tven`)
* `tvNetwork`: (MP4 atom: `tvnn`)
* `tvSeason`: (MP4 atom: `tvsn`)
* `tvShow`: (MP4 atom: `tvsh`)
* `tvShowDescription`: (MP4 atom: `sdes`)
* `tvShowSort`: (MP4 atom: `sosn`)
* `website`: (MP4 atom: `\u{00A9}url`)
* `work`: (MP4 atom: `\u{00A9}wrk` - ID3 frame: `TIT1`)
* `writer`: (MP4 atom: `\u{00A9}wrt`)
* `year`: (MP4 atom: `yrrc`) (for ID3, this frame doesn't exist in version 2.4)

### Limitations, spec-noncompliance, and known issues:
`SwiftTagger` tries to stick pretty close to the requirements of the ID3 and MP4 documented specs, but there are a few places where it deviates, either because the spec is silly, or compliance would be more cumbersome to achieve can be justified by the author's needs, or compliance would make the usage of `SwiftTagger` too convoluted. These deviations are:

* `SwiftTagger` uses ID3 version 2.4 by default. If you require an earlier version, it is recommended that you use `SwiftTaggerID3`, which allows you to specify which version you wish to use.
* The ID3 frames  `TMED` ("MediaType"), and `TFLT` ("File Type") are not implemented in `SwiftTagger`, as there is no equivalent for these tags in MP4 and these frames are very clumsy and difficult to implement. If you require these frames, they are available in `SwiftTaggerID3`.
* The ID3 specs allow for multiple `CTOC` (Table Of Contents) frames, and for the `CTOC` frames to have embedded subframes. To keep chapter implementation simple, however, `SwiftTagger` only supports a single `CTOC` frame, with no embedded subframes.
* Both ID3 and MP4 allow for the possibility of chapter-specific metadata beyond simply the title (such as chapter images) but this has not been implemented.
* There are a few frames and atoms where the accessor will return a "false positive" if the frame or atom doesn't exist in the file. Typically, this happens in cases where the return is a tuple. For example, on a file where there is no `discNumber` atom or frame
       `file.discNumber.disc = nil`
       `file.discNumber.totalDiscs = nil`
       `file.discNumber = (nil, nil) // not a nil return even though the frame or atom is non-existant`
       This is done to guarantee that we will be able to create these atoms and frames when they don't exist, instead of having the accessor fail when a chained optional such as `file.discNumber?.disc` encounters a nil return.
       When working with date frames in ID3, this "false positive" may take the form of a date return of `0001-01-01 00:00:00` (`Date.distantPast`) when the frame doesn't exist.

### A note about compatibility
Each tagging library or app handles things slightly differently. Some will parse values of a tag called "recording date" to a field called "release date". Each one has its own unique descriptor that it may recognize for a freeform `----` atom or `TXXX` frame fulfilling a certain purpose, while another app uses a different descriptor altogether.

For example:
* While the `initialKey` tag exists for ID3, it doesn't for MP4. Both Yate and Kid3 will create a freeform atom that it will recognize for this tag, but one may use the descriptor "KEY" while the other uses "INITIAL_KEY" or "INITIAL KEY".
* Yate doesn't recognize values written to the MP4 atoms for writer or lyricist and will create freeform atoms for those instead. 
* Kid3 doesn't recognize metadata written to the MP4 `\u{00A9}isr` atom as being an ISRC value and will list it separately from the ISRC item. 
* Many audiobook handling apps read and write values for `narrator` to the `composer` tag, even though there is a specific `\u{00A9}nrt` tag that Audible uses.

The point being: compatiblity with all other tagging apps and libraries is impossible.

`SwiftTagger` takes a literalist approach to tags whenever there is ambiguity. If a tag is called `releaseDate` it's going to write to the frame or atom for `releaseDate` not the tag/atom for `recordingDate`. If desired, which frame or atom `SwiftTagger` writes to can be adjusted in the `Metadata.swift` file, or in a few cases, `Metadata_Other.swift`.

If you wanted `recordingDate` to write to the `releaseDate` atom, or vice versa, you would change this in `Metadata.swift`:
```
case .recordingDate:
return mp4Tag.recordingDate
case .releaseDate:
return mp4Tag.releaseDate
```

to this:
```
case .recordingDate:
return mp4Tag.releaseDate
case .releaseDate:
return mp4Tag.recordingDate
```

If you wanted the freeform atom for `initialKey` to have a different descriptor, you would edit the string value for `mp4Tag["Initial key"]` in `public var keySignature: KeySignature?` in `Metadata_Other.swift`.

("Initial key" was chosen for this particular value because that is the string used in MediaInfo for the ID3 tag, so using it as the freeform descriptor for MP4 means the result looks identical to ID3 in MediaInfo. When in doubt, the author tends to default to compatibility with MediaInfo, as it's a widely used and recognized resource.)
