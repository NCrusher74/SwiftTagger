/*

 GenreType.swift
 SwiftTaggerID3

 Copyright ©2020 Nolaine Crusher. All rights reserved.

 */

public enum GenreType: String, CaseIterable  {
    
    case Blues = "Blues"
    case ClassicRock = "Classic Rock"
    case Country = "Country"
    case Dance = "Dance"
    case Disco = "Disco"
    case Funk = "Funk"
    case Grunge = "Grunge"
    case HipHop = "HipHop"
    case Jazz = "Jazz"
    case Metal = "Metal"
    case NewAge = "New Age"
    case Oldies = "Oldies"
    case Other = "Other"
    case Pop = "Pop"
    case RandB = "R&B"
    case Rap = "Rap"
    case Reggae = "Reggae"
    case Rock = "Rock"
    case Techno = "Techno"
    case Industrial = "Industrial"
    case Alternative = "Alternative"
    case Ska = "Ska"
    case DeathMetal = "Death Metal"
    case Pranks = "Pranks"
    case Soundtrack = "Soundtrack"
    case EuroTechno = "Euro-Techno"
    case Ambient = "Ambient"
    case TripHop = "TripHop"
    case Vocal = "Vocal"
    case JazzAndFunk = "Jazz and Funk"
    case Fusion = "Fusion"
    case Trance = "Trance"
    case Classical = "Classical"
    case Instrumental = "Instrumental"
    case Acid = "Acid"
    case House = "House"
    case Game = "Game"
    case SoundClip = "Sound Clip"
    case Gospel = "Gospel"
    case Noise = "Noise"
    case AltRock = "Alt Rock"
    case Bass = "Bass"
    case Soul = "Soul"
    case Punk = "Punk"
    case Space = "Space"
    case Meditative = "Meditative"
    case InstrumentalPop = "Instrumental Pop"
    case InstrumentalRock = "Instrumental Rock"
    case Ethnic = "Ethnic"
    case Gothic = "Gothic"
    case Darkwave = "Darkwave"
    case TechnoIndustrial = "Techno/Industrial"
    case Electronic = "Electronic"
    case PopFolk = "Pop Folk"
    case Eurodance = "Eurodance"
    case Dream = "Dream"
    case SouthernRock = "Southern Rock"
    case Comedy = "Comedy"
    case Cult = "Cult"
    case GangstaRap = "Gangsta Rap"
    case Top40 = "Top 40"
    case ChristianRap = "Christian Rap"
    case PopFunk = "Pop Funk"
    case Jungle = "Jungle"
    case NativeAmerican = "Native American"
    case Cabaret = "Cabaret"
    case NewWave = "New Wavew"
    case Psychedelic = "Psychedelic"
    case Rave = "Rave"
    case Showtunes = "Showtunes"
    case Trailer = "Trailer"
    case LoFi = "LoFi"
    case Tribal = "Tribal"
    case AcidPunk = "Acid Punk"
    case AcidJazz = "Acid Jazz"
    case Polka = "Polka"
    case Retro = "Retro"
    case Musical = "Musical"
    case RockAndRoll = "Rock & Roll"
    case HardRock = "Hard Rock"
    case Folk = "Folk"
    case FolkRock = "Folk Rock"
    case NationalFolk = "National Folk"
    case Swing = "Swing"
    case FastFusion = "Fast Fusion"
    case Bebop = "Bebob"
    case Latin = "Latin"
    case Revival = "Revival"
    case Celtic = "Celtic"
    case Bluegrass = "Bluegrass"
    case Avantgarde = "Avant Garde"
    case GothicRock = "Gothic Rock"
    case ProgressiveRock = "Progressive Rock"
    case PsychedelicRock = "Psychedelic Rock"
    case SymphonicRock = "Symphonic Rock"
    case SlowRock = "Slow Rock"
    case BigBand = "Big Band"
    case Chorus = "Chorus"
    case EasyListening = "Easy Listening"
    case Acoustic = "Acoustic"
    case Humour = "Humor"
    case Speech = "Speech"
    case Chanson = "Chanson"
    case Opera = "Opera"
    case ChamberMusic = "Chamber Music"
    case Sonata = "Sonata"
    case Symphony = "Symphony"
    case BootyBass = "Booty Bass"
    case Primus = "Primus"
    case PornGroove = "Porn Groove"
    case Satire = "Satire"
    case SlowJam = "Slow Jam"
    case Club = "Club"
    case Tango = "Tango"
    case Samba = "Samba"
    case Folklore = "Folklore"
    case Ballad = "Ballad"
    case PowerBallad = "PowerBallad"
    case RhythmicSoul = "RhythmicSoul"
    case Freestyle = "Freestyle"
    case Duet = "Duet"
    case PunkRock = "Punk Rock"
    case DrumSolo = "Drum Solo"
    case ACappella = "a Capella"
    case EuroHouse = "Euro House"
    case DanceHall = "Dance Hall"
    case Goa = "Goa"
    case DrumAndBass = "Drum and Bass"
    case ClubHouse = "Club House"
    case Hardcore = "Hardcore"
    case Terror = "Terror"
    case Indie = "Indie"
    case BritPop = "Brit Pop"
    case AfroPunk = "Afro Punk"
    case PolskPunk = "Polsk Punk"
    case Beat = "Beat"
    case ChristianGangstaRap = "Christian Gangsta Rap"
    case HeavyMetal = "Heavy Meta"
    case BlackMetal = "Black Metal"
    case Crossover = "Crossover"
    case ContemporaryChristian = "Contemporary Christian"
    case ChristianRock = "Christian Rock"
    case Merengue = "Merengue"
    case Salsa = "Salsa"
    case ThrashMetal = "Thrash Metal"
    case Anime = "Anime"
    case JPop = "JPop"
    case Synthpop = "Synthpop"
    case Abstract = "Abstract"
    case ArtRock = "ArtRock"
    case Baroque = "Baroque"
    case Bhangra = "Bhangra"
    case BigBeat = "Big Beat"
    case Breakbeat = "Breakbeat"
    case Chillout = "Chillout"
    case Downtempo = "Downtempo"
    case Dub = "Dub"
    case EBM = "EBM"
    case Eclectic = "Eclectic"
    case Electro = "Electro"
    case Electroclash = "Electroclash"
    case Emo = "Emo"
    case Experimental = "Experimental"
    case Garage = "Garage"
    case Global = "Global"
    case IDM = "IDM"
    case Illbient = "Illbient"
    case IndustroGoth = "Industrial Goth"
    case JamBand = "Jam Band"
    case Krautrock = "Krautrock"
    case Leftfield = "Leftfield"
    case Lounge = "Lounge"
    case MathRock = "Math Rock"
    case NewRomantic = "New Romantic"
    case NuBreakz = "Nu Breakz"
    case PostPunk = "Post Punk"
    case PostRock = "Post Rock"
    case Psytrance = "Psytrance"
    case Shoegaze = "Shoegaze"
    case SpaceRock = "Space Rock"
    case TropRock = "Trop Rock"
    case WorldMusic = "World Music"
    case Neoclassical = "Neoclassical"
    case Audiobook = "Audiobook"
    case AudioTheatre = "Audio Theatre"
    case NeueDeutscheWelle = "Neue Deutsche Welle"
    case Podcast = "Podcast"
    case IndieRock = "Indie Rock"
    case GFunk = "GFunk"
    case Dubstep = "Dubstep"
    case GarageRock = "Garage Rock"
    case Psybient = "Psybient"
    case none = "None"
    case Remix = "Remix"
    case Cover = "Cover"
    
