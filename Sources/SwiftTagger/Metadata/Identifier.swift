//
//  Identifier.swift
//  
//
//  Created by Nolaine Crusher on 9/28/20.
//

import Foundation

enum Identifier: String, CaseIterable {
    /// Acknowledgments. MP4 atom `©cak`.
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Acknowledgments`
    case acknowledgment

    /// Album title. ID3 frame `TALB`, MP4 atom `©alb`.
    ///
    /// Intended for the title of the recording (or source of sound) from which the audio in the file is taken.
    case album

    /// Album artist or band. ID3 frame `TPE2`, MP4 atom `aART`
    ///
    /// The ID3 spec describes this frame as: `Band/Orchestra/Accompaniment` frame used for additional information about the performers in the recording. But usually it just serves as the AlbumArtist frame
    case albumArtist

    /// Album artist sort order. ID3 frame `TSO2`, MP4 atom `soaa`
    ///
    /// Defines a string which should be used instead of the performer for sorting purposes.
    case albumArtistSort

    /// Album sort order. ID3 frame `TSOA`, MP4 atom `soal`
    ///
    /// Defines a string which should be used instead of the album name for sorting purposes. E.g. an album named "A Soundtrack" might preferably be sorted as "Soundtrack".
    case albumSort

    /// The country code of the iTunes store. MP4 atom `sfID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `iTunesStoreCountry`
    case appleStoreCountryID

    /// Interpreted, remixed, or otherwise modified by. ID3 frame `TSE4`, MP4 atom `©arg`
    ///
    /// Contains more information about the people behind a remix and similar interpretations of another existing piece.
    case arranger

    /// Keywords for arranger. MP4 atom `©ark`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ArrangerKeywords`
    case arrangerKeywords

    /// The art director of the movie. MP4 atom `©ard`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `artDirection`
    case artDirector

    /// Lead artist/Lead performer/Soloist/Performing group. ID3 frame `TPE1` MP4 atom `©ART`
    ///
    /// The main artist. Also commonly used in audiobook metadata for the name of a book's author.
    case artist

    /// The iTunes-store artist identifier. MP4 atom `atID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ArtistID`
    case artistID

    /// Keywords of main artist/performer. MP4 atom `©prk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Artist Keywords`
    case artistKeywords

    /// Used for sorting by performer in iTunes. ID3 frame `TSOP` MP4 atom `soar`
    case artistSort

    /// Official artist/performer webpage. ID3 frame `WOAR` MP4 atom `©prl`
    ///
    /// A URL pointing at the artists official webpage. There may be more than one "WOAR" frame in a tag if the audio contains more than one performer, but not with the same content.
    case artistWebpage

    /// Official audio file webpage. ID3 frame `WOAF`
    ///
    /// URL pointing at a file specific webpage.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `AudioFileWebpage`
    case audioFileWebpage

    /// Official audio source webpage. ID3 frame `WOAS`
    ///
    /// URL pointing at the official webpage for the source of the audio file, e.g. a movie.
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `AudioSourceWebpage`
    case audioSourceWebpage

    /// BPM. ID3 frame `TBPM`, MP4 atom `tmpo`
    ///
    /// Contains the number of beats per minute in the main part of the audio. The BPM is an integer and represented as a numerical string.
    case bpm

    /// Comments ID3 frame `COMM` MP4 atom `©cmt`
    ///
    /// This frame is intended for any kind of full text information that does not fit in any other frame. ALLOWS `(/n)` new line characters.
    ///
    /// For audiobooks, this frame is frequently used to contain the book-jacket description, or "blurb"
    case comments

    /// Compilation. ID3 tag `TCMP`, MP4 atom `cpil`
    ///
    /// This is a simple text frame that iTunes uses to indicate if the file is part of a compilation. Contains a text string (1 or 0) representing a boolean value
    case compilation

    /// Composer ID3 frame `TCOM` MP4 atom `©com`
    ///
    /// The name of the composer. Also used commonly in audiobooks for the name of the narrator.
    case composer

    /// The iTunes-store composer identifier. MP4 atom `cmID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ComposerID`
    case composerID

    /// Keywords for composer. MP4 atom `©cok`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Composer Keywords`
    case composerKeywords

    /// ComposerSort. ID3 frame `TSOC` MP4 atom `soco`
    ///
    /// Frame used for sorting by composer in iTunes
    case composerSort

