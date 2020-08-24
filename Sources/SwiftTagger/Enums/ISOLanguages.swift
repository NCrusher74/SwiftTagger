/*

 ISOLanguages.swift
 SwiftTaggerID3

 Copyright ©2020 Nolaine Crusher. All rights reserved.

 */

public enum ISO6392Codes: String, CaseIterable {
    
    /// Afar
    case aar
    /// Abkhazian
    case abk
    /// Achinese
    case ace
    /// Acoli
    case ach
    /// Adangme
    case ada
    /// Adyghe; Adygei
    case ady
    /// Afro-Asiatic languages
    case afa
    /// Afrihili
    case afh
    /// Afrikaans
    case afr
    /// Ainu
    case ain
    /// Akan
    case aka
    /// Akkadian
    case akk
    /// Albanian
    case sqi
    /// Aleut
    case ale
    /// Algonquian languages
    case alg
    /// Southern Altai
    case alt
    /// Amharic
    case amh
    /// English, Old (ca.450–1100)
    case ang
    /// Angika
    case anp
    /// Apache languages
    case apa
    /// Arabic
    case ara
    /// Official Aramaic, (700–300 BCE); Imperial Aramaic, (700–300 BCE)
    case arc
    /// Aragonese
    case arg
    /// Armenian
    case hye
    /// Mapudungun; Mapuche
    case arn
    /// Arapaho
    case arp
    /// Artificial languages
    case art
    /// Arawak
    case arw
    /// Assamese
    case asm
    /// Asturian; Bable; Leonese; Asturleonese
    case ast
    /// Athapascan languages
    case ath
    /// Australian languages
    case aus
    /// Avaric
    case ava
    /// Avestan
    case ave
    /// Awadhi
    case awa
    /// Aymara
    case aym
    /// Azerbaijani
    case aze
    /// Banda languages
    case bad
    /// Bamileke languages
    case bai
    /// Bashkir
    case bak
    /// Baluchi
    case bal
    /// Bambara
    case bam
    /// Balinese
    case ban
    /// Basque
    case eus
    /// Basa
    case bas
    /// Baltic languages
    case bat
    /// Beja; Bedawiyet
    case bej
    /// Belarusian
    case bel
    /// Bemba
    case bem
    /// Bengali
    case ben
    /// Berber languages
    case ber
    /// Bhojpuri
    case bho
    /// Bihari languages
    case bih
    /// Bikol
    case bik
    /// Bini; Edo
    case bin
    /// Bislama
    case bis
    /// Siksika
    case bla
    /// Bantu (Other)
    case bnt
    /// Tibetan
    case bod
    /// Bosnian
    case bos
    /// Braj
    case bra
    /// Breton
    case bre
    /// Batak languages
    case btk
    /// Buriat
    case bua
    /// Buginese
    case bug
    /// Bulgarian
    case bul
    /// Burmese
    case mya
    /// Blin; Bilin
    case byn
    /// Caddo
    case cad
    /// Central American Indian languages
    case cai
    /// Galibi Carib
    case car
    /// Catalan; Valencian
    case cat
    /// Caucasian languages
    case cau
    /// Cebuano
    case ceb
    /// Celtic languages
    case cel
    /// Czech
    case ces
    /// Chamorro
    case cha
    /// Chibcha
    case chb
    /// Chechen
    case che
    /// Chagatai
    case chg
    /// Chinese
    case zho
    /// Chuukese
    case chk
    /// Mari
    case chm
    /// Chinook jargon
    case chn
    /// Choctaw
    case cho
    /// Chipewyan; Dene Suline
    case chp
    /// Cherokee
    case chr
    /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
    case chu
    /// Chuvash
    case chv
    /// Cheyenne
    case chy
    /// Chamic languages
    case cmc
    /// Montenegrin
    case cnr
    /// Coptic
    case cop
    /// Cornish
    case cor
    /// Corsican
    case cos
    /// Creoles and pidgins, English based
    case cpe
    /// Creoles and pidgins, French-based
    case cpf
    /// Creoles and pidgins, Portuguese-based
    case cpp
    /// Cree
    case cre
    /// Crimean Tatar; Crimean Turkish
    case crh
    /// Creoles and pidgins
    case crp
    /// Kashubian
    case csb
    /// Cushitic languages
    case cus
    /// Welsh
    case cym
    /// Dakota
    case dak
    /// Danish
    case dan
    /// Dargwa
    case dar
    /// Land Dayak languages
    case day
    /// Delaware
    case del
    /// Slave (isoName: Athapascan)
    case den
    /// German
    case deu
    /// Dogrib
    case dgr
    /// Dinka
    case din
    /// Divehi; Dhivehi; Maldivian
    case div
    /// Dogri
    case doi
    /// Dravidian languages
    case dra
    /// Lower Sorbian
    case dsb
    /// Duala
    case dua
    /// Dutch, Middle (ca. 1050–1350)
    case dum
    /// Dutch; Flemish
    case nld
    /// Dyula
    case dyu
    /// Dzongkha
    case dzo
    /// Efik
    case efi
    /// Egyptian (Ancient)
    case egy
    /// Ekajuk
    case eka
    /// Greek, Modern (1453–)
    case ell
    /// Elamite
    case elx
    /// English
    case eng
    /// English, Middle (1100–1500)
    case enm
    /// Esperanto
    case epo
    /// Estonian
    case est
    /// Ewe
    case ewe
    /// Ewondo
    case ewo
    /// Fang
    case fan
    /// Faroese
    case fao
    /// Persian
    case fas
    /// Fanti
    case fat
    /// Fijian
    case fij
    /// Filipino; Pilipino
    case fil
    /// Finnish
    case fin
    /// Finno-Ugrian languages
    case fiu
    /// Fon
    case fon
    /// French
    case fra
    /// French, Middle (ca. 1400–1600)
    case frm
    /// French, Old (842–ca. 1400)
    case fro
    /// Northern Frisian
    case frr
    /// Eastern Frisian
    case frs
    /// Western Frisian
    case fry
    /// Fulah
    case ful
    /// Friulian
    case fur
    /// Ga
    case gaa
    /// Gayo
    case gay
    /// Gbaya
    case gba
    /// Germanic languages
    case gem
    /// Georgian
    case kat
    /// Geez
    case gez
    /// Gilbertese
    case gil
    /// Gaelic; Scottish Gaelic
    case gla
    /// Irish
    case gle
    /// Galician
    case glg
    /// Manx
    case glv
    /// German, Middle High (ca. 1050–1500)
    case gmh
    /// German, Old High (ca. 750–1050)
    case goh
    /// Gondi
    case gon
    /// Gorontalo
    case gor
    /// Gothic
    case got
    /// Grebo
    case grb
    /// Greek, Ancient (to 1453)
    case grc
    /// Guarani
    case grn
    /// Swiss German; Alemannic; Alsatian
    case gsw
    /// Gujarati
    case guj
    /// Gwich'in
    case gwi
    /// Haida
    case hai
    /// Haitian; Haitian Creole
    case hat
    /// Hausa
    case hau
    /// Hawaiian
    case haw
    /// Hebrew
    case heb
    /// Herero
    case her
    /// Hiligaynon
    case hil
    /// Himachali languages; Pahari languages
    case him
    /// Hindi
    case hin
    /// Hittite
    case hit
    /// Hmong; Mong
    case hmn
    /// Hiri Motu
    case hmo
    /// Croatian
    case hrv
    /// Upper Sorbian
    case hsb
    /// Hungarian
    case hun
    /// Hupa
    case hup
    /// Iban
    case iba
    /// Igbo
    case ibo
    /// Icelandic
    case isl
    /// Ido
    case ido
    /// Sichuan Yi; Nuosu
    case iii
    /// Ijo languages
    case ijo
    /// Inuktitut
    case iku
    /// Interlingue; Occidental
    case ile
    /// Iloko
    case ilo
    /// Interlingua (International Auxiliary Language Association)
    case ina
    /// Indic languages
    case inc
    /// Indonesian
    case ind
    /// Indo-European languages
    case ine
    /// Ingush
    case inh
    /// Inupiaq
    case ipk
    /// Iranian languages
    case ira
    /// Iroquoian languages
    case iro
    /// Italian
    case ita
    /// Javanese
    case jav
    /// Lojban
    case jbo
    /// Japanese
    case jpn
    /// Judeo-Persian
    case jpr
    /// Judeo-Arabic
    case jrb
    /// Kara-Kalpak
    case kaa
    /// Kabyle
    case kab
    /// Kachin; Jingpho
    case kac
    /// Kalaallisut; Greenlandic
    case kal
    /// Kamba
    case kam
    /// Kannada
    case kan
    /// Karen languages
    case kar
    /// Kashmiri
    case kas
    /// Kanuri
    case kau
    /// Kawi
    case kaw
    /// Kazakh
    case kaz
    /// Kabardian
    case kbd
    /// Khasi
    case kha
    /// Khoisan languages
    case khi
    /// Central Khmer
    case khm
    /// Khotanese; Sakan
    case kho
    /// Kikuyu; Gikuyu
    case kik
    /// Kinyarwanda
    case kin
    /// Kirghiz; Kyrgyz
    case kir
    /// Kimbundu
    case kmb
    /// Konkani
    case kok
    /// Komi
    case kom
    /// Kongo
    case kon
    /// Korean
    case kor
    /// Kosraean
    case kos
    /// Kpelle
    case kpe
    /// Karachay-Balkar
    case krc
    /// Karelian
    case krl
    /// Kru languages
    case kro
    /// Kurukh
    case kru
    /// Kuanyama; Kwanyama
    case kua
    /// Kumyk
    case kum
    /// Kurdish
    case kur
    /// Kutenai
    case kut
    /// Ladino
    case lad
    /// Lahnda
    case lah
    /// Lamba
    case lam
    /// Lao
    case lao
    /// Latin
    case lat
    /// Latvian
    case lav
    /// Lezghian
    case lez
    /// Limburgan; Limburger; Limburgish
    case lim
    /// Lingala
    case lin
    /// Lithuanian
    case lit
    /// Mongo
    case lol
    /// Lozi
    case loz
    /// Luxembourgish; Letzeburgesch
    case ltz
    /// Luba-Lulua
    case lua
    /// Luba-Katanga
    case lub
    /// Ganda
    case lug
    /// Luiseno
    case lui
    /// Lunda
    case lun
    /// Luo (Kenya and Tanzania)
    case luo
    /// Lushai
    case lus
    /// Macedonian
    case mkd
    /// Madurese
    case mad
    /// Magahi
    case mag
    /// Marshallese
    case mah
    /// Maithili
    case mai
    /// Makasar
    case mak
    /// Malayalam
    case mal
    /// Mandingo
    case man
    /// Maori
    case mri
    /// Austronesian languages
    case map
    /// Marathi
    case mar
    /// Masai
    case mas
    /// Malay
    case msa
    /// Moksha
    case mdf
    /// Mandar
    case mdr
    /// Mende
    case men
    /// Irish, Middle (900–1200)
    case mga
    /// Mi'kmaq; Micmac
    case mic
    /// Minangkabau
    case min
    /// Uncoded languages
    case mis
    /// Mon-Khmer languages
    case mkh
    /// Malagasy
    case mlg
    /// Maltese
    case mlt
    /// Manchu
    case mnc
    /// Manipuri
    case mni
    /// Manobo languages
    case mno
    /// Mohawk
    case moh
    /// Mongolian
    case mon
    /// Mossi
    case mos
    /// Multiple languages
    case mul
    /// Munda languages
    case mun
    /// Creek
    case mus
    /// Mirandese
    case mwl
    /// Marwari
    case mwr
    /// Mayan languages
    case myn
    /// Erzya
    case myv
    /// Nahuatl languages
    case nah
    /// North American Indian languages
    case nai
    /// Neapolitan
    case nap
    /// Nauru
    case nau
    /// Navajo; Navaho
    case nav
    /// Ndebele, South; South Ndebele
    case nbl
    /// Ndebele, North; North Ndebele
    case nde
    /// Ndonga
    case ndo
    /// Low German; Low Saxon; German, Low; Saxon, Low
    case nds
    /// Nepali
    case nep
    /// Nepal Bhasa; Newari
    case new
    /// Nias
    case nia
    /// Niger-Kordofanian languages
    case nic
    /// Niuean
    case niu
    /// Norwegian Nynorsk; Nynorsk, Norwegian
    case nno
    /// Bokmål, Norwegian; Norwegian Bokmål
    case nob
    /// Nogai
    case nog
    /// Norse, Old
    case non
    /// Norwegian
    case nor
    /// N'Ko
    case nqo
    /// Pedi; Sepedi; Northern Sotho
    case nso
    /// Nubian languages
    case nub
    /// Classical Newari; Old Newari; Classical Nepal Bhasa
    case nwc
    /// Chichewa; Chewa; Nyanja
    case nya
    /// Nyamwezi
    case nym
    /// Nyankole
    case nyn
    /// Nyoro
    case nyo
    /// Nzima
    case nzi
    /// Occitan (post 1500); Provençal
    case oci
    /// Ojibwa
    case oji
    /// Oriya
    case ori
    /// Oromo
    case orm
    /// Osage
    case osa
    /// Ossetian; Ossetic
    case oss
    /// Turkish, Ottoman (1500–1928)
    case ota
    /// Otomian languages
    case oto
    /// Papuan languages
    case paa
    /// Pangasinan
    case pag
    /// Pahlavi
    case pal
    /// Pampanga; Kapampangan
    case pam
    /// Panjabi; Punjabi
    case pan
    /// Papiamento
    case pap
    /// Palauan
    case pau
    /// Persian, Old (ca. 600–400 B.C.)
    case peo
    /// Philippine languages
    case phi
    /// Phoenician
    case phn
    /// Pali
    case pli
    /// Polish
    case pol
    /// Pohnpeian
    case pon
    /// Portuguese
    case por
    /// Prakrit languages
    case pra
    /// Provençal, Old (to 1500); Old Occitan (to 1500)
    case pro
    /// Pushto; Pashto
    case pus
    /// Quechua
    case que
    /// Rajasthani
    case raj
    /// Rapanui
    case rap
    /// Rarotongan; Cook Islands Maori
    case rar
    /// Romance languages
    case roa
    /// Romansh
    case roh
    /// Romany
    case rom
    /// Romanian; Moldavian; Moldovan
    case ron
    /// Rundi
    case run
    /// Aromanian; Arumanian; Macedo-Romanian
    case rup
    /// Russian
    case rus
    /// Sandawe
    case sad
    /// Sango
    case sag
    /// Yakut
    case sah
    /// South American Indian (Other)
    case sai
    /// Salishan languages
    case sal
    /// Samaritan Aramaic
    case sam
    /// Sanskrit
    case san
    /// Sasak
    case sas
    /// Santali
    case sat
    /// Sicilian
    case scn
    /// Scots
    case sco
    /// Selkup
    case sel
    /// Semitic languages
    case sem
    /// Irish, Old (to 900)
    case sga
    /// Sign Languages
    case sgn
    /// Shan
    case shn
    /// Sidamo
    case sid
    /// Sinhala; Sinhalese
    case sin
    /// Siouan languages
    case sio
    /// Sino-Tibetan languages
    case sit
    /// Slavic languages
    case sla
    /// Slovak
    case slk
    /// Slovenian
    case slv
    /// Southern Sami
    case sma
    /// Northern Sami
    case sme
    /// Sami languages
    case smi
    /// Lule Sami
    case smj
    /// Inari Sami
    case smn
    /// Samoan
    case smo
    /// Skolt Sami
    case sms
    /// Shona
    case sna
    /// Sindhi
    case snd
    /// Soninke
    case snk
    /// Sogdian
    case sog
    /// Somali
    case som
    /// Songhai languages
    case son
    /// Sotho, Southern
    case sot
    /// Spanish; Castilian
    case spa
    /// Sardinian
    case srd
    /// Sranan Tongo
    case srn
    /// Serbian
    case srp
    /// Serer
    case srr
    /// Nilo-Saharan languages
    case ssa
    /// Swati
    case ssw
    /// Sukuma
    case suk
    /// Sundanese
    case sun
    /// Susu
    case sus
    /// Sumerian
    case sux
    /// Swahili
    case swa
    /// Swedish
    case swe
    /// Classical Syriac
    case syc
    /// Syriac
    case syr
    /// Tahitian
    case tah
    /// Tai languages
    case tai
    /// Tamil
    case tam
    /// Tatar
    case tat
    /// Telugu
    case tel
    /// Timne
    case tem
    /// Tereno
    case ter
    /// Tetum
    case tet
    /// Tajik
    case tgk
    /// Tagalog
    case tgl
    /// Thai
    case tha
    /// Tigre
    case tig
    /// Tigrinya
    case tir
    /// Tiv
    case tiv
    /// Tokelau
    case tkl
    /// Klingon; tlhIngan-Hol
    case tlh
    /// Tlingit
    case tli
    /// Tamashek
    case tmh
    /// Tonga, Nyasa
    case tog
    /// Tonga (Tonga Islands)
    case ton
    /// Tok Pisin
    case tpi
    /// Tsimshian
    case tsi
    /// Tswana
    case tsn
    /// Tsonga
    case tso
    /// Turkmen
    case tuk
    /// Tumbuka
    case tum
    /// Tupi languages
    case tup
    /// Turkish
    case tur
    /// Altaic languages
    case tut
    /// Tuvalu
    case tvl
    /// Twi
    case twi
    /// Tuvinian
    case tyv
    /// Udmurt
    case udm
    /// Ugaritic
    case uga
    /// Uighur; Uyghur
    case uig
    /// Ukrainian
    case ukr
    /// Umbundu
    case umb
    /// Undetermined
    case und
    /// Urdu
    case urd
    /// Uzbek
    case uzb
    /// Vai
    case vai
    /// Venda
    case ven
    /// Vietnamese
    case vie
    /// Volapük
    case vol
    /// Votic
    case vot
    /// Wakashan languages
    case wak
    /// Wolaitta; Wolaytta
    case wal
    /// Waray
    case war
    /// Washo
    case was
    /// Sorbian languages
    case wen
    /// Walloon
    case wln
    /// Wolof
    case wol
    /// Kalmyk; Oirat
    case xal
    /// Xhosa
    case xho
    /// Yao
    case yao
    /// Yapese
    case yap
    /// Yiddish
    case yid
    /// Yoruba
    case yor
    /// Yupik languages
    case ypk
    /// Zapotec
    case zap
    /// Blissymbols; Blissymbolics; Bliss
    case zbl
    /// Zenaga
    case zen
    /// Standard Moroccan Tamazight
    case zgh
    /// Zhuang; Chuang
    case zha
    /// Zande languages
    case znd
    /// Zulu
    case zul
    /// Zuni
    case zun
    /// No linguistic content; Not applicable
    case zxx
    /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
    case zza

