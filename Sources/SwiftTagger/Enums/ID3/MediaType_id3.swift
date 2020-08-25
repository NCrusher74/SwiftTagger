/*

 MediaType.swift
 SwiftTaggerID3

 Copyright ©2020 Nolaine Crusher. All rights reserved.

 */

import Foundation
public enum MediaType: String, CaseIterable {
    
    /// Other digital media
    case otherDigital = "DIG"
    /// Other analogue media
    case otherAnalog = "ANA"
    /// Compact Disc
    case compactDisc = "CD"
    /// Laserdisc
    case laserdisc = "LD"
    /// Minidisc
    case minidisc = "MD"
    /// DCC
    case dcc = "DCC"
    /// DAT
    case dat = "DAT"
    /// Turntable records
    case turntableRecord = "TT"
    /// DVD
    case dvd = "DVD"
    /// Television
    case television = "TV"
    /// Video
    case video = "VID"
    /// Radio
    case radio = "RAD"
    /// Telephone
    case telephone = "TEL"
    /// Normal Cassette
    case normalCassette = "MC"
    /// Reel
    case reel = "REE"
    case none = "none"
}

public enum MediaTypeRefinements: String, CaseIterable {
    
    /// Analog transfer from media
    case analogTransfer
    /// Other Analog Media/Wax cylinder
    case waxCylinder
    /// Other Analog Media/8-track tape cassette
    case eightTrack
    /// CD/DDD
    case ddd
    /// CD/DDD
    case add
    /// CD/AAD
    case aad
    /// Turntable Records/33.33 rpm
    case rpm33
    /// Turntable Records/45 rpm
    case rpm45
    /// Turntable Records/71.29 rpm
    case rpm71
    /// Turntable Records/76.59 rpm
    case rpm76
    /// Turntable Records/78.26 rpm
    case rpm78
    /// Turntable Records/80 rpm
    case rpm80
    /// DAT/standard, 48 kHz/16 bits, linear
    case DATstandard
    /// DAT/mode 2, 32 kHz/16 bits, linear
    case DATmode2
    /// DAT/mode 3, 32 kHz/12 bits, non-linear, low speed
    case DATmode3
    /// DAT/mode 4, 32 kHz/12 bits, 4 channels
    case DATmode4
    /// DAT/mode 5, 44.1 kHz/16 bits, linear
    case DATmode5
    /// DAT/mode 6, 44.1 kHz/16 bits, 'wide track' play
    case DATmode6
    /// TV or Video/PAL
    case pal
    /// TV or Video/NTSC
    case ntsc
    /// TV or Video/SECAM
    case secam
    /// Video/VHS
    case vhs
    /// Video/S-VHS
    case svhs
    /// Video/Betamax
    case betamax
    /// Radio/AM
    case am
    /// Radio/FM
    case fm
    /// Radio/LW
    case lw
    /// Radio/MW
    case mw
    /// Telephone/ISDN
    case isdn
    /// Normal Cassette/4.75 cm/s (normal speed for a two sided cassette)
    case normalSpeed
    /// Normal Cassette or Reel/9.5 cm/s
    case CMS9
    /// Reel/19 cm/s
    case CMS19
    /// Reel/38 cm/s
    case CMS38
    /// Reel/76 cm/s
    case CMS76
    /// Normal Cassette or Reel / Type I cassette (ferric/normal)
    case typeI
    /// Normal Cassette or Reel / Type II cassette (chrome)
    case typeII
    /// Normal Cassette or Reel / Type III cassette (ferric chrome)
    case typeIII
    /// Normal Cassette or Reel / Type IV cassette (metal)
    case typeIV
    case none
    
    var code: String {
        switch self {
            case .analogTransfer: return "/A"
            case .waxCylinder: return "/WC"
            case .eightTrack: return "/8CA"
            case .ddd: return "/DD"
            case .add: return "/AD"
            case .aad: return "/AA"
            case .rpm33: return "/33"
            case .rpm45: return "/45"
            case .rpm71: return "/71"
            case .rpm76: return "/76"
            case .rpm78: return "/78"
            case .rpm80: return "/80"
            case .DATstandard: return "/1"
            case .DATmode2: return "/2"
            case .DATmode3: return "/3"
            case .DATmode4: return "/4"
            case .DATmode5: return "/5"
            case .DATmode6: return "/6"
            case .pal: return "/PAL"
            case .ntsc: return "/NTSC"
            case .secam: return "/SECAM"
            case .vhs: return "/VHS"
            case .svhs: return "/SVHS"
            case .betamax: return "/BETA"
            case .am: return "/AM"
            case .fm: return "/FM"
            case .lw: return "/LW"
            case .mw: return "/MW"
            case .isdn: return "/ISDN"
            case .normalSpeed: return "/4"
            case .CMS9: return "/9"
            case .CMS19: return "/19"
            case .CMS38: return "/38"
            case .CMS76: return "/76"
            case .typeI: return "/I"
            case .typeII: return "/II"
            case .typeIII: return "/III"
            case .typeIV: return "/IV"
            case .none: return "none"
        }
    }
    
    static let codeMapping: [String: MediaTypeRefinements] = {
        var mapping: [String: MediaTypeRefinements] = [:]
        for refinement in MediaTypeRefinements.allCases {
            let id = refinement.code
            mapping[id] = refinement
        }
        return mapping
    }()
    
    init?(code: String) {
        self = MediaTypeRefinements.codeMapping[code] ?? .none
    }
}