    /// Conductor name. ID3 frame `TPE3`, MP4 atom `©con`
    case conductor

    /// The iTunes-store conductor identifier. MP4 atom `cnID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `ConductorID`
    case conductorID

    /// Copyright declaration ID3 frame `TCOP` MP4 atom `cprt`
    ///
    /// The string must begin with a year and a space character (making five characters), is intended for the copyright holder of the original sound, not the audio file itself.
    case copyright

    /// Copyright/Legal information. ID3 frame `WCOP`
    ///
    /// URL pointing at a webpage where the terms of use and ownership of the file is described.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Copyright Webpage`
    case copyrightWebpage

    /// Embedded cover art ID3 frame `APIC`, MP4 atom `covr`
    case coverArt

    /// Description (short) MP4 atom `©des`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Description`
    case description

    /// Name of movie’s director. MP4 atom `©dir`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to to the `involvedPeopleList` frame with the role `director`
    case director

    /// Disc index/position in set, ID3 frame `TPOS` MP4 atom `disk`
    ///
    /// A numeric string that describes which part of a set the audio came from.
    case discNumber

    /// Encoding date/time. ID3 frame `TDEN`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Encoding Date/Time`
    case encodingDateTime

    /// Encoded by. ID3 frame `TENC` MP4 atom `©enc`
    ///
    /// Contains the name of the person or organisation that encoded the audio file. This field may contain a copyright message, if the audio file also is copyrighted by the encoder.
    case encodedBy

    /// Software/Hardware and settings and tools used for encoding frame.
    /// ID3 frame `TSSE` MP4 atom `©too`
    ///
    /// Includes the audio encoder used and its settings when the file was encoded. Hardware refers to hardware encoders, not the computer on which a program was run.
    case encoderAndSettings

    /// Executive producer of the movie . MP4 frame `©xpd`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `executiveProducer`
    case executiveProducer

    /// Boolean value indicating there should be no delay between tracks MP4 atom `pgap`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, a true value for this item will result in the `playlistDelay` frame being set to 0. Otherwise, this value will be ignored when tagging ID3 files.
    case gaplessPlayback

    /// User-defined genre  ID3 frame `TCON`, MP4 atom `©gen`
    ///
    /// In ID3v1 was stored as a one byte numeric value only, is now a string. You may use one or several of the ID3v1 types as numerical strings, or, since the category list would be impossible to maintain with accurate and up to date categories, define your own. Example: "21" $00 "Eurodisco" $00
    ///
    /// You may also use any of the following keywords:
    ///
    /// RX  Remix
    ///
    /// CR  Cover
    case genreCustom

    /// Predefined genre ID3 frame `TCON`, MP4 atom `genr`
    ///
    /// In ID3v1 was stored as a one byte numeric value only, is now a string. You may use one or several of the ID3v1 types as numerical strings, or, since the category list would be impossible to maintain with accurate and up to date categories, define your own. Example: "21" $00 "Eurodisco" $00
    ///
    /// You may also use any of the following keywords:
    ///
    /// RX  Remix
    ///
    /// CR  Cover
    case genrePredefined

    /// The iTunes-store genre identifier. MP4 atom `geID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `GenreID`
    case genreID

    /// Grouping ID3 frame `GRP1` MP4 atom `©grp`
    ///
    /// Frame used by iTunes to group works.
    case grouping

    /// Information about the movie MP4 atom `©inf`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Information`
    case information

    /// Initial key. ID3 frame `TKEY`
    ///
    /// Contains the musical key in which the sound starts. It is represented as a string with a maximum length of three characters. The ground keys are represented with "A","B","C","D","E", "F" and "G" and halfkeys represented with "b" and "#". Minor is represented as "m", e.g. "Dbm" $00. Off key is represented with an "o" only.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Initial Key`
    case initialKey

    /// InvolvedPeopleList frame. ID3 frame `TIPL`
    ///
    /// `InvolvedPeopleList` handles production and support credits, while `MusicianCreditsList` handles performer credits.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to the appropriate atom for the role, if it exists. Otherwise, a userDefined atom will be created with a description corresponding to the role
    case involvedPeopleList

    /// ISRC ID frame `TSRC` MP4 atom `©isr`
    ///
    /// Should contain the International Standard Recording Code [ISRC] (12 characters).
    case isrc

    /// The iTunes-store account MP4 atom `apID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `iTunes Account`
    case iTunesAccount