    // // MARK: - Native Name
    public var nativeName: String {
        switch self {
            /// Afar
            case .aar: return "Qafaraf; ’Afar Af; Afaraf; Qafar af"
            /// Abkhazian
            case .abk: return "Аҧсуа бызшәа; Аҧсшәа"
            /// Achinese
            case .ace: return "بهسا اچيه"
            /// Acoli
            case .ach: return "Lwo"
            /// Adangme
            case .ada: return "Dangme"
            /// Adyghe; Adygei
            case .ady: return "Адыгабзэ; Кӏахыбзэ"
            /// Afrihili
            case .afh: return "El-Afrihili"
            /// Ainu
            case .ain: return "アイヌ・イタㇰ"
            /// Akkadian
            case .akk: return "𒀝𒅗𒁺𒌑"
            /// Albanian
            case .sqi: return "Shqip"
            /// Aleut
            case .ale: return "Уна́ӈам тунуу́; Унаӈан умсуу"
            /// Southern Altai
            case .alt: return "Алтай тили"
            /// Amharic
            case .amh: return "አማርኛ"
            /// English, Old (ca.450–1100)
            case .ang: return "Ænglisc; Anglisc; Englisc"
            /// Arabic
            case .ara: return "العَرَبِيَّة"
            /// Aragonese
            case .arg: return "aragonés"
            /// Armenian
            case .hye: return "Հայերէն; Հայերեն"
            /// Arapaho
            case .arp: return "Hinónoʼeitíít"
            /// Arawak
            case .arw: return "Lokono"
            /// Assamese
            case .asm: return "অসমীয়া"
            /// Asturian; Bable; Leonese; Asturleonese
            case .ast: return "Asturianu"
            /// Avaric
            case .ava: return "Магӏарул мацӏ; Авар мацӏ"
            /// Awadhi
            case .awa: return "अवधी"
            /// Aymara
            case .aym: return "Aymar aru"
            /// Azerbaijani
            case .aze: return "Azərbaycan dili; آذربایجان دیلی; Азәрбајҹан дили"
            /// Bamileke languages
            case .bai: return "Bamiléké"
            /// Bashkir
            case .bak: return "Башҡорт теле; Başqort tele"
            /// Baluchi
            case .bal: return "بلوچی"
            /// Bambara
            case .bam: return "ߓߊߡߊߣߊߣߞߊߣ"
            /// Balinese
            case .ban: return "ᬪᬵᬱᬩᬮᬶ; ᬩᬲᬩᬮᬶ"
            /// Basque
            case .eus: return "euskara"
            /// Basa
            case .bas: return "Mbene; Ɓasaá"
            /// Beja; Bedawiyet
            case .bej: return "Bidhaawyeet"
            /// Belarusian
            case .bel: return "Беларуская мова"
            /// Bemba
            case .bem: return "Chibemba"
            /// Bengali
            case .ben: return "বাংলা"
            /// Berber languages
            case .ber: return "Tamaziɣt; Tamazight; ⵜⴰⵎⴰⵣⵉⵖⵜ; ⵝⴰⵎⴰⵣⵉⵗⵝ; ⵜⴰⵎⴰⵣⵉⵗⵜ"
            /// Bhojpuri
            case .bho: return "भोजपुरी"
            /// Bini; Edo
            case .bin: return "Ẹ̀dó"
            /// Siksika
            case .bla: return "ᓱᖽᐧᖿ"
            /// Tibetan
            case .bod: return "བོད་སྐད་; ལྷ་སའི་སྐད་"
            /// Bosnian
            case .bos: return "bosanski; босански"
            /// Breton
            case .bre: return "Brezhoneg"
            /// Buriat
            case .bua: return "буряад хэлэн"
            /// Buginese
            case .bug: return "ᨅᨔ ᨕᨘᨁᨗ"
            /// Bulgarian
            case .bul: return "български език"
            /// Burmese
            case .mya: return "မြန်မာစာ; မြန်မာစကား"
            /// Blin; Bilin
            case .byn: return "ብሊና; ብሊን"
            /// Caddo
            case .cad: return "Hasí:nay"
            /// Galibi Carib
            case .car: return "Kari'nja"
            /// Catalan; Valencian
            case .cat: return "català"
            /// Cebuano
            case .ceb: return "Sinugbuanong Binisayâ"
            /// Czech
            case .ces: return "čeština; český jazyk"
            /// Chamorro
            case .cha: return "Finu' Chamoru"
            /// Chibcha
            case .chb: return "Muysccubun"
            /// Chechen
            case .che: return "Нохчийн мотт; نَاخچیین موٓتت; ნახჩიე მუოთთ"
            /// Chagatai
            case .chg: return "جغتای"
            /// Chinese
            case .zho: return "中文; 汉语; 漢語"
            /// Mari
            case .chm: return "марий йылме"
            /// Chinook jargon
            case .chn: return "chinuk wawa; wawa; chinook lelang; lelang"
            /// Choctaw
            case .cho: return "Chahta'"
            /// Chipewyan; Dene Suline
            case .chp: return "ᑌᓀᓱᒼᕄᓀ (Dënesųłiné)"
            /// Cherokee
            case .chr: return "ᏣᎳᎩ ᎦᏬᏂᎯᏍᏗ"
            /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
            case .chu: return "Славе́нскїй ѧ҆зы́къ"
            /// Chuvash
            case .chv: return "Чӑвашла"
            /// Cheyenne
            case .chy: return "Tsėhésenėstsestȯtse"
            /// Montenegrin
            case .cnr: return "crnogorski / црногорски"
            /// Coptic
            case .cop: return "ϯⲙⲉⲑⲣⲉⲙⲛ̀ⲭⲏⲙⲓ; ⲧⲙⲛ̄ⲧⲣⲙ̄ⲛ̄ⲕⲏⲙⲉ"
            /// Cornish
            case .cor: return "Kernowek"
            /// Corsican
            case .cos: return "Corsu; Lingua corsa"
            /// Crimean Tatar; Crimean Turkish
            case .crh: return "Къырымтатарджа; Къырымтатар тили; Ҡырымтатарҗа; Ҡырымтатар тили"
            /// Kashubian
            case .csb: return "Kaszëbsczi jãzëk"
            /// Welsh
            case .cym: return "Cymraeg; y Gymraeg"
            /// Dakota
            case .dak: return "Dakhótiyapi; Dakȟótiyapi"
            /// Danish
            case .dan: return "dansk"
            /// Dargwa
            case .dar: return "дарган мез"
            /// Slave (isoName: Athapascan)
            case .den: return "Dene K'e"
            /// German
            case .deu: return "Deutsch"
            /// Dogrib
            case .dgr: return "डोगरी; ڈوگرى"
            /// Dinka
            case .din: return "Thuɔŋjäŋ"
            /// Divehi; Dhivehi; Maldivian
            case .div: return "ދިވެހި; ދިވެހިބަސް"
            /// Dogri
            case .doi: return "डोगरी; ڈوگرى"
            /// Lower Sorbian
            case .dsb: return "Dolnoserbski; Dolnoserbšćina"
            /// Dutch; Flemish
            case .nld: return "Nederlands; Vlaams"
            /// Dyula
            case .dyu: return "Julakan"
            /// Dzongkha
            case .dzo: return "རྫོང་ཁ་"
            /// Egyptian (Ancient)
            case .egy: return "Egyptian (isAncient)"
            /// Greek, Modern (1453–)
            case .ell: return "Νέα Ελληνικά"
            /// Estonian
            case .est: return "eesti keel"
            /// Ewe
            case .ewe: return "Èʋegbe"
            /// Faroese
            case .fao: return "føroyskt"
            /// Persian
            case .fas: return "فارسی"
            /// Fanti
            case .fat: return "Mfantse; Fante; Fanti"
            /// Fijian
            case .fij: return "Na Vosa Vakaviti"
            /// Filipino; Pilipino
            case .fil: return "Wikang Filipino"
            /// Finnish
            case .fin: return "suomen kieli"
            /// Fon
            case .fon: return "Fon gbè"
            /// French
            case .fra: return "français"
            /// French, Middle (ca. 1400–1600)
            case .frm: return "françois; franceis"
            /// French, Old (842–ca. 1400)
            case .fro: return "Franceis; François; Romanz"
            /// Northern Frisian
            case .frr: return "Frasch; Fresk; Freesk; Friisk"
            /// Eastern Frisian
            case .frs: return "Seeltersk"
            /// Western Frisian
            case .fry: return "Frysk"
            /// Fulah
            case .ful: return "Fulfulde; Pulaar; Pular"
            /// Friulian
            case .fur: return "Furlan"
            /// Ga
            case .gaa: return "Gã"
            /// Gayo
            case .gay: return "Basa Gayo"
            /// Georgian
            case .kat: return "ქართული"
            /// Geez
            case .gez: return "ግዕዝ"
            /// Gilbertese
            case .gil: return "Taetae ni Kiribati"
            /// Gaelic; Scottish Gaelic
            case .gla: return "Gàidhlig"
            /// Irish
            case .gle: return "Gaeilge"
            /// Galician
            case .glg: return "galego"
            /// Manx
            case .glv: return "Gaelg; Gailck"
            /// German, Middle High (ca. 1050–1500)
            case .gmh: return "Diutsch"
            /// German, Old High (ca. 750–1050)
            case .goh: return "Diutisk"
            /// Gorontalo
            case .gor: return "Bahasa Hulontalo"
            /// Greek, Ancient (to 1453)
            case .grc: return "Ἑλληνική"
            /// Guarani
            case .grn: return "Avañe'ẽ"
            /// Swiss German; Alemannic; Alsatian
            case .gsw: return "Schwiizerdütsch"
            /// Gujarati
            case .guj: return "ગુજરાતી"
            /// Gwich'in
            case .gwi: return "Dinjii Zhu’ Ginjik"
            /// Haida
            case .hai: return "X̱aat Kíl; X̱aadas Kíl; X̱aayda Kil; Xaad kil"
            /// Haitian; Haitian Creole
            case .hat: return "kreyòl ayisyen"
            /// Hausa
            case .hau: return "Harshen Hausa; هَرْشَن"
            /// Hawaiian
            case .haw: return "ʻŌlelo Hawaiʻi"
            /// Hebrew
            case .heb: return "עברית"
            /// Herero
            case .her: return "Otjiherero"
            /// Hiligaynon
            case .hil: return "Ilonggo"
            /// Hindi
            case .hin: return "हिन्दी"
            /// Hittite
            case .hit: return "𒉈𒅆𒇷"
            /// Hmong; Mong
            case .hmn: return "lus Hmoob; lug Moob; lol Hmongb"
            /// Croatian
            case .hrv: return "hrvatski"
            /// Upper Sorbian
            case .hsb: return "hornjoserbšćina"
            /// Hungarian
            case .hun: return "magyar nyelv"
            /// Hupa
            case .hup: return "Na:tinixwe Mixine:whe'"
            /// Iban
            case .iba: return "Jaku Iban"
            /// Igbo
            case .ibo: return "Asụsụ Igbo"
            /// Icelandic
            case .isl: return "íslenska"
            /// Sichuan Yi; Nuosu
            case .iii: return "ꆈꌠꉙ"
            /// Ijo languages
            case .ijo: return "Ịjọ"
            /// Inuktitut
            case .iku: return "ᐃᓄᒃᑎᑐᑦ"
            /// Iloko
            case .ilo: return "Pagsasao nga Ilokano; Ilokano"
            /// Indonesian
            case .ind: return "bahasa Indonesia"
            /// Ingush
            case .inh: return "ГӀалгӀай мотт"
            /// Inupiaq
            case .ipk: return "Iñupiaq"
            /// Italian
            case .ita: return "italiano; lingua italiana"
            /// Javanese
            case .jav: return "ꦧꦱꦗꦮ"
            /// Lojban
            case .jbo: return "la .lojban."
            /// Japanese
            case .jpn: return "日本語"
            /// Judeo-Persian
            case .jpr: return "Dzhidi"
            /// Judeo-Arabic
            case .jrb: return "عربية يهودية / ערבית יהודית"
            /// Kara-Kalpak
            case .kaa: return "Qaraqalpaq tili; Қарақалпақ тили"
            /// Kabyle
            case .kab: return "Tamaziɣt Taqbaylit; Tazwawt"
            /// Kachin; Jingpho
            case .kac: return "Jingpho"
            /// Kannada
            case .kan: return "ಕನ್ನಡ"
            /// Kashmiri
            case .kas: return "कॉशुर / كأشُر"
            /// Kawi
            case .kaw: return "ꦧꦱꦗꦮ"
            /// Kazakh
            case .kaz: return "қазақ тілі / qazaq tili"
            /// Kabardian
            case .kbd: return "Адыгэбзэ (Къэбэрдейбзэ)"
            /// Khasi
            case .kha: return "কা কতিয়েন খাশি"
            /// Central Khmer
            case .khm: return "ភាសាខ្មែរ"
            /// Kikuyu; Gikuyu
            case .kik: return "Gĩkũyũ"
            /// Kirghiz; Kyrgyz
            case .kir: return "кыргызча; кыргыз тили"
            /// Konkani
            case .kok: return "कोंकणी"
            /// Komi
            case .kom: return "Коми кыв"
            /// Korean
            case .kor: return "한국어"
            /// Kpelle
            case .kpe: return "Kpɛlɛwoo"
            /// Karachay-Balkar
            case .krc: return "Къарачай-Малкъар тил; Таулу тил"
            /// Karelian
            case .krl: return "karjal; kariela; karjala"
            /// Kurukh
            case .kru: return "कुड़ुख़"
            /// Kumyk
            case .kum: return "къумукъ тил/qumuq til"
            /// Kurdish
            case .kur: return "Kurdî / کوردی"
            /// Ladino
            case .lad: return "Judeo-español"
            /// Lahnda
            case .lah: return "بھارت کا"
            /// Lao
            case .lao: return "ພາສາລາວ"
            /// Latin
            case .lat: return "Lingua latīna"
            /// Latvian
            case .lav: return "Latviešu valoda"
            /// Lezghian
            case .lez: return "Лезги чӏал"
            /// Limburgan; Limburger; Limburgish
            case .lim: return "Lèmburgs"
            /// Lithuanian
            case .lit: return "lietuvių kalba"
            /// Mongo
            case .lol: return "Lomongo"
            /// Luxembourgish; Letzeburgesch
            case .ltz: return "Lëtzebuergesch"
            /// Luba-Lulua
            case .lua: return "Tshiluba"
            /// Luba-Katanga
            case .lub: return "Kiluba"
            /// Ganda
            case .lug: return "Luganda"
            /// Luiseno
            case .lui: return "Cham'teela"
            /// Lunda
            case .lun: return "Chilunda"
            /// Luo (Kenya and Tanzania)
            case .luo: return "Dholuo"
            /// Lushai
            case .lus: return "Mizo ṭawng"
            /// Macedonian
            case .mkd: return "македонски јазик"
            /// Madurese
            case .mad: return "Madhura"
            /// Magahi
            case .mag: return "मगही"
            /// Marshallese
            case .mah: return "Kajin M̧ajeļ"
            /// Maithili
            case .mai: return "मैथिली; মৈথিলী"
            /// Makasar
            case .mak: return "Basa Mangkasara' / ᨅᨔ ᨆᨀᨔᨑ"
            /// Malayalam
            case .mal: return "മലയാളം"
            /// Mandingo
            case .man: return "Mandi'nka kango"
            /// Maori
            case .mri: return "Te Reo Māori"
            /// Marathi
            case .mar: return "मराठी"
            /// Masai
            case .mas: return "ɔl"
            /// Malay
            case .msa: return "Bahasa Melayu"
            /// Moksha
            case .mdf: return "мокшень кяль"
            /// Mende
            case .men: return "Mɛnde yia"
            /// Irish, Middle (900–1200)
            case .mga: return "Gaoidhealg"
            /// Mi'kmaq; Micmac
            case .mic: return "Míkmawísimk"
            /// Minangkabau
            case .min: return "Baso Minang"
            /// Maltese
            case .mlt: return "Malti"
            /// Manchu
            case .mnc: return "ᠮᠠᠨᠵᡠ ᡤᡳᠰᡠᠨ"
            /// Mohawk
            case .moh: return "Kanien’kéha"
            /// Mongolian
            case .mon: return "монгол хэл; ᠮᠣᠩᠭᠣᠯ ᠬᠡᠯᠡ"
            /// Mossi
            case .mos: return "Mooré"
            /// Creek
            case .mus: return "Mvskoke"
            /// Mirandese
            case .mwl: return "mirandés; lhéngua mirandesa"
            /// Marwari
            case .mwr: return "मारवाड़ी"
            /// Erzya
            case .myv: return "эрзянь кель"
            /// Neapolitan
            case .nap: return "napulitano"
            /// Nauru
            case .nau: return "dorerin Naoero"
            /// Navajo; Navaho
            case .nav: return "Diné bizaad; Naabeehó bizaad"
            /// Ndebele, South; South Ndebele
            case .nbl: return "isiNdebele seSewula"
            /// Ndebele, North; North Ndebele
            case .nde: return "siNdebele saseNyakatho"
            /// Ndonga
            case .ndo: return "ndonga"
            /// Low German; Low Saxon; German, Low; Saxon, Low
            case .nds: return "Plattdütsch; Plattdüütsch"
            /// Nepali
            case .nep: return "नेपाली भाषा"
            /// Nepal Bhasa; Newari
            case .new: return "नेपाल भाषा; नेवाः भाय्"
            /// Nias
            case .nia: return "Li Niha"
            /// Niuean
            case .niu: return "ko e vagahau Niuē"
            /// Norwegian Nynorsk; Nynorsk, Norwegian
            case .nno: return "nynorsk"
            /// Bokmål, Norwegian; Norwegian Bokmål
            case .nob: return "bokmål"
            /// Nogai
            case .nog: return "Ногай тили"
            /// Norse, Old
            case .non: return "Dǫnsk tunga; Norrœnt mál"
            /// Norwegian
            case .nor: return "norsk"
            /// Pedi; Sepedi; Northern Sotho
            case .nso: return "Sesotho sa Leboa"
            /// Nubian languages
            case .nub: return "لغات نوبية"
            /// Classical Newari; Old Newari; Classical Nepal Bhasa
            case .nwc: return "पुलां भाय्; पुलाङु नेपाल भाय्"
            /// Chichewa; Chewa; Nyanja
            case .nya: return "Chichewa; Chinyanja"
            /// Nyoro
            case .nyo: return "Runyoro"
            /// Occitan (post 1500); Provençal
            case .oci: return "occitan; lenga d'òc; provençal"
            /// Oriya
            case .ori: return "ଓଡ଼ିଆ"
            /// Oromo
            case .orm: return "Afaan Oromoo"
            /// Osage
            case .osa: return "Wazhazhe ie"
            /// Ossetian; Ossetic
            case .oss: return "Ирон æвзаг"
            /// Turkish, Ottoman (1500–1928)
            case .ota: return "لسان عثمانى / lisân-ı Osmânî"
            /// Pangasinan
            case .pag: return "Salitan Pangasinan"
            /// Pahlavi
            case .pal: return "Pārsīk; Pārsīg"
            /// Pampanga; Kapampangan
            case .pam: return "Amánung Kapampangan; Amánung Sísuan"
            /// Panjabi; Punjabi
            case .pan: return "ਪੰਜਾਬੀ / پنجابی"
            /// Papiamento
            case .pap: return "Papiamentu"
            /// Palauan
            case .pau: return "a tekoi er a Belau"
            /// Phoenician
            case .phn: return "𐤃𐤁𐤓𐤉𐤌 𐤊𐤍𐤏𐤍𐤉𐤌"
            /// Pali
            case .pli: return "Pāli"
            /// Polish
            case .pol: return "Język polski"
            /// Portuguese
            case .por: return "português"
            /// Pushto; Pashto
            case .pus: return "پښتو"
            /// Quechua
            case .que: return "Runa simi; kichwa simi; Nuna shimi"
            /// Rajasthani
            case .raj: return "राजस्थानी"
            /// Rapanui
            case .rap: return "Vananga rapa nui"
            /// Rarotongan; Cook Islands Maori
            case .rar: return "Māori Kūki 'Āirani"
            /// Romansh
            case .roh: return "Rumantsch; Rumàntsch; Romauntsch; Romontsch"
            /// Romany
            case .rom: return "romani čhib"
            /// Romanian; Moldavian; Moldovan
            case .ron: return "limba română"
            /// Rundi
            case .run: return "Ikirundi"
            /// Aromanian; Arumanian; Macedo-Romanian
            case .rup: return "armãneashce; armãneashti; rrãmãneshti"
            /// Russian
            case .rus: return "русский язык"
            /// Sandawe
            case .sad: return "Sandaweeki"
            /// Sango
            case .sag: return "yângâ tî sängö"
            /// Yakut
            case .sah: return "Сахалыы"
            /// Samaritan Aramaic
            case .sam: return "ארמית"
            /// Santali
            case .sat: return "ᱥᱟᱱᱛᱟᱲᱤ"
            /// Sicilian
            case .scn: return "Sicilianu"
            /// Scots
            case .sco: return "Braid Scots; Lallans"
            /// Irish, Old (to 900)
            case .sga: return "Goídelc"
            /// Shan
            case .shn: return "ၵႂၢမ်းတႆးယႂ်"
            /// Sidamo
            case .sid: return "Sidaamu Afoo"
            /// Sinhala; Sinhalese
            case .sin: return "සිංහල"
            /// Slovak
            case .slk: return "slovenčina; slovenský jazyk"
            /// Slovenian
            case .slv: return "slovenski jezik; slovenščina"
            /// Southern Sami
            case .sma: return "Åarjelsaemien gïele"
            /// Northern Sami
            case .sme: return "davvisámegiella"
            /// Lule Sami
            case .smj: return "julevsámegiella"
            /// Inari Sami
            case .smn: return "anarâškielâ"
            /// Samoan
            case .smo: return "Gagana faʻa Sāmoa"
            /// Skolt Sami
            case .sms: return "sääʹmǩiõll"
            /// Shona
            case .sna: return "chiShona"
            /// Sindhi
            case .snd: return "سنڌي / सिन्धी / ਸਿੰਧੀ"
            /// Soninke
            case .snk: return "Sooninkanxanne"
            /// Somali
            case .som: return "af Soomaali"
            /// Sotho, Southern
            case .sot: return "Sesotho [southern]"
            /// Spanish; Castilian
            case .spa: return "español; castellano"
            /// Sardinian
            case .srd: return "sardu; limba sarda; lingua sarda"
            /// Serbian
            case .srp: return "српски / srpski"
            /// Serer
            case .srr: return "Seereer"
            /// Swati
            case .ssw: return "siSwati"
            /// Sukuma
            case .suk: return "Kɪsukuma"
            /// Sundanese
            case .sun: return "ᮘᮞ ᮞᮥᮔ᮪ᮓ / Basa Sunda"
            /// Susu
            case .sus: return "Sosoxui"
            /// Sumerian
            case .sux: return "𒅴𒂠"
            /// Swahili
            case .swa: return "Kiswahili"
            /// Swedish
            case .swe: return "svenska"
            /// Syriac
            case .syr: return "ܠܫܢܐ ܣܘܪܝܝܐ"
            /// Tahitian
            case .tah: return "Reo Tahiti; Reo Mā'ohi"
            /// Tai languages
            case .tai: return "ภาษาไท; ภาษาไต"
            /// Tamil
            case .tam: return "தமிழ்"
            /// Tatar
            case .tat: return "татар теле / tatar tele / تاتار"
            /// Telugu
            case .tel: return "తెలుగు"
            /// Timne
            case .tem: return "KʌThemnɛ"
            /// Tereno
            case .ter: return "Terêna"
            /// Tetum
            case .tet: return "Lia-Tetun"
            /// Tajik
            case .tgk: return "тоҷикӣ / tojikī"
            /// Tagalog
            case .tgl: return "Wikang Tagalog"
            /// Thai
            case .tha: return "ภาษาไทย"
            /// Tigre
            case .tig: return "ትግረ; ትግሬ; ኻሳ; ትግራይት"
            /// Tigrinya
            case .tir: return "ትግርኛ"
            /// Tlingit
            case .tli: return "Lingít"
            /// Tonga, Nyasa
            case .tog: return "chiTonga"
            /// Tonga (Tonga Islands)
            case .ton: return "lea faka-Tonga"
            /// Tswana
            case .tsn: return "Setswana"
            /// Tsonga
            case .tso: return "Xitsonga"
            /// Turkmen
            case .tuk: return "Türkmençe / Түркменче / تورکمن تیلی تورکمنچ; türkmen dili / түркмен дили"
            /// Tumbuka
            case .tum: return "chiTumbuka"
            /// Turkish
            case .tur: return "Türkçe"
            /// Tuvalu
            case .tvl: return "Te Ggana Tuuvalu; Te Gagana Tuuvalu"
            /// Tuvinian
            case .tyv: return "тыва дыл"
            /// Udmurt
            case .udm: return "удмурт кыл"
            /// Uighur; Uyghur
            case .uig: return "ئۇيغۇرچە ; ئۇيغۇر تىلى"
            /// Ukrainian
            case .ukr: return "українська мова"
            /// Umbundu
            case .umb: return "Úmbúndú"
            /// Urdu
            case .urd: return "اُردُو"
            /// Uzbek
            case .uzb: return "Oʻzbekcha / ўзбекча / ئوزبېچه; oʻzbek tili / ўзбек тили / ئوبېک تیلی"
            /// Vai
            case .vai: return "ꕙꔤ"
            /// Venda
            case .ven: return "Tshivenḓa"
            /// Vietnamese
            case .vie: return "Tiếng Việt"
            /// Votic
            case .vot: return "vađđa ceeli"
            /// Waray
            case .war: return "Winaray; Samareño; Lineyte-Samarnon; Binisayâ nga Winaray; Binisayâ nga Samar-Leyte; “Binisayâ nga Waray”"
            /// Washo
            case .was: return "wá:šiw ʔítlu"
            /// Sorbian languages
            case .wen: return "Serbsce / Serbski"
            /// Walloon
            case .wln: return "Walon"
            /// Kalmyk; Oirat
            case .xal: return "Хальмг келн / Xaľmg keln"
            /// Xhosa
            case .xho: return "isiXhosa"
            /// Yiddish
            case .yid: return "ייִדיש; יידיש; אידיש"
            /// Yoruba
            case .yor: return "èdè Yorùbá"
            /// Zapotec
            case .zap: return "Diidxazá"
            /// Zenaga
            case .zen: return "Tuḍḍungiyya"
            /// Standard Moroccan Tamazight
            case .zgh: return "ⵜⴰⵎⴰⵣⵉⵖⵜ ⵜⴰⵏⴰⵡⴰⵢⵜ"
            /// Zhuang; Chuang
            case .zha: return "Vahcuengh / 話僮"
            /// Zulu
            case .zul: return "isiZulu"
            /// Zuni
            case .zun: return "Shiwi'ma"
            default: return self.isoName
        }
    }
    
