/*

 ContentRatings.swift
 SwiftTaggerID3

 Copyright ©2020 Nolaine Crusher. All rights reserved.

 */

import Foundation

public enum ContentRating: String {
    case none = ""
    case clean = "Clean"
    case explicit = "Explicit"
}

public enum ContentAdvisory: String {
    
    case usMovieNR = "mpaa|NR|000|"
    case usMovieG = "mpaa|G|100|"
    case usMoviePG = "mpaa|PG|200|"
    case usMoviePG13 = "mpaa|PG-13|300|"
    case usMovieR = "mpaa|R|400|"
    case usMovieNC = "mpaa|NC-17|500|"
    case usMovieUnrated = "mpaa|Unrated|???|"
    case ustvY = "us-tv|TV-Y|100|"
    case ustvY7 = "us-tv|TV-Y7|200|"
    case ustvG = "us-tv|TV-G|300|"
    case ustvPG = "us-tv|TV-PG|400|"
    case ustv14 = "us-tv|TV-14|500|"
    case ustvM = "us-tv|M|600|"
    case ustvUnrated = "us-tv|Unrated|???|"
    case auMovieG = "au-movie|G|100|"
    case auMoviePG = "au-movie|PG|200|"
    case auMovieM = "au-movie|M|350|"
    case auMovieMA15 = "au-movie|MA15+|375|"
    case auMovieR18 = "au-movie|R18+|400|"
    case auMovieUnrated = "au-movie|Not Rated|???|"
    case autvP = "au-tv|P|100|"
    case autvC = "au-tv|C|200|"
    case autvG = "au-tv|G|300|"
    case autvPG = "au-tv|PG|400|"
    case autvM = "au-tv|M|500|"
    case autvMA15 = "au-tv|MA15+|550|"
    case autvAV15 = "au-tv|AV15+|575|"
    case autvR18 = "au-tv|R18+|600|"
    case brMovieL = "br-movie|L|000|"
    case brMovie12 = "br-movie|12|100|"
    case brMovie14 = "br-movie|14|300|"
    case brMovie16 = "br-movie|16|350|"
    case brMovie18 = "br-movie|18|400|"
    case caMovieG = "ca-movie|G|100|"
    case caMoviePG = "ca-movie|PG|200|"
    case caMovide14A = "ca-movie|14A|300|"
    case caMovide18A = "ca-movie|18A|350|"
    case caMovieR = "ca-movie|R|400|"
    case caMovieA = "ca-movie|A|500|"
    case caMovieUnrated = "ca-movie|Unrated|???|"
    case caMovieNR = "ca-movie|Not Rated|???|"
    case catvE = "ca-tv|E|000|"
    case catvC = "ca-tv|C|050|"
    case catvC8 = "ca-tv|C8|075|"
    case catvG = "ca-tv|G|100|"
    case catvPG = "ca-tv|PG|200|"
    case catv14 = "ca-tv|14+|300|"
    case catv18 = "ca-tv|18+|350|"
    case catv21 = "ca-tv|21+|500|"
    case deMovieAB0 = "de-movie|Ab 0 Jahren|075|"
    case deMovieAB6 = "de-movie|Ab 6 Jahren|100|"
    case deMovieAB12 = "de-movie|Ab 12 Jahren|200|"
    case deMovieAB16 = "de-movie|Ab 16 Jahren|500|"
    case deMovieAB18 = "de-movie|Ab 18 Jahren|600|"
    case detvAB0 = "de-tv|Ab 0 Jahren|075|"
    case detvAB6 = "de-tv|Ab 6 Jahren|100|"
    case detvAB12 = "de-tv|Ab 12 Jahren|200|"
    case detvAB16 = "de-tv|Ab 16 Jahren|500|"
    case detvAB18 = "de-tv|Ab 18 Jahren|600|"
    case frMovieTP = "fr-movie|Tout public|000|"
    case frMovie10 = "fr-movie|-10|100|"
    case frMovie12 = "fr-movie|-12|300|"
    case frMovie16 = "fr-movie|-16|375|"
    case frMovie18 = "fr-movie|-18|400|"
    case frMovieUnrated = "fr-movie|Unrated|???|"
    case itMovieT = "it-movie|T|100|"
    case itMovieVPA = "it-movie|VPA|125|"
    case itMovieVM10 = "it-movie|VM10|150|"
    case itMovieVM12 = "it-movie|VM12|200|"
    case itMovieVM14 = "it-movie|VM14|325|"
    case itMovieVM18 = "it-movie|VM18|400|"
    case ieMovieNR = "ie-movie|Not Rated|000|"
    case ieMovieG = "ie-movie|G|100|"
    case ieMoviePG = "ie-movie|PG|200|"
    case ieMovie12 = "ie-movie|12|300|"
    case ieMovie15 = "ie-movie|15|350|"
    case ieMovie16 = "ie-movie|16|375|"
    case ieMovie18 = "ie-movie|18|400|"
    case ieMovieUnrated = "ie-movie|Unrated|???|"
    case ietvG = "ie-tv|G|100|"
    case ietvPG = "ie-tv|PG|350|"
    case ietv12 = "ie-tv|12|400|"
    case ietv15 = "ie-tv|15|500|"
    case ietv18 = "ie-tv|18|600|"
    case jpMovieG = "jp-movie|G|100|"
    case jpMoviePG12 = "jp-movie|PG12|200|"
    case jpMovieR15 = "jp-movie|R15+|300|"
    case jpMovieR18 = "jp-movie|R18+|400|"
    case jpMovieUnrated = "jp-movie|Unrated|???|"
    case mxMovieAA = "mx-movie|AA|000|"
    case mxMovieA = "mx-movie|A|100|"
    case mxMovieB = "mx-movie|B|300|"
    case mxMovieB15 = "mx-movie|B-15|500|"
    case mxMovieC = "mx-movie|C|600|"
    case nlMovieAL = "nl-movie|AL/G|000|"
    case nlMovie6 = "nl-movie|6|100|"
    case nlMovie9 = "nl-movie|9|200|"
    case nlMovie12 = "nl-movie|12|300|"
    case nlMovie16 = "nl-movie|16|500|"
    case nlMovie18 = "nl-movie|18|600|"
    case nzMovieG = "nz-movie|G|100|"
    case nzMoviePG = "nz-movie|PG|200|"
    case nzMovieM = "nz-movie|M|300|"
    case nzMovieR13 = "nz-movie|R13|325|"
    case nzMovieRP13 = "nz-movie|RP13|325|"
    case nzMovieR15 = "nz-movie|R15|350|"
    case nzMovieR16 = "nz-movie|R16|375|"
    case nzMovieRP16 = "nz-movie|RP16|375|"
    case nzMovieR18 = "nz-movie|R18|400|"
    case nzMovieR = "nz-movie|R|500|"
    case nzMovieU = "nz-movie|U|900|"
    case nzMovieNR = "nz-movie|Not Rated|???|"
    case seMovieA = " se-movie|A|000|"
    case seMovie7 = " se-movie|7|125|"
    case seMovie11 = " se-movie|11|225|"
    case seMovie15 = " se-movie|15|400|"
    case seMovieUnrated = " se-movie|Unrated|???|"
    case chMovie0 = "ch-movie|0|050|"
    case chMovie6 = "ch-movie|6|075|"
    case chMovie7 = "ch-movie|7|125|"
    case chMovie10 = "ch-movie|10|150|"
    case chMovie12 = "ch-movie|12|200|"
    case chMovie14 = "ch-movie|14|325|"
    case chMovie16 = "ch-movie|16|375|"
    case chMovie18 = "ch-movie|18|400|"
    case chMovieUnrated = "ch-movie|Unrated|???|"
    case ukMovieNR = "uk-movie|NR|000|"
    case ukMovieU = "uk-movie|U|100|"
    case ukMovieUc = "uk-movie|Uc|150|"
    case ukMoviePG = "uk-movie|PG|200|"
    case ukMovie12 = "uk-movie|12|300|"
    case ukMovie12A = "uk-movie|12A|325|"
    case ukMovie15 = "uk-movie|15|350|"
    case ukMovie18 = "uk-movie|18|400|"
    case uktvCaution = "uk-tv|Caution|500|"
    case ukMovieR18 = "uk-movie|R18|600|"
    case ukMovieE = "uk-movie|E|0|"
    case ukMovieUnrated = "uk-movie|Unrated|???|"
    case ruMovie0 = "ru-movie|0+|000|"
    case ruMovie6 = "ru-movie|6+|150|"
    case ruMovie12 = "ru-movie|12+|200|"
    case ruMovie16 = "ru-movie|16+|375|"
    case ruMovie18 = "ru-movie|18+|400|"
    case ruMovieUnrated = "ru-movie|Unrated|???|"
    case phMovieG = "ph-movie|G|100|"
    case phMoviePG = "ph-movie|PG|300|"
    case phMovieR13 = "ph-movie|R-13|325|"
    case phMovieR16 = "ph-movie|R-16|375|"
    case phMovieR18 = "ph-movie|R-18|400|"
    case phMovieUnrated = "ph-movie|Unrated|???|"
    case hkMovie100 = "hk-movie|第i類|100|"
    case hkMovie400 = "hk-movie|第ii類|400|"
    case hkMovieUnrated = "hk-movie|未作評級|???|"
    case czMovieU = "cz-movies|U|100|"
    case czMovie12 = "cz-movies|12+|200|"
    case czMovie15 = "cz-movies|15+|350|"
    case czMovie18 = "cz-movies|18+|400|"
    case czMovieUnrated = "cz-movies|neklasifikováno|???|"
    case inMovieU = "in-movies|U|000|"
    case inMovieUA = "in-movies|UA|200|"
    case inMovieA = "in-movies|A|500|"
    case inMovieS = "in-movies|S|600|"
    case inMovieUnrated = "in-movies|रेट नहीं की गई|???|"
    case intvU = "in-tv|U|100|"
    case intvUA = "in-tv|UA|200|"
    case intvA = "in-tv|A|600|"
    case intvS = "in-tv|S|600|"
}