    /// The iTunes-store account type identifier MP4 atom `akID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `iTunes Account Type`
    case iTunesAccountType

    /// Name of record label MP4 atom `©lab`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Label`
    case label

    /// URL of record label MP4 atom `©lal`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Label Webpage`
    case labelWebpage

    /// Language ID3 frame `TLAN`, MP4 atom `elng`
    ///
    /// Should contain the languages of the text or lyrics spoken or sung in the audio. The language is represented with three characters according to ISO-639-2 [ISO-639-2]. If more than one language is used in the text their language codes should follow according to the amount of their usage, e.g. "eng" $00 "sve" $00.
    case languages

    /// Length frame ID3 frame `TLEN` MP4 atom `mvhd`
    ///
    /// Contains the length of the audio file in milliseconds. Because SwiftTagger does not support editing media files, this property is read-only
    case length

    /// Liner notes. MP4 atom `©lnt`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Liner Notes`
    case linerNotes

    /// Long desccription MP4 atom `ldes`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Long Description`
    case longDescription

    /// Lyrics (unsynchronized) ID3 frame `USLT` MP4 atom `©lyr`
    ///
    /// This frame contains the lyrics of the song or a text transcription of other vocal activities.
    ///
    /// For audiobooks, this is commonly used to contain a long book-jacket description or "blurb"
    case lyrics

    /// Lyricist/Text writer. ID3 frame `TEXT` MP4 atom `©aut`
    ///
    /// Intended for the writer of the text or lyrics in the recording.
    case lyricist

    /// The media kind value for the media. MP4 atom `stik`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Media Kind`
    case mediaKind

    /// Mood. ID3 frame `TMOO`
    ///
    /// Intended to reflect the mood of the audio with a few keywords, e.g. "Romantic" or "Sad".
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Mood`
    case mood

    /// Movement Count. ID3 frame `MVCN` MP4 atom `©mvc`
    ///
    /// Used by iTunes to denote the number of movements in a work
    case movementCount

    /// Movement Name. ID3 frame `MVNM` MP4 atom `©mvn`
    ///
    /// Used by iTunes to name the movements of a multi-part work
    case movement

    /// Movement Number. ID3 frame `MVIN` MP4 atom `©mvi`
    ///
    /// Used by iTunes to denote the total number of movements in a work
    case movementNumber

    /// Musician credits list. ID3 frame `TMCL`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to the appropriate atom for the role, if one exists. Otherwise, a userDefined atom will be created with a description that corresponds to the role
    case musicianCreditsList

    /// Narrator (as listed by Audible in audiobooks) MP4 atom `©nrt`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Narrator`
    case narrator

    /// Original album/movie/show title. ID3 frame `TOAL`
    ///
    /// Intended for the title of the original recording (or source of sound), if for example the music in the file should be a cover of a previously released song.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Album`
    case originalAlbum

    /// Original artist/performer. ID3 frame `TOPE` MP4 atom `©ope`
    ///
    /// Intended for the performer of the original recording, if for example the music in the file should be a cover of a previously released song.
    case originalArtist

    /// Original filename. ID3 frame `TOFN`
    ///
    /// Contains the preferred filename for the file, since some media doesn't allow the desired length of the filename. The filename is case sensitive and includes its suffix.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Filename`
    case originalFilename

    /// Original lyricist/text writer. ID3 frame `TOLY`
    ///
    /// Intended for the text writer of the original recording, if for example the music in the file should be a cover of a previously released song.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Lyricist`
    case originalLyricist

    /// Original release time. ID3 frame `TDOR`
    ///
    /// Contains a timestamp describing when the original recording of the audio was released.
    ///
    /// There is no correspondin MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Original Release Date/Time`
    case originalReleaseDateTime

    /// File owner/licensee. ID3 frame `TOWN` MP4 atom `ownr`
    ///
    /// Contains the name of the owner or licensee of the file and it's contents.
    case owner

    /// Payment Webpage. ID3 frame `WPAY`
    ///
    /// URL pointing at a webpage that will handle the process of paying for this file.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Payment Webpage`
    case paymentWebpage

    /// Names of performers MP4 atom `©prf`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `musicianCreditsList` frame with the role `performer`
    case performers