    // // MARK: - Bibliographic Code
    public var isoBibliographicCode: String {
        switch self {
            /// Albanian
            case .sqi: return "alb"
            /// Armenian
            case .hye: return "arm"
            /// Basque
            case .eus: return "baq"
            /// Tibetan
            case .bod: return "tib"
            /// Burmese
            case .mya: return "bur"
            /// Czech
            case .ces: return "cze"
            /// Chinese
            case .zho: return "chi"
            /// Welsh
            case .cym: return "wel"
            /// German
            case .deu: return "ger"
            /// Dutch; Flemish
            case .nld: return "dut"
            /// Greek, Modern (1453–)
            case .ell: return "gre"
            /// Persian
            case .fas: return "per"
            /// French
            case .fra: return "fre"
            /// Georgian
            case .kat: return "geo"
            /// Icelandic
            case .isl: return "ice"
            /// Macedonian
            case .mkd: return "mac"
            /// Maori
            case .mri: return "mao"
            /// Malay
            case .msa: return "may"
            /// Romanian; Moldavian; Moldovan
            case .ron: return "rum"
            /// Slovak
            case .slk: return "slo"
            default: break
        }; return self.rawValue
    }
    
    // // MARK: - ISO Names
    var isoName: String {
        switch self {
            /// Afar
            case .aar: return "Afar"
            /// Abkhazian
            case .abk: return "Abkhazian"
            /// Achinese
            case .ace: return "Achinese"
            /// Acoli
            case .ach: return "Acoli"
            /// Adangme
            case .ada: return "Adangme"
            /// Adyghe; Adygei
            case .ady: return "Adyghe; Adygei"
            /// Afro-Asiatic languages
            case .afa: return "Afro-Asiatic languages"
            /// Afrihili
            case .afh: return "Afrihili"
            /// Afrikaans
            case .afr: return "Afrikaans"
            /// Ainu
            case .ain: return "Ainu"
            /// Akan
            case .aka: return "Akan"
            /// Akkadian
            case .akk: return "Akkadian"
            /// Albanian
            case .sqi: return "Albanian"
            /// Aleut
            case .ale: return "Aleut"
            /// Algonquian languages
            case .alg: return "Algonquian languages"
            /// Southern Altai
            case .alt: return "Southern Altai"
            /// Amharic
            case .amh: return "Amharic"
            /// English, Old (ca.450–1100)
            case .ang: return "English, Old (ca.450–1100)"
            /// Angika
            case .anp: return "Angika"
            /// Apache languages
            case .apa: return "Apache languages"
            /// Arabic
            case .ara: return "Arabic"
            /// Official Aramaic, (700–300 BCE); Imperial Aramaic, (700–300 BCE)
            case .arc: return "Official Aramaic, (700–300 BCE); Imperial Aramaic, (700–300 BCE)"
            /// Aragonese
            case .arg: return "Aragonese"
            /// Armenian
            case .hye: return "Armenian"
            /// Mapudungun; Mapuche
            case .arn: return "Mapudungun; Mapuche"
            /// Arapaho
            case .arp: return "Arapaho"
            /// Artificial languages
            case .art: return "Artificial languages"
            /// Arawak
            case .arw: return "Arawak"
            /// Assamese
            case .asm: return "Assamese"
            /// Asturian; Bable; Leonese; Asturleonese
            case .ast: return "Asturian; Bable; Leonese; Asturleonese"
            /// Athapascan languages
            case .ath: return "Athapascan languages"
            /// Australian languages
            case .aus: return "Australian languages"
            /// Avaric
            case .ava: return "Avaric"
            /// Avestan
            case .ave: return "Avestan"
            /// Awadhi
            case .awa: return "Awadhi"
            /// Aymara
            case .aym: return "Aymara"
            /// Azerbaijani
            case .aze: return "Azerbaijani"
            /// Banda languages
            case .bad: return "Banda languages"
            /// Bamileke languages
            case .bai: return "Bamileke languages"
            /// Bashkir
            case .bak: return "Bashkir"
            /// Baluchi
            case .bal: return "Baluchi"
            /// Bambara
            case .bam: return "Bambara"
            /// Balinese
            case .ban: return "Balinese"
            /// Basque
            case .eus: return "Basque"
            /// Basa
            case .bas: return "Basa"
            /// Baltic languages
            case .bat: return "Baltic languages"
            /// Beja; Bedawiyet
            case .bej: return "Beja; Bedawiyet"
            /// Belarusian
            case .bel: return "Belarusian"
            /// Bemba
            case .bem: return "Bemba"
            /// Bengali
            case .ben: return "Bengali"
            /// Berber languages
            case .ber: return "Berber languages"
            /// Bhojpuri
            case .bho: return "Bhojpuri"
            /// Bihari languages
            case .bih: return "Bihari languages"
            /// Bikol
            case .bik: return "Bikol"
            /// Bini; Edo
            case .bin: return "Bini; Edo"
            /// Bislama
            case .bis: return "Bislama"
            /// Siksika
            case .bla: return "Siksika"
            /// Bantu (Other)
            case .bnt: return "Bantu (Other)"
            /// Tibetan
            case .bod: return "Tibetan"
            /// Bosnian
            case .bos: return "Bosnian"
            /// Braj
            case .bra: return "Braj"
            /// Breton
            case .bre: return "Breton"
            /// Batak languages
            case .btk: return "Batak languages"
            /// Buriat
            case .bua: return "Buriat"
            /// Buginese
            case .bug: return "Buginese"
            /// Bulgarian
            case .bul: return "Bulgarian"
            /// Burmese
            case .mya: return "Burmese"
            /// Blin; Bilin
            case .byn: return "Blin; Bilin"
            /// Caddo
            case .cad: return "Caddo"
            /// Central American Indian languages
            case .cai: return "Central American Indian languages"
            /// Galibi Carib
            case .car: return "Galibi Carib"
            /// Catalan; Valencian
            case .cat: return "Catalan; Valencian"
            /// Caucasian languages
            case .cau: return "Caucasian languages"
            /// Cebuano
            case .ceb: return "Cebuano"
            /// Celtic languages
            case .cel: return "Celtic languages"
            /// Czech
            case .ces: return "Czech"
            /// Chamorro
            case .cha: return "Chamorro"
            /// Chibcha
            case .chb: return "Chibcha"
            /// Chechen
            case .che: return "Chechen"
            /// Chagatai
            case .chg: return "Chagatai"
            /// Chinese
            case .zho: return "Chinese"
            /// Chuukese
            case .chk: return "Chuukese"
            /// Mari
            case .chm: return "Mari"
            /// Chinook jargon
            case .chn: return "Chinook jargon"
            /// Choctaw
            case .cho: return "Choctaw"
            /// Chipewyan; Dene Suline
            case .chp: return "Chipewyan; Dene Suline"
            /// Cherokee
            case .chr: return "Cherokee"
            /// Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic
            case .chu: return "Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic"
            /// Chuvash
            case .chv: return "Chuvash"
            /// Cheyenne
            case .chy: return "Cheyenne"
            /// Chamic languages
            case .cmc: return "Chamic languages"
            /// Montenegrin
            case .cnr: return "Montenegrin"
            /// Coptic
            case .cop: return "Coptic"
            /// Cornish
            case .cor: return "Cornish"
            /// Corsican
            case .cos: return "Corsican"
            /// Creoles and pidgins, English based
            case .cpe: return "Creoles and pidgins, English based"
            /// Creoles and pidgins, French-based
            case .cpf: return "Creoles and pidgins, French-based"
            /// Creoles and pidgins, Portuguese-based
            case .cpp: return "Creoles and pidgins, Portuguese-based"
            /// Cree
            case .cre: return "Cree"
            /// Crimean Tatar; Crimean Turkish
            case .crh: return "Crimean Tatar; Crimean Turkish"
            /// Creoles and pidgins
            case .crp: return "Creoles and pidgins"
            /// Kashubian
            case .csb: return "Kashubian"
            /// Cushitic languages
            case .cus: return "Cushitic languages"
            /// Welsh
            case .cym: return "Welsh"
            /// Dakota
            case .dak: return "Dakota"
            /// Danish
            case .dan: return "Danish"
            /// Dargwa
            case .dar: return "Dargwa"
            /// Land Dayak languages
            case .day: return "Land Dayak languages"
            /// Delaware
            case .del: return "Delaware"
            /// Slave (isoName: Athapascan)
            case .den: return "Slave (isoName: Athapascan)"
            /// German
            case .deu: return "German"
            /// Dogrib
            case .dgr: return "Dogrib"
            /// Dinka
            case .din: return "Dinka"
            /// Divehi; Dhivehi; Maldivian
            case .div: return "Divehi; Dhivehi; Maldivian"
            /// Dogri
            case .doi: return "Dogri"
            /// Dravidian languages
            case .dra: return "Dravidian languages"
            /// Lower Sorbian
            case .dsb: return "Lower Sorbian"
            /// Duala
            case .dua: return "Duala"
            /// Dutch, Middle (ca. 1050–1350)
            case .dum: return "Dutch, Middle (ca. 1050–1350)"
            /// Dutch; Flemish
            case .nld: return "Dutch; Flemish"
            /// Dyula
            case .dyu: return "Dyula"
            /// Dzongkha
            case .dzo: return "Dzongkha"
            /// Efik
            case .efi: return "Efik"
            /// Egyptian (Ancient)
            case .egy: return "Egyptian (Ancient)"
            /// Ekajuk
            case .eka: return "Ekajuk"
            /// Greek, Modern (1453–)
            case .ell: return "Greek, Modern (1453–)"
            /// Elamite
            case .elx: return "Elamite"
            /// English
            case .eng: return "English"
            /// English, Middle (1100–1500)
            case .enm: return "English, Middle (1100–1500)"
            /// Esperanto
            case .epo: return "Esperanto"
            /// Estonian
            case .est: return "Estonian"
            /// Ewe
            case .ewe: return "Ewe"
            /// Ewondo
            case .ewo: return "Ewondo"
            /// Fang
            case .fan: return "Fang"
            /// Faroese
            case .fao: return "Faroese"
            /// Persian
            case .fas: return "Persian"
            /// Fanti
            case .fat: return "Fanti"
            /// Fijian
            case .fij: return "Fijian"
            /// Filipino; Pilipino
            case .fil: return "Filipino; Pilipino"
            /// Finnish
            case .fin: return "Finnish"
            /// Finno-Ugrian languages
            case .fiu: return "Finno-Ugrian languages"
            /// Fon
            case .fon: return "Fon"
            /// French
            case .fra: return "French"
            /// French, Middle (ca. 1400–1600)
            case .frm: return "French, Middle (ca. 1400–1600)"
            /// French, Old (842–ca. 1400)
            case .fro: return "French, Old (842–ca. 1400)"
            /// Northern Frisian
            case .frr: return "Northern Frisian"
            /// Eastern Frisian
            case .frs: return "Eastern Frisian"
            /// Western Frisian
            case .fry: return "Western Frisian"
            /// Fulah
            case .ful: return "Fulah"
            /// Friulian
            case .fur: return "Friulian"
            /// Ga
            case .gaa: return "Ga"
            /// Gayo
            case .gay: return "Gayo"
            /// Gbaya
            case .gba: return "Gbaya"
            /// Germanic languages
            case .gem: return "Germanic languages"
            /// Georgian
            case .kat: return "Georgian"
            /// Geez
            case .gez: return "Geez"
            /// Gilbertese
            case .gil: return "Gilbertese"
            /// Gaelic; Scottish Gaelic
            case .gla: return "Gaelic; Scottish Gaelic"
            /// Irish
            case .gle: return "Irish"
            /// Galician
            case .glg: return "Galician"
            /// Manx
            case .glv: return "Manx"
            /// German, Middle High (ca. 1050–1500)
            case .gmh: return "German, Middle High (ca. 1050–1500)"
            /// German, Old High (ca. 750–1050)
            case .goh: return "German, Old High (ca. 750–1050)"
            /// Gondi
            case .gon: return "Gondi"
            /// Gorontalo
            case .gor: return "Gorontalo"
            /// Gothic
            case .got: return "Gothic"
            /// Grebo
            case .grb: return "Grebo"
            /// Greek, Ancient (to 1453)
            case .grc: return "Greek, Ancient (to 1453)"
            /// Guarani
            case .grn: return "Guarani"
            /// Swiss German; Alemannic; Alsatian
            case .gsw: return "Swiss German; Alemannic; Alsatian"
            /// Gujarati
            case .guj: return "Gujarati"
            /// Gwich'in
            case .gwi: return "Gwich'in"
            /// Haida
            case .hai: return "Haida"
            /// Haitian; Haitian Creole
            case .hat: return "Haitian; Haitian Creole"
            /// Hausa
            case .hau: return "Hausa"
            /// Hawaiian
            case .haw: return "Hawaiian"
            /// Hebrew
            case .heb: return "Hebrew"
            /// Herero
            case .her: return "Herero"
            /// Hiligaynon
            case .hil: return "Hiligaynon"
            /// Himachali languages; Pahari languages
            case .him: return "Himachali languages; Pahari languages"
            /// Hindi
            case .hin: return "Hindi"
            /// Hittite
            case .hit: return "Hittite"
            /// Hmong; Mong
            case .hmn: return "Hmong; Mong"
            /// Hiri Motu
            case .hmo: return "Hiri Motu"
            /// Croatian
            case .hrv: return "Croatian"
            /// Upper Sorbian
            case .hsb: return "Upper Sorbian"
            /// Hungarian
            case .hun: return "Hungarian"
            /// Hupa
            case .hup: return "Hupa"
            /// Iban
            case .iba: return "Iban"
            /// Igbo
            case .ibo: return "Igbo"
            /// Icelandic
            case .isl: return "Icelandic"
            /// Ido
            case .ido: return "Ido"
            /// Sichuan Yi; Nuosu
            case .iii: return "Sichuan Yi; Nuosu"
            /// Ijo languages
            case .ijo: return "Ijo languages"
            /// Inuktitut
            case .iku: return "Inuktitut"
            /// Interlingue; Occidental
            case .ile: return "Interlingue; Occidental"
            /// Iloko
            case .ilo: return "Iloko"
            /// Interlingua (International Auxiliary Language Association)
            case .ina: return "Interlingua (International Auxiliary Language Association)"
            /// Indic languages
            case .inc: return "Indic languages"
            /// Indonesian
            case .ind: return "Indonesian"
            /// Indo-European languages
            case .ine: return "Indo-European languages"
            /// Ingush
            case .inh: return "Ingush"
            /// Inupiaq
            case .ipk: return "Inupiaq"
            /// Iranian languages
            case .ira: return "Iranian languages"
            /// Iroquoian languages
            case .iro: return "Iroquoian languages"
            /// Italian
            case .ita: return "Italian"
            /// Javanese
            case .jav: return "Javanese"
            /// Lojban
            case .jbo: return "Lojban"
            /// Japanese
            case .jpn: return "Japanese"
            /// Judeo-Persian
            case .jpr: return "Judeo-Persian"
            /// Judeo-Arabic
            case .jrb: return "Judeo-Arabic"
            /// Kara-Kalpak
            case .kaa: return "Kara-Kalpak"
            /// Kabyle
            case .kab: return "Kabyle"
            /// Kachin; Jingpho
            case .kac: return "Kachin; Jingpho"
            /// Kalaallisut; Greenlandic
            case .kal: return "Kalaallisut; Greenlandic"
            /// Kamba
            case .kam: return "Kamba"
            /// Kannada
            case .kan: return "Kannada"
            /// Karen languages
            case .kar: return "Karen languages"
            /// Kashmiri
            case .kas: return "Kashmiri"
            /// Kanuri
            case .kau: return "Kanuri"
            /// Kawi
            case .kaw: return "Kawi"
            /// Kazakh
            case .kaz: return "Kazakh"
            /// Kabardian
            case .kbd: return "Kabardian"
            /// Khasi
            case .kha: return "Khasi"
            /// Khoisan languages
            case .khi: return "Khoisan languages"
            /// Central Khmer
            case .khm: return "Central Khmer"
            /// Khotanese; Sakan
            case .kho: return "Khotanese; Sakan"
            /// Kikuyu; Gikuyu
            case .kik: return "Kikuyu; Gikuyu"
            /// Kinyarwanda
            case .kin: return "Kinyarwanda"
            /// Kirghiz; Kyrgyz
            case .kir: return "Kirghiz; Kyrgyz"
            /// Kimbundu
            case .kmb: return "Kimbundu"
            /// Konkani
            case .kok: return "Konkani"
            /// Komi
            case .kom: return "Komi"
            /// Kongo
            case .kon: return "Kongo"
            /// Korean
            case .kor: return "Korean"
            /// Kosraean
            case .kos: return "Kosraean"
            /// Kpelle
            case .kpe: return "Kpelle"
            /// Karachay-Balkar
            case .krc: return "Karachay-Balkar"
            /// Karelian
            case .krl: return "Karelian"
            /// Kru languages
            case .kro: return "Kru languages"
            /// Kurukh
            case .kru: return "Kurukh"
            /// Kuanyama; Kwanyama
            case .kua: return "Kuanyama; Kwanyama"
            /// Kumyk
            case .kum: return "Kumyk"
            /// Kurdish
            case .kur: return "Kurdish"
            /// Kutenai
            case .kut: return "Kutenai"
            /// Ladino
            case .lad: return "Ladino"
            /// Lahnda
            case .lah: return "Lahnda"
            /// Lamba
            case .lam: return "Lamba"
            /// Lao
            case .lao: return "Lao"
            /// Latin
            case .lat: return "Latin"
            /// Latvian
            case .lav: return "Latvian"
            /// Lezghian
            case .lez: return "Lezghian"
            /// Limburgan; Limburger; Limburgish
            case .lim: return "Limburgan; Limburger; Limburgish"
            /// Lingala
            case .lin: return "Lingala"
            /// Lithuanian
            case .lit: return "Lithuanian"
            /// Mongo
            case .lol: return "Mongo"
            /// Lozi
            case .loz: return "Lozi"
            /// Luxembourgish; Letzeburgesch
            case .ltz: return "Luxembourgish; Letzeburgesch"
            /// Luba-Lulua
            case .lua: return "Luba-Lulua"
            /// Luba-Katanga
            case .lub: return "Luba-Katanga"
            /// Ganda
            case .lug: return "Ganda"
            /// Luiseno
            case .lui: return "Luiseno"
            /// Lunda
            case .lun: return "Lunda"
            /// Luo (Kenya and Tanzania)
            case .luo: return "Luo (Kenya and Tanzania)"
            /// Lushai
            case .lus: return "Lushai"
            /// Macedonian
            case .mkd: return "Macedonian"
            /// Madurese
            case .mad: return "Madurese"
            /// Magahi
            case .mag: return "Magahi"
            /// Marshallese
            case .mah: return "Marshallese"
            /// Maithili
            case .mai: return "Maithili"
            /// Makasar
            case .mak: return "Makasar"
            /// Malayalam
            case .mal: return "Malayalam"
            /// Mandingo
            case .man: return "Mandingo"
            /// Maori
            case .mri: return "Maori"
            /// Austronesian languages
            case .map: return "Austronesian languages"
            /// Marathi
            case .mar: return "Marathi"
            /// Masai
            case .mas: return "Masai"
            /// Malay
            case .msa: return "Malay"
            /// Moksha
            case .mdf: return "Moksha"
            /// Mandar
            case .mdr: return "Mandar"
            /// Mende
            case .men: return "Mende"
            /// Irish, Middle (900–1200)
            case .mga: return "Irish, Middle (900–1200)"
            /// Mi'kmaq; Micmac
            case .mic: return "Mi'kmaq; Micmac"
            /// Minangkabau
            case .min: return "Minangkabau"
            /// Uncoded languages
            case .mis: return "Uncoded languages"
            /// Mon-Khmer languages
            case .mkh: return "Mon-Khmer languages"
            /// Malagasy
            case .mlg: return "Malagasy"
            /// Maltese
            case .mlt: return "Maltese"
            /// Manchu
            case .mnc: return "Manchu"
            /// Manipuri
            case .mni: return "Manipuri"
            /// Manobo languages
            case .mno: return "Manobo languages"
            /// Mohawk
            case .moh: return "Mohawk"
            /// Mongolian
            case .mon: return "Mongolian"
            /// Mossi
            case .mos: return "Mossi"
            /// Multiple languages
            case .mul: return "Multiple languages"
            /// Munda languages
            case .mun: return "Munda languages"
            /// Creek
            case .mus: return "Creek"
            /// Mirandese
            case .mwl: return "Mirandese"
            /// Marwari
            case .mwr: return "Marwari"
            /// Mayan languages
            case .myn: return "Mayan languages"
            /// Erzya
            case .myv: return "Erzya"
            /// Nahuatl languages
            case .nah: return "Nahuatl languages"
            /// North American Indian languages
            case .nai: return "North American Indian languages"
            /// Neapolitan
            case .nap: return "Neapolitan"
            /// Nauru
            case .nau: return "Nauru"
            /// Navajo; Navaho
            case .nav: return "Navajo; Navaho"
            /// Ndebele, South; South Ndebele
            case .nbl: return "Ndebele, South; South Ndebele"
            /// Ndebele, North; North Ndebele
            case .nde: return "Ndebele, North; North Ndebele"
            /// Ndonga
            case .ndo: return "Ndonga"
            /// Low German; Low Saxon; German, Low; Saxon, Low
            case .nds: return "Low German; Low Saxon; German, Low; Saxon, Low"
            /// Nepali
            case .nep: return "Nepali"
            /// Nepal Bhasa; Newari
            case .new: return "Nepal Bhasa; Newari"
            /// Nias
            case .nia: return "Nias"
            /// Niger-Kordofanian languages
            case .nic: return "Niger-Kordofanian languages"
            /// Niuean
            case .niu: return "Niuean"
            /// Norwegian Nynorsk; Nynorsk, Norwegian
            case .nno: return "Norwegian Nynorsk; Nynorsk, Norwegian"
            /// Bokmål, Norwegian; Norwegian Bokmål
            case .nob: return "Bokmål, Norwegian; Norwegian Bokmål"
            /// Nogai
            case .nog: return "Nogai"
            /// Norse, Old
            case .non: return "Norse, Old"
            /// Norwegian
            case .nor: return "Norwegian"
            /// N'Ko
            case .nqo: return "N'Ko"
            /// Pedi; Sepedi; Northern Sotho
            case .nso: return "Pedi; Sepedi; Northern Sotho"
            /// Nubian languages
            case .nub: return "Nubian languages"
            /// Classical Newari; Old Newari; Classical Nepal Bhasa
            case .nwc: return "Classical Newari; Old Newari; Classical Nepal Bhasa"
            /// Chichewa; Chewa; Nyanja
            case .nya: return "Chichewa; Chewa; Nyanja"
            /// Nyamwezi
            case .nym: return "Nyamwezi"
            /// Nyankole
            case .nyn: return "Nyankole"
            /// Nyoro
            case .nyo: return "Nyoro"
            /// Nzima
            case .nzi: return "Nzima"
            /// Occitan (post 1500); Provençal
            case .oci: return "Occitan (post 1500); Provençal"
            /// Ojibwa
            case .oji: return "Ojibwa"
            /// Oriya
            case .ori: return "Oriya"
            /// Oromo
            case .orm: return "Oromo"
            /// Osage
            case .osa: return "Osage"
            /// Ossetian; Ossetic
            case .oss: return "Ossetian; Ossetic"
            /// Turkish, Ottoman (1500–1928)
            case .ota: return "Turkish, Ottoman (1500–1928)"
            /// Otomian languages
            case .oto: return "Otomian languages"
            /// Papuan languages
            case .paa: return "Papuan languages"
            /// Pangasinan
            case .pag: return "Pangasinan"
            /// Pahlavi
            case .pal: return "Pahlavi"
            /// Pampanga; Kapampangan
            case .pam: return "Pampanga; Kapampangan"
            /// Panjabi; Punjabi
            case .pan: return "Panjabi; Punjabi"
            /// Papiamento
            case .pap: return "Papiamento"
            /// Palauan
            case .pau: return "Palauan"
            /// Persian, Old (ca. 600–400 B.C.)
            case .peo: return "Persian, Old (ca. 600–400 B.C.)"
            /// Philippine languages
            case .phi: return "Philippine languages"
            /// Phoenician
            case .phn: return "Phoenician"
            /// Pali
            case .pli: return "Pali"
            /// Polish
            case .pol: return "Polish"
            /// Pohnpeian
            case .pon: return "Pohnpeian"
            /// Portuguese
            case .por: return "Portuguese"
            /// Prakrit languages
            case .pra: return "Prakrit languages"
            /// Provençal, Old (to 1500); Old Occitan (to 1500)
            case .pro: return "Provençal, Old (to 1500); Old Occitan (to 1500)"
            /// Pushto; Pashto
            case .pus: return "Pushto; Pashto"
            /// Quechua
            case .que: return "Quechua"
            /// Rajasthani
            case .raj: return "Rajasthani"
            /// Rapanui
            case .rap: return "Rapanui"
            /// Rarotongan; Cook Islands Maori
            case .rar: return "Rarotongan; Cook Islands Maori"
            /// Romance languages
            case .roa: return "Romance languages"
            /// Romansh
            case .roh: return "Romansh"
            /// Romany
            case .rom: return "Romany"
            /// Romanian; Moldavian; Moldovan
            case .ron: return "Romanian; Moldavian; Moldovan"
            /// Rundi
            case .run: return "Rundi"
            /// Aromanian; Arumanian; Macedo-Romanian
            case .rup: return "Aromanian; Arumanian; Macedo-Romanian"
            /// Russian
            case .rus: return "Russian"
            /// Sandawe
            case .sad: return "Sandawe"
            /// Sango
            case .sag: return "Sango"
            /// Yakut
            case .sah: return "Yakut"
            /// South American Indian (Other)
            case .sai: return "South American Indian (Other)"
            /// Salishan languages
            case .sal: return "Salishan languages"
            /// Samaritan Aramaic
            case .sam: return "Samaritan Aramaic"
            /// Sanskrit
            case .san: return "Sanskrit"
            /// Sasak
            case .sas: return "Sasak"
            /// Santali
            case .sat: return "Santali"
            /// Sicilian
            case .scn: return "Sicilian"
            /// Scots
            case .sco: return "Scots"
            /// Selkup
            case .sel: return "Selkup"
            /// Semitic languages
            case .sem: return "Semitic languages"
            /// Irish, Old (to 900)
            case .sga: return "Irish, Old (to 900)"
            /// Sign Languages
            case .sgn: return "Sign Languages"
            /// Shan
            case .shn: return "Shan"
            /// Sidamo
            case .sid: return "Sidamo"
            /// Sinhala; Sinhalese
            case .sin: return "Sinhala; Sinhalese"
            /// Siouan languages
            case .sio: return "Siouan languages"
            /// Sino-Tibetan languages
            case .sit: return "Sino-Tibetan languages"
            /// Slavic languages
            case .sla: return "Slavic languages"
            /// Slovak
            case .slk: return "Slovak"
            /// Slovenian
            case .slv: return "Slovenian"
            /// Southern Sami
            case .sma: return "Southern Sami"
            /// Northern Sami
            case .sme: return "Northern Sami"
            /// Sami languages
            case .smi: return "Sami languages"
            /// Lule Sami
            case .smj: return "Lule Sami"
            /// Inari Sami
            case .smn: return "Inari Sami"
            /// Samoan
            case .smo: return "Samoan"
            /// Skolt Sami
            case .sms: return "Skolt Sami"
            /// Shona
            case .sna: return "Shona"
            /// Sindhi
            case .snd: return "Sindhi"
            /// Soninke
            case .snk: return "Soninke"
            /// Sogdian
            case .sog: return "Sogdian"
            /// Somali
            case .som: return "Somali"
            /// Songhai languages
            case .son: return "Songhai languages"
            /// Sotho, Southern
            case .sot: return "Sotho, Southern"
            /// Spanish; Castilian
            case .spa: return "Spanish; Castilian"
            /// Sardinian
            case .srd: return "Sardinian"
            /// Sranan Tongo
            case .srn: return "Sranan Tongo"
            /// Serbian
            case .srp: return "Serbian"
            /// Serer
            case .srr: return "Serer"
            /// Nilo-Saharan languages
            case .ssa: return "Nilo-Saharan languages"
            /// Swati
            case .ssw: return "Swati"
            /// Sukuma
            case .suk: return "Sukuma"
            /// Sundanese
            case .sun: return "Sundanese"
            /// Susu
            case .sus: return "Susu"
            /// Sumerian
            case .sux: return "Sumerian"
            /// Swahili
            case .swa: return "Swahili"
            /// Swedish
            case .swe: return "Swedish"
            /// Classical Syriac
            case .syc: return "Classical Syriac"
            /// Syriac
            case .syr: return "Syriac"
            /// Tahitian
            case .tah: return "Tahitian"
            /// Tai languages
            case .tai: return "Tai languages"
            /// Tamil
            case .tam: return "Tamil"
            /// Tatar
            case .tat: return "Tatar"
            /// Telugu
            case .tel: return "Telugu"
            /// Timne
            case .tem: return "Timne"
            /// Tereno
            case .ter: return "Tereno"
            /// Tetum
            case .tet: return "Tetum"
            /// Tajik
            case .tgk: return "Tajik"
            /// Tagalog
            case .tgl: return "Tagalog"
            /// Thai
            case .tha: return "Thai"
            /// Tigre
            case .tig: return "Tigre"
            /// Tigrinya
            case .tir: return "Tigrinya"
            /// Tiv
            case .tiv: return "Tiv"
            /// Tokelau
            case .tkl: return "Tokelau"
            /// Klingon; tlhIngan-Hol
            case .tlh: return "Klingon; tlhIngan-Hol"
            /// Tlingit
            case .tli: return "Tlingit"
            /// Tamashek
            case .tmh: return "Tamashek"
            /// Tonga, Nyasa
            case .tog: return "Tonga, Nyasa"
            /// Tonga (Tonga Islands)
            case .ton: return "Tonga (Tonga Islands)"
            /// Tok Pisin
            case .tpi: return "Tok Pisin"
            /// Tsimshian
            case .tsi: return "Tsimshian"
            /// Tswana
            case .tsn: return "Tswana"
            /// Tsonga
            case .tso: return "Tsonga"
            /// Turkmen
            case .tuk: return "Turkmen"
            /// Tumbuka
            case .tum: return "Tumbuka"
            /// Tupi languages
            case .tup: return "Tupi languages"
            /// Turkish
            case .tur: return "Turkish"
            /// Altaic languages
            case .tut: return "Altaic languages"
            /// Tuvalu
            case .tvl: return "Tuvalu"
            /// Twi
            case .twi: return "Twi"
            /// Tuvinian
            case .tyv: return "Tuvinian"
            /// Udmurt
            case .udm: return "Udmurt"
            /// Ugaritic
            case .uga: return "Ugaritic"
            /// Uighur; Uyghur
            case .uig: return "Uighur; Uyghur"
            /// Ukrainian
            case .ukr: return "Ukrainian"
            /// Umbundu
            case .umb: return "Umbundu"
            /// Undetermined
            case .und: return "Undetermined"
            /// Urdu
            case .urd: return "Urdu"
            /// Uzbek
            case .uzb: return "Uzbek"
            /// Vai
            case .vai: return "Vai"
            /// Venda
            case .ven: return "Venda"
            /// Vietnamese
            case .vie: return "Vietnamese"
            /// Volapük
            case .vol: return "Volapük"
            /// Votic
            case .vot: return "Votic"
            /// Wakashan languages
            case .wak: return "Wakashan languages"
            /// Wolaitta; Wolaytta
            case .wal: return "Wolaitta; Wolaytta"
            /// Waray
            case .war: return "Waray"
            /// Washo
            case .was: return "Washo"
            /// Sorbian languages
            case .wen: return "Sorbian languages"
            /// Walloon
            case .wln: return "Walloon"
            /// Wolof
            case .wol: return "Wolof"
            /// Kalmyk; Oirat
            case .xal: return "Kalmyk; Oirat"
            /// Xhosa
            case .xho: return "Xhosa"
            /// Yao
            case .yao: return "Yao"
            /// Yapese
            case .yap: return "Yapese"
            /// Yiddish
            case .yid: return "Yiddish"
            /// Yoruba
            case .yor: return "Yoruba"
            /// Yupik languages
            case .ypk: return "Yupik languages"
            /// Zapotec
            case .zap: return "Zapotec"
            /// Blissymbols; Blissymbolics; Bliss
            case .zbl: return "Blissymbols; Blissymbolics; Bliss"
            /// Zenaga
            case .zen: return "Zenaga"
            /// Standard Moroccan Tamazight
            case .zgh: return "Standard Moroccan Tamazight"
            /// Zhuang; Chuang
            case .zha: return "Zhuang; Chuang"
            /// Zande languages
            case .znd: return "Zande languages"
            /// Zulu
            case .zul: return "Zulu"
            /// Zuni
            case .zun: return "Zuni"
            /// No linguistic content; Not applicable
            case .zxx: return "No linguistic content; Not applicable"
            /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
            case .zza: return "Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki"
        }
    }
}