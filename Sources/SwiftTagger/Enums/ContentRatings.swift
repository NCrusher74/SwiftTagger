/*

 ContentRatings.swift
 SwiftTaggerID3

 Copyright ©2020 Nolaine Crusher. All rights reserved.

 */

import Foundation
import SwiftTaggerMP4
import SwiftTaggerID3

public enum ContentRating: String {
    
    init?(id3Value: SwiftTaggerID3.ContentRating) {
        if let rating = ContentRating(rawValue: id3Value.rawValue) {
            self = rating
        } else {
            return nil
        }
    }
    
    init?(mp4Value: SwiftTaggerMP4.ContentRating) {
        if mp4Value == .clean {
            self = .clean
        } else if mp4Value == .explicit {
            self = .explicit
        } else if mp4Value == .none {
            self = .none
        } else {
            return nil
        }
    }
    
    case none = ""
    case clean = "Clean"
    case explicit = "Explicit"
}

public enum ContentAdvisory: String {
    
    init?(id3Value: SwiftTaggerID3.ContentAdvisory) {
        if let rating = SwiftTagger.ContentAdvisory(rawValue: id3Value.rawValue) {
            self = rating
        } else {
            return nil
        }
    }
    
    init?(mp4Value: SwiftTaggerMP4.ContentAdvisory) {
        if let rating = SwiftTagger.ContentAdvisory(rawValue: mp4Value.rawValue) {
            self = rating
        } else {
            return nil
        }
    }