    /// Playlist delay. ID3 frame `TDLY`
    ///
    /// Defines the numbers of milliseconds of silence that should be inserted before this audio. The value zero indicates that this is a part of a multifile audio track that should be played continuously.
    ///
    /// There is no corresponding MP4 atom. Instead, a 0 value entered here will result in the `gaplessPlayback` atom being set to `true`. Any other value in this atom will result in `gaplessPlayback` being set to `false`
    case playlistDelay

    /// The iTunes playlist identifier MP4 atom `plID`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `PlaylistID`
    case playlistID

    /// Boolean value indicating whether or not the track is a podcast MP4 atom `pcst`
    ///
    /// While there *is* a corresponding frame for ID3 with the identifier (`PCST`), attempts to implement this frame in SwiftTaggerID3 resulted in files that iTunes/Apple Music wouldn't recognize, so this value will not set a frame for ID3
    case podcast

    /// Podcast Category. ID3 frame `TCAT` MP4 atom `catg`
    ///
    /// Used by iTunes to categorize podcasts
    case podcastCategory

    /// Podcast Description. ID3 frame `TDES`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to the `songDescription` atom, since it is unlikely both will be in use
    case podcastDescription

    /// PodcastID. ID3 frame `TGID` MP4 atom `egid`
    ///
    /// Used by iTunes to list a podcast's ID
    case podcastID

    /// Podcast keywords. ID3 frame `TKWD` MP3 atom `keyw`
    ///
    /// Used by iTunes to for keywords describing a podcast
    case podcastKeywords

    /// Podcast feed. ID3 frame `WFED` MP4 atom `purl`
    ///
    /// Used by iTunes to list the web feed of a podcast (despite the identifier beginning with W in ID3, this is a string frame
    case podcastFeed

    /// Name of producer. MP4 atom `©prd`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `producer`
    case producer

    /// Keywords for producer. MP4 atom `©prk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Producer Keywords`
    case producerKeywords

    /// Produced notice. ID3 frame `TPRO`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Produced Notice`
    case producedNotice

    /// Publisher. ID3 frame `TPUB` MP4 atom `©pub`
    ///
    /// Simply contains the name of the label or publisher.
    case publisher

    /// Publishers official webpage. ID3 frame `WPUB`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Publisher Webpage`
    case publisherWebpage

    /// Purchase Date/Time. MP4 atom `purd`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Purchase Date/Time`
    case purchaseDateTime

    /// Internet radio station name. ID3 frame `TRSN`
    ///
    /// Contains the name of the internet radio station from which the audio is streamed.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Sadio Station`
    case radioStation

    /// Internet radio station owner. ID3 frame `TRSO`
    ///
    /// Contains the name of the owner of the internet radio station from which the audio is streamed.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Radio Station Owner`
    case radioStationOwner

    /// Official Internet radio station homepage. ID3 frame `WORS`
    ///
    /// A URL pointing at the homepage of the internet radio station.
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Radio Station Webpage`
    case radioStationWebpage

    /// Rating indicator for `clean`, `explicit`, or `none` MP4 atom `rtng`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Rating`
    case rating

    /// Name of file creator or maker MP4 atom `©mak`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Record Company`
    case recordCompany

    /// URL of file creator or maker MP4 atom `©mal`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Record Company Webpage`
    case recordCompanyUrl

    /// Recording copyright statement, aka phonogram rights. Normally preceded by the symbol (P) ( P in a circle) MP4 atom `©phg`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Recording Copyright`
    case recordingCopyright

    /// Recording date/time. ID3 frame `TDRC` MP4 atom `©day`
    ///
    /// (versions 2.2 and 2.3 only) Intended to be used as complement to the "TYE", "TDA" and "TIM" frames. E.g. "4th-7th June, 12th June" in combination with the "TYE" frame.
    case recordingDateTime

    /// Release time/time. ID3 tag `TDRL` MP4 atom `rldt`
    ///
    /// Contains a timestamp describing when the audio was first released. NEW IN VERSION 2.4
    case releaseDateTime

    /// Special hardware and software requirements `©req`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Requirements`
    case requirements

    /// iTunes seller. ID MP4 atom "xid "
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SellerID`
    case sellerID

    /// Set/track subtitle. ID3 frame `TSST` MP4 atom `©st3`
    ///
    /// Intended for the subtitle of the part of a set this track belongs to (ID3), or the subtitle of a track (MP4).
    case setOrTrackSubtitle

    /// Boolean value indicating whether Work and Movement data should be displayed. MP4 atom`shwm`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Show work and movement`
    case showWorkAndMovement

    /// Sound engineer of track. MP4 atom `©sne`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `soundEngineer`
    case soundEngineer

    /// Name and version number of the software (or hardware) that generated this movie. MP4 atom `©swr`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Software Version`
    case softwareVersion

    /// Featured soloist. MP4 atom `©sol`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `musicianCreditsList` frame with the role `soloist`
    case soloist

    /// Song description. MP4 atom `desc`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `Song Description`
    case songDescription

    /// Name of songwriter. MP4 atom `©swf`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeopleList` frame with the role `songwriter`
    case songwriter

    /// Keywords for songwriter. MP4 atom `©swk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Songwriter Keywords`
    case songwriterKeywords

    /// Credits for those who provided movie source content. MP4 atom `©src`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SourceCredit`
    case sourceCredit

    /// Subtitle of content. ID3 frame `TIT3` MP4 atom `©snm`
    ///
    /// Used for information directly related to the contents title (e.g. "Op. 16" or "Performed live at Wembley").
    case subtitle

    /// Subtitle keywords of the content. MP4 atom `©snk`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Subtitle Keywords`
    case subtitleKeywords

    /// Tagging date/time. ID3 frame `TDTG`
    ///
    /// There is no corresponding MP4 atom. For MP4 files, this metadata will be written to a userDefined atom with the description `Tagging Date`
    case taggingDateTime

    /// Title/Song name. ID3 frame `TIT2` MP4 atom `©nam`
    ///
    /// The actual name of the piece (e.g. "Adagio", "Hurricane Donna").
    ///
    /// For audiobooks that are stored in multiple files, this is usually the title of the part contained in the file, rather than the book title.
    case title

    /// Title keywords of the content. MP4 atom `©nak`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Title Keywords`
    case titleKeywords

    /// Title sort order. ID3 frame `TSOT` MP4 atom`sonm`
    ///
    /// Defines a string which should be used instead of the title (TIT2) for sorting purposes.
    case titleSort

    /// Thanks MP4 atom `©thx`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `Thanks`
    case thanks

    /// Track number/Position in set. ID3 frame `TRCK` MP4 atom `trkn`
    ///
    /// A numeric string containing the order number of the audio-file on its original recording. This MAY be extended with a "/" character and a numeric string containing the total number of tracks/elements on the original recording. E.g. "4/9".
    case trackNumber

    /// MP4 atom `tves` (TV Episode Number)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesEpisodeNumber`
    case seriesEpisodeNumber

    /// MP4 atom `tven` (TV Episode Title)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesEpisodeTitle`
    case seriesEpisodeTitle

    /// MP4 atom `tvnn` (TV Network)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesDistributor`
    case seriesDistributor

    /// MP4 atom `tvsn` (TV Season)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `seriesSeason`
    case seriesSeason

    /// MP4 atom `tvsh` (TV Show)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SeriesTitle`
    case series

    /// MP4 atom `sdes` (TV show description)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a comment frame with the description `SeriesDescription`
    case seriesDescription

    /// MP4 atom `sosn` (sort by TV Show)
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to a userDefinedText frame with the description `SeriesSort`
    case seriesSort

    /// User Defined. ID3 frame `TXXX` MP4 atom `----`
    ///
    /// A freeform text frame/atom intended to hold user-defined items. Data is stored as a string, though it may be used for numeric strings (including boolean 1/0 strings), arrays, and so forth.
    case userDefined

    /// User Defined Webpage. ID3 frame `WXXX`, MP4 atom `©url`
    ///
    /// A frame/atom intended to hold a user-defined webpage address.
    case userDefinedWebpage

    /// Work name/Content group description. ID3 frame `TT1/TIT1`, MP4 atom `©wrk`
    ///
    /// Used if the sound belongs to a larger category of sounds/music. For example, classical music is often sorted in different musical sections (e.g. "Piano Concerto", "Weather - Hurricane").
    ///
    /// For audiobooks, this may be used to contain series data
    case work

    /// Name of movie’s writer. MP4 atom `©wrt`
    ///
    /// There is no corresponding ID3 frame. For MP3 files, this metadata will be written to the `involvedPeoplesList` frame with the role `writer`
    case writer

    /// Year. MP4 atom `yrrc`
    ///
    /// This is a read-only item that corresponds to the `year` value of the recording date/time.
    case year
}
