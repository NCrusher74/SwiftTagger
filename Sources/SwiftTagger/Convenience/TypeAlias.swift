//
//  TypeAlias.swift
//  SwiftTagger
//
//  Created by Nolaine Crusher on 9/30/20.
//

import Foundation
import SwiftTaggerID3
import SwiftTaggerMP4
import iTunesGenreID
import SwiftLanguageAndLocaleCodes

typealias Id3Tag = SwiftTaggerID3.Tag
typealias Mp4Tag = SwiftTaggerMP4.Tag

typealias Atom = SwiftTaggerMP4.Atom

public typealias MusicianCredits = MusicianAndPerformerCredits
public typealias InvolvementCredits = InvolvedPersonCredits
public typealias GenreID3 = GenreType
public typealias KeySignature = SwiftTaggerID3.KeySignature

public typealias GenreMP4 = Genre
public typealias ContentRating = SwiftTaggerMP4.ContentRating
public typealias Stik = SwiftTaggerMP4.Stik
public typealias Rating = SwiftTaggerMP4.Rating

public typealias ISO6392Code = SwiftLanguageAndLocaleCodes.ISO6392Code
public typealias ICULocaleCode = SwiftLanguageAndLocaleCodes.ICULocaleCode