    case none = ""
    case us_Movie_NR = "mpaa|NR|000|"
    case us_Movie_G = "mpaa|G|100|"
    case us_Movie_PG = "mpaa|PG|200|"
    case us_Movie_PG13 = "mpaa|PG-13|300|"
    case us_Movie_R = "mpaa|R|400|"
    case us_Movie_NC = "mpaa|NC-17|500|"
    case us_Movie_Unrated = "mpaa|Unrated|???|"
    case us_tv_Y = "us-tv|TV-Y|100|"
    case us_tv_Y7 = "us-tv|TV-Y7|200|"
    case us_tv_G = "us-tv|TV-G|300|"
    case us_tv_PG = "us-tv|TV-PG|400|"
    case us_tv_14 = "us-tv|TV-14|500|"
    case us_tv_M = "us-tv|M|600|"
    case us_tv_Unrated = "us-tv|Unrated|???|"
    case au_Movie_G = "au-movie|G|100|"
    case au_Movie_PG = "au-movie|PG|200|"
    case au_Movie_M = "au-movie|M|350|"
    case au_Movie_MA15 = "au-movie|MA15+|375|"
    case au_Movie_R18 = "au-movie|R18+|400|"
    case au_Movie_Unrated = "au-movie|Not Rated|???|"
    case au_tv_P = "au-tv|P|100|"
    case au_tv_C = "au-tv|C|200|"
    case au_tv_G = "au-tv|G|300|"
    case au_tv_PG = "au-tv|PG|400|"
    case au_tv_M = "au-tv|M|500|"
    case au_tv_MA15 = "au-tv|MA15+|550|"
    case au_tv_AV15 = "au-tv|AV15+|575|"
    case au_tv_R18 = "au-tv|R18+|600|"
    case br_Movie_L = "br-movie|L|000|"
    case br_Movie_12 = "br-movie|12|100|"
    case br_Movie_14 = "br-movie|14|300|"
    case br_Movie_16 = "br-movie|16|350|"
    case br_Movie_18 = "br-movie|18|400|"
    case ca_Movie_G = "ca-movie|G|100|"
    case ca_Movie_PG = "ca-movie|PG|200|"
    case ca_Movie_14A = "ca-movie|14A|300|"
    case ca_Movie_18A = "ca-movie|18A|350|"
    case ca_Movie_R = "ca-movie|R|400|"
    case ca_Movie_A = "ca-movie|A|500|"
    case ca_Movie_Unrated = "ca-movie|Unrated|???|"
    case ca_Movie_NR = "ca-movie|Not Rated|???|"
    case ca_tv_E = "ca-tv|E|000|"
    case ca_tv_C = "ca-tv|C|050|"
    case ca_tv_C8 = "ca-tv|C8|075|"
    case ca_tv_G = "ca-tv|G|100|"
    case ca_tv_PG = "ca-tv|PG|200|"
    case ca_tv_14 = "ca-tv|14+|300|"
    case ca_tv_18 = "ca-tv|18+|350|"
    case ca_tv_21 = "ca-tv|21+|500|"
    case de_Movie_AB0 = "de-movie|Ab 0 Jahren|075|"
    case de_Movie_AB6 = "de-movie|Ab 6 Jahren|100|"
    case de_Movie_AB12 = "de-movie|Ab 12 Jahren|200|"
    case de_Movie_AB16 = "de-movie|Ab 16 Jahren|500|"
    case de_Movie_AB18 = "de-movie|Ab 18 Jahren|600|"
    case de_tv_AB0 = "de-tv|Ab 0 Jahren|075|"
    case de_tv_AB6 = "de-tv|Ab 6 Jahren|100|"
    case de_tv_AB12 = "de-tv|Ab 12 Jahren|200|"
    case de_tv_AB16 = "de-tv|Ab 16 Jahren|500|"
    case de_tv_AB18 = "de-tv|Ab 18 Jahren|600|"
    case fr_Movie_TP = "fr-movie|Tout public|000|"
    case fr_Movie_10 = "fr-movie|-10|100|"
    case fr_Movie_12 = "fr-movie|-12|300|"
    case fr_Movie_16 = "fr-movie|-16|375|"
    case fr_Movie_18 = "fr-movie|-18|400|"
    case fr_Movie_Unrated = "fr-movie|Unrated|???|"
    case it_Movie_T = "it-movie|T|100|"
    case it_Movie_VPA = "it-movie|VPA|125|"
    case it_Movie_VM10 = "it-movie|VM10|150|"
    case it_Movie_VM12 = "it-movie|VM12|200|"
    case it_Movie_VM14 = "it-movie|VM14|325|"
    case it_Movie_VM18 = "it-movie|VM18|400|"
    case ie_Movie_NR = "ie-movie|Not Rated|000|"
    case ie_Movie_G = "ie-movie|G|100|"
    case ie_Movie_PG = "ie-movie|PG|200|"
    case ie_Movie_12 = "ie-movie|12|300|"
    case ie_Movie_15 = "ie-movie|15|350|"
    case ie_Movie_16 = "ie-movie|16|375|"
    case ie_Movie_18 = "ie-movie|18|400|"
    case ie_Movie_Unrated = "ie-movie|Unrated|???|"
    case ie_tv_G = "ie-tv|G|100|"
    case ie_tv_PG = "ie-tv|PG|350|"
    case ie_tv_12 = "ie-tv|12|400|"
    case ie_tv_15 = "ie-tv|15|500|"
    case ie_tv_18 = "ie-tv|18|600|"
    case jp_Movie_G = "jp-movie|G|100|"
    case jp_Movie_PG12 = "jp-movie|PG12|200|"
    case jp_Movie_R15 = "jp-movie|R15+|300|"
    case jp_Movie_R18 = "jp-movie|R18+|400|"
    case jp_Movie_Unrated = "jp-movie|Unrated|???|"
    case mx_Movie_AA = "mx-movie|AA|000|"
    case mx_Movie_A = "mx-movie|A|100|"
    case mx_Movie_B = "mx-movie|B|300|"
    case mx_Movie_B15 = "mx-movie|B-15|500|"
    case mx_Movie_C = "mx-movie|C|600|"
    case nl_Movie_AL = "nl-movie|AL/G|000|"
    case nl_Movie_6 = "nl-movie|6|100|"
    case nl_Movie_9 = "nl-movie|9|200|"
    case nl_Movie_12 = "nl-movie|12|300|"
    case nl_Movie_16 = "nl-movie|16|500|"
    case nl_Movie_18 = "nl-movie|18|600|"
    case nz_Movie_G = "nz-movie|G|100|"
    case nz_Movie_PG = "nz-movie|PG|200|"
    case nz_Movie_M = "nz-movie|M|300|"
    case nz_Movie_R13 = "nz-movie|R13|325|"
    case nz_Movie_RP13 = "nz-movie|RP13|325|"
    case nz_Movie_R15 = "nz-movie|R15|350|"
    case nz_Movie_R16 = "nz-movie|R16|375|"
    case nz_Movie_RP16 = "nz-movie|RP16|375|"
    case nz_Movie_R18 = "nz-movie|R18|400|"
    case nz_Movie_R = "nz-movie|R|500|"
    case nz_Movie_U = "nz-movie|U|900|"
    case nz_Movie_NR = "nz-movie|Not Rated|???|"
    case se_Movie_A = " se-movie|A|000|"
    case se_Movie_7 = " se-movie|7|125|"
    case se_Movie_11 = " se-movie|11|225|"
    case se_Movie_15 = " se-movie|15|400|"
    case se_Movie_Unrated = " se-movie|Unrated|???|"
    case ch_Movie_0 = "ch-movie|0|050|"
    case ch_Movie_6 = "ch-movie|6|075|"
    case ch_Movie_7 = "ch-movie|7|125|"
    case ch_Movie_10 = "ch-movie|10|150|"
    case ch_Movie_12 = "ch-movie|12|200|"
    case ch_Movie_14 = "ch-movie|14|325|"
    case ch_Movie_16 = "ch-movie|16|375|"
    case ch_Movie_18 = "ch-movie|18|400|"
    case ch_Movie_Unrated = "ch-movie|Unrated|???|"
    case uk_Movie_NR = "uk-movie|NR|000|"
    case uk_Movie_U = "uk-movie|U|100|"
    case uk_Movie_Uc = "uk-movie|Uc|150|"
    case uk_Movie_PG = "uk-movie|PG|200|"
    case uk_Movie_12 = "uk-movie|12|300|"
    case uk_Movie_12A = "uk-movie|12A|325|"
    case uk_Movie_15 = "uk-movie|15|350|"
    case uk_Movie_18 = "uk-movie|18|400|"
    case uk_tv_Caution = "uk-tv|Caution|500|"
    case uk_Movie_R18 = "uk-movie|R18|600|"
    case uk_Movie_E = "uk-movie|E|0|"
    case uk_Movie_Unrated = "uk-movie|Unrated|???|"
    case ru_Movie_0 = "ru-movie|0+|000|"
    case ru_Movie_6 = "ru-movie|6+|150|"
    case ru_Movie_12 = "ru-movie|12+|200|"
    case ru_Movie_16 = "ru-movie|16+|375|"
    case ru_Movie_18 = "ru-movie|18+|400|"
    case ru_Movie_Unrated = "ru-movie|Unrated|???|"
    case ph_Movie_G = "ph-movie|G|100|"
    case ph_Movie_PG = "ph-movie|PG|300|"
    case ph_Movie_R13 = "ph-movie|R-13|325|"
    case ph_Movie_R16 = "ph-movie|R-16|375|"
    case ph_Movie_R18 = "ph-movie|R-18|400|"
    case ph_Movie_Unrated = "ph-movie|Unrated|???|"
    case hk_Movie_100 = "hk-movie|第i類|100|"
    case hk_Movie_400 = "hk-movie|第ii類|400|"
    case hk_Movie_Unrated = "hk-movie|未作評級|???|"
    case cz_Movie_U = "cz-movies|U|100|"
    case cz_Movie_12 = "cz-movies|12+|200|"
    case cz_Movie_15 = "cz-movies|15+|350|"
    case cz_Movie_18 = "cz-movies|18+|400|"
    case cz_Movie_Unrated = "cz-movies|neklasifikováno|???|"
    case in_Movie_U = "in-movies|U|000|"
    case in_Movie_UA = "in-movies|UA|200|"
    case in_Movie_A = "in-movies|A|500|"
    case in_Movie_S = "in-movies|S|600|"
    case in_Movie_Unrated = "in-movies|रेट नहीं की गई|???|"
    case in_tv_U = "in-tv|U|100|"
    case in_tv_UA = "in-tv|UA|200|"
    case in_tv_A = "in-tv|A|600|"
    case in_tv_S = "in-tv|S|600|"
}