    public var code: Int {
        switch self {
            case .Blues: return 0
            case .ClassicRock: return 1
            case .Country: return 2
            case .Dance: return 3
            case .Disco: return 4
            case .Funk: return 5
            case .Grunge: return 6
            case .HipHop: return 7
            case .Jazz: return 8
            case .Metal: return 9
            case .NewAge: return 10
            case .Oldies: return 11
            case .Other: return 12
            case .Pop: return 13
            case .RandB: return 14
            case .Rap: return 15
            case .Reggae: return 16
            case .Rock: return 17
            case .Techno: return 18
            case .Industrial: return 19
            case .Alternative: return 20
            case .Ska: return 21
            case .DeathMetal: return 22
            case .Pranks: return 23
            case .Soundtrack: return 24
            case .EuroTechno: return 25
            case .Ambient: return 26
            case .TripHop: return 27
            case .Vocal: return 28
            case .JazzAndFunk: return 29
            case .Fusion: return 30
            case .Trance: return 31
            case .Classical: return 32
            case .Instrumental: return 33
            case .Acid: return 34
            case .House: return 35
            case .Game: return 36
            case .SoundClip: return 37
            case .Gospel: return 38
            case .Noise: return 39
            case .AltRock: return 40
            case .Bass: return 41
            case .Soul: return 42
            case .Punk: return 43
            case .Space: return 44
            case .Meditative: return 45
            case .InstrumentalPop: return 46
            case .InstrumentalRock: return 47
            case .Ethnic: return 48
            case .Gothic: return 49
            case .Darkwave: return 50
            case .TechnoIndustrial: return 51
            case .Electronic: return 52
            case .PopFolk: return 53
            case .Eurodance: return 54
            case .Dream: return 55
            case .SouthernRock: return 56
            case .Comedy: return 57
            case .Cult: return 58
            case .GangstaRap: return 59
            case .Top40: return 60
            case .ChristianRap: return 61
            case .PopFunk: return 62
            case .Jungle: return 63
            case .NativeAmerican: return 64
            case .Cabaret: return 65
            case .NewWave: return 66
            case .Psychedelic: return 67
            case .Rave: return 68
            case .Showtunes: return 69
            case .Trailer: return 70
            case .LoFi: return 71
            case .Tribal: return 72
            case .AcidPunk: return 73
            case .AcidJazz: return 74
            case .Polka: return 75
            case .Retro: return 76
            case .Musical: return 77
            case .RockAndRoll: return 78
            case .HardRock: return 79
            case .Folk: return 80
            case .FolkRock: return 81
            case .NationalFolk: return 82
            case .Swing: return 83
            case .FastFusion: return 84
            case .Bebop: return 85
            case .Latin: return 86
            case .Revival: return 87
            case .Celtic: return 88
            case .Bluegrass: return 89
            case .Avantgarde: return 90
            case .GothicRock: return 91
            case .ProgressiveRock: return 92
            case .PsychedelicRock: return 93
            case .SymphonicRock: return 94
            case .SlowRock: return 95
            case .BigBand: return 96
            case .Chorus: return 97
            case .EasyListening: return 98
            case .Acoustic: return 99
            case .Humour: return 100
            case .Speech: return 101
            case .Chanson: return 102
            case .Opera: return 103
            case .ChamberMusic: return 104
            case .Sonata: return 105
            case .Symphony: return 106
            case .BootyBass: return 107
            case .Primus: return 108
            case .PornGroove: return 109
            case .Satire: return 110
            case .SlowJam: return 111
            case .Club: return 112
            case .Tango: return 113
            case .Samba: return 114
            case .Folklore: return 115
            case .Ballad: return 116
            case .PowerBallad: return 117
            case .RhythmicSoul: return 118
            case .Freestyle: return 119
            case .Duet: return 120
            case .PunkRock: return 121
            case .DrumSolo: return 122
            case .ACappella: return 123
            case .EuroHouse: return 124
            case .DanceHall: return 125
            case .Goa: return 126
            case .DrumAndBass: return 127
            case .ClubHouse: return 128
            case .Hardcore: return 129
            case .Terror: return 130
            case .Indie: return 131
            case .BritPop: return 132
            case .AfroPunk: return 133
            case .PolskPunk: return 134
            case .Beat: return 135
            case .ChristianGangstaRap: return 136
            case .HeavyMetal: return 137
            case .BlackMetal: return 138
            case .Crossover: return 139
            case .ContemporaryChristian: return 140
            case .ChristianRock: return 141
            case .Merengue: return 142
            case .Salsa: return 143
            case .ThrashMetal: return 144
            case .Anime: return 145
            case .JPop: return 146
            case .Synthpop: return 147
            case .Abstract: return 148
            case .ArtRock: return 149
            case .Baroque: return 150
            case .Bhangra: return 151
            case .BigBeat: return 152
            case .Breakbeat: return 153
            case .Chillout: return 154
            case .Downtempo: return 155
            case .Dub: return 156
            case .EBM: return 157
            case .Eclectic: return 158
            case .Electro: return 159
            case .Electroclash: return 160
            case .Emo: return 161
            case .Experimental: return 162
            case .Garage: return 163
            case .Global: return 164
            case .IDM: return 165
            case .Illbient: return 166
            case .IndustroGoth: return 167
            case .JamBand: return 168
            case .Krautrock: return 169
            case .Leftfield: return 170
            case .Lounge: return 171
            case .MathRock: return 172
            case .NewRomantic: return 173
            case .NuBreakz: return 174
            case .PostPunk: return 175
            case .PostRock: return 176
            case .Psytrance: return 177
            case .Shoegaze: return 178
            case .SpaceRock: return 179
            case .TropRock: return 180
            case .WorldMusic: return 181
            case .Neoclassical: return 182
            case .Audiobook: return 183
            case .AudioTheatre: return 184
            case .NeueDeutscheWelle: return 185
            case .Podcast: return 186
            case .IndieRock: return 187
            case .GFunk: return 188
            case .Dubstep: return 189
            case .GarageRock: return 190
            case .Psybient: return 191
            case .none: return 255
            case .Remix: return 256
            case .Cover: return 257
        }
    }
    
    static let codeMapping: [Int: GenreType] = {
        var mapping: [Int: GenreType] = [:]
        for genre in GenreType.allCases {
            let id = genre.code
            mapping[id] = genre
        }
        return mapping
    }()
    
    public init?(code: Int) {
        self = GenreType.codeMapping[code] ?? .none
    }
}
