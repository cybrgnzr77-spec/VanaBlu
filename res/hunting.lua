--[[
* VanaBlu Spell Tracker database (generated - do not edit by hand)
*
* Server : VanaDreams (LandSandBoat based)
* Built  : 2026-11-18
* Sources:
*   - VanaDreams live-server BLU mapping extract (2026-11-13): which enemy moves teach each spell
*     and which monster skill lists contain them.
*   - LandSandBoat repository (commit f07e73a8): skill-list ids, monster templates,
*     spawn zones, levels, positions, spawn types, move-script conditions, skill caps, stat bonuses.
*   - BG-Wiki / FFXIclopedia (retail) for spells whose VanaDreams skill lists are not public.
*
* Mob fields: conf = (default "verified": server skill list -> LSB spawn data) or "wiki" (retail wiki location)
*             "unverified" (only a name match to a VanaDreams-only skill list).
*             pts = flat list of representative spawn positions {x1, y1, x2, y2, ...} in game
*             coordinates (x = east, y = north), used for the in-zone distance/direction hint.
* status   : "ok" | "odyssey" (Sheol Gaol only) | "unavailable" (cannot currently be learned)
--]]
return {
    _meta = { built = "2026-11-18", lsb_commit = "f07e73a8", mapping = "VanaDreams 2026-11-13", spells = 196 },
    [513] = {
        name = "Venom Shell", level = 42, element = 5, skill = 100,
        family = "Uragnite", stats = "MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 40, zone = "Dynamis - Buburimu", kind = "Dynamis", mobs = {
                { name = "Nightmare Uragnite", level = "78-96", pts = { -222,-314,-239,-279,425,151,420,84 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Melo Melo", level = "100", nm = true, tags = { "NM" }, pts = { -55,-340 } },
            } },
        },
    },
    [515] = {
        name = "Maelstrom", level = 61, element = 5, skill = 178,
        family = "Sea Monk", stats = "MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Sea Monk", level = "32-35", pts = { -62,40,89,17,-57,-41,-20,192 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Sea Bonze", level = "47-50", pts = { 253,151,309,26,299,205 } },
                { name = "Devil Manta", level = "66-69", pts = { -218,-245,-187,-214,-229,-214,-298,-273 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Flying Manta", level = "55-59", pts = { 59,-36,120,-20,-43,-60,-100,-19 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Jasconius", level = "79-80", pts = { 139,273,189,266,192,242,143,208 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Nostokulshedra", level = "88-89", pts = { 253,383,339,308,344,355 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Lyngbakr", level = "119-122", pts = { 420,254,368,227 } },
            } },
        },
    },
    [517] = {
        name = "Metallic Body", level = 8, element = 15, skill = 0,
        family = "Crab", stats = "None", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "River Crab", level = "2-5", pts = { 320,230,-28,500 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "River Crab", level = "2-3", pts = { 74,-428,-326,-405 } },
            } },
            { id = 172, zone = "Zeruhn Mines", kind = nil, mobs = {
                { name = "River Crab", level = "2-4", pts = { -31,74,-27,50,-10,73,-10,50 } },
                { name = "Soot Crab", level = "76-78", pts = { -22,-294,-64,-325 } },
            } },
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "River Crab", level = "3-6", pts = { 72,-143,232,-102,466,-139,347,-120 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "River Crab", level = "5-6", pts = { -383,-450 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Wadi Crab", level = "7-9", pts = { -172,-141,-227,-139,-324,-159,-374,-159 } },
                { name = "Trimmer", level = "90-92", pts = { -75,495,-214,564,-250,544,-188,518 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "River Crab", level = "11-14", pts = { 111,186,211,174,254,130,385,88 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Snipper", level = "17-20", pts = { -83,601 } },
                { name = "Clipper", level = "26-29", pts = { -99,281 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Snipper", level = "19-20", pts = { -496,301,-84,352,91,413,109,152 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Snipper", level = "19-23", pts = { 459,385,-404,-330,-418,-243,167,-322 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "River Crab", level = "22-25", pts = { 70,-440,111,-463,-277,-455,-344,-442 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Clipper", level = "24-25", pts = { 255,191,165,-401 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Clipper", level = "24-25", pts = { 250,-264,-532,-180,-647,-154,-727,-424 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Clipper", level = "28-29", pts = { 96,22,11,-74,25,-21,139,77 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Clipper", level = "29-32", pts = { -189,-8,89,17,-31,-33,-92,-34 } },
                { name = "Lacerator", level = "87-89", pts = { -337,178,-301,198,-369,271,-388,207 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, mobs = {
                { name = "Cutter", level = "30-32", pts = { -223,130,59,-132,97,-177 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Clipper", level = "32-35", pts = { 283,90,254,155,197,204,167,231 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Crimson Knight Crab", level = "33-36", pts = { -12,-293 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Crimson Knight Crab", level = "33-36", pts = { 698,-500 } },
                { name = "Bigclaw", level = "45-49", pts = { 255,353,262,381,178,497,49,544 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Ironshell", level = "37-40", pts = { 6,256,-14,289,-34,297,-29,330 } },
                { name = "Robber Crab", level = "62-67", pts = { 2,-125,-1,-205,-62,-168,-139,-241 } },
                { name = "Greatclaw", level = "66-69", pts = { 104,-28,122,-116,152,-127,101,-182 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Snipper", level = "38-41", pts = { 155,196,164,84,178,-115,85,142 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Clipper", level = "43-45", pts = { -716,-391,-725,-459 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Scavenger Crab", level = "60-62", pts = { -319,-22 } },
                { name = "Plunderer Crab", level = "95-97", pts = { -181,-100,-176,-140,-62,-182,99,-180 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Robber Crab", level = "62-66", pts = { 179,-24,185,-63,57,96,22,44 } },
                { name = "Steelshell", level = "73-76", pts = { -84,-58,-167,-104,22,-30,56,-70 } },
                { name = "Viseclaw", level = "102-103", pts = { -184,-279,-242,-276 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Robber Crab", level = "62-64", pts = { -270,-208,-230,-211,-178,-209,-124,-340 } },
                { name = "Duriumshell", level = "92-94", pts = { -56,247,-34,273,-7,248,-4,266 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Robber Crab", level = "64-67", pts = { -59,-52,28,-86,69,-135,88,-178 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Robber Crab", level = "65-68", pts = { -78,-50,-138,-17,-42,-20,0,41 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Wootzshell", level = "70-71", pts = { 304,-346,284,-334,351,-333,232,-283 } },
                { name = "Orichalcumshell", level = "88-89", pts = { -679,-127,-643,-132,-625,-78,-598,-85 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Nipper", level = "72-73", pts = { 370,92,413,62,403,57,380,228 } },
                { name = "Dweomershell", level = "88-90", pts = { -423,230,-396,181,-355,216,-297,180 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Nipper M", level = "77-78", pts = { 13,-431,20,-396,-192,-371,-210,-404 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Glen Crab", level = "81-82", pts = { -86,-338,-17,-336,-69,-277,-15,-270 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Gasher", level = "81-82", pts = { 232,473,212,483,194,510,174,519 } },
                { name = "Slasher", level = "81-82", pts = { 87,530,50,526,59,551,10,573 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Depthswalker Crab", level = "99-107", pts = { -173,19,-133,21,-103,20,-220,23 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Perfidious Crab", level = "102-110", pts = { 397,82,403,53,489,153,511,158 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Rancidclaw Crab", level = "120-123", pts = { 444,-288,413,-302,316,-366,480,-439 } },
                { name = "Apex Crab", level = "128-130", pts = { -60,118,-83,-48,-95,-83,12,-87 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Locus Ghost Crab", level = "137-139", pts = { 269,573,291,595,338,308,324,253 } },
            } },
        },
    },
    [519] = {
        name = "Screwdriver", level = 26, element = 15, skill = 52,
        family = "Pugil", stats = "VIT+1, CHR+1, HP+10", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 145, zone = "Giddeus", kind = nil, mobs = {
                { name = "Giddeus Pugil", level = "2-5", pts = { -169,320,-170,152,-46,161 } },
                { name = "Giant Pugil", level = "8-11", pts = { -149,-123 } },
            } },
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Ghelsba Pugil", level = "3-6", pts = { -229,220,-57,187,90,122,109,334 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Pugil", level = "14-17", pts = { 156,179,231,148,253,372,420,117 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Land Pugil", level = "17-19", pts = { -308,610,-337,510 } },
                { name = "Fosse Pugil", level = "22-24", pts = { -186,82,-149,18,-180,-132,-223,-279 } },
                { name = "Spinous Pugil", level = "29-31", pts = { 100,-414,214,-500,214,-555 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Land Pugil", level = "19-20", pts = { -496,301,-84,352,91,413,109,152 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Sand Pugil", level = "19-20", pts = { -470,384 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Land Pugil", level = "19-20", pts = { -418,-243,167,-322,225,150,-411,488 } },
            } },
            { id = 147, zone = "Beadeaux", kind = nil, mobs = {
                { name = "Land Pugil", level = "20-23", pts = { -204,86,-156,58,-168,135,-127,118 } },
                { name = "Big Jaw", level = "37-39", pts = { 193,22,219,89,93,-14,65,77 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Davoi Pugil", level = "26-29", pts = { 57,32,71,-90,100,-143,174,-331 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Makara", level = "35-38", pts = { -443,-418,-320,-421,-348,-343,-455,-350 } },
            } },
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Big Jaw", level = "37-39", pts = { 220,-236,183,-219,150,-176 } },
                { name = "Makara", level = "44-47", pts = { 56,108,115,103,106,258,75,260 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Land Pugil", level = "38-41", pts = { 160,177,206,-23,199,-75,160,-159 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Big Jaw", level = "43-47", pts = { 223,60,279,-505,351,-522,321,-521 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Grotto Pugil", level = "44-47", pts = { 216,52,330,-104,362,-59,296,5 } },
                { name = "Razorjaw Pugil", level = "57-60", pts = { -234,19,-267,-51,-244,-63,-266,-105 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Makara", level = "46-49", pts = { -70,-211,-10,-110,51,-90,170,-90 } },
                { name = "Demonic Pugil", level = "73-76", pts = { 157,47,191,84,200,118,-191,91 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Makara", level = "46-49", pts = { 262,381,178,497,49,544,1,585 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Makara", level = "49-52", pts = { -180,146,-67,146,-34,81,-198,38 } },
                { name = "Stygian Pugil", level = "63-65", pts = { -309,10,-309,-50,220,-126 } },
                { name = "Blackwater Pugil", level = "96-97", pts = { -126,-102,-34,-146,29,-150,30,-208 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Immolatory Pugil", level = "64", pts = { 66,-122,69,-163 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Stygian Pugil", level = "64-66", pts = { -230,-211,-140,-203,-128,-265,-124,-340 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Terror Pugil", level = "66-70", pts = { 88,-178,69,-135,123,-136 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "La Vaule Pugil", level = "72-75", pts = { 53,45,57,-9,57,-79,86,-109 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Demonic Pugil", level = "73-76", pts = { 122,-80,155,-98,158,-121 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Blademaw Pugil", level = "79-80", pts = { 326,420,381,424,379,385,344,372 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Peak Pugil", level = "81-82", pts = { 112,-360,168,-363,109,-287,183,-288 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Waterway Pugil", level = "99-107", pts = { -479,-284,202,-283,-538,-300,-459,-218 } },
            } },
        },
    },
    [521] = {
        name = "MP Drainkiss", level = 42, element = 7, skill = 100,
        family = "Leech", stats = "MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Poison Leech", level = "21-24", pts = { -63,-241,-223,-285,388,128 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Forest Leech", level = "21-22", pts = { -358,-338,-233,-203,-236,-107,-308,46 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Thread Leech", level = "22-25", pts = { 322,82,162,167,289,-40,-106,185 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Poison Leech", level = "24-28", pts = { 68,127,183,-172,146,-187,279,-229 } },
                { name = "Bleeder Leech", level = "83-85", pts = { 87,78,83,39,117,71,137,16 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Poison Leech", level = "25-26", pts = { 241,-243,-559,-202,-616,-144,-694,-388 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Thread Leech", level = "28-31", pts = { 239,78,172,83,113,79,58,75 } },
                { name = "Spool Leech", level = "89-91", pts = { -301,198,-337,234,-369,271,-431,306 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Acrophies", level = "33-36", pts = { 70,24 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Acrophies", level = "33-34", pts = { -271,34,-192,72,-204,225,-129,256 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Royal Leech", level = "35-38", pts = { 221,293,175,248,96,254,136,212 } },
                { name = "Sahagin Parasite", level = "50-53", pts = { 11,21,-23,12,-10,-21,-52,-30 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Royal Leech", level = "35-37", pts = { -318,-569,-281,-565,-342,-606,-232,-613 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Forest Leech", level = "38-41", pts = { 46,22,-10,56,-110,102,-143,101 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Goobbue Parasite", level = "42-45", pts = { -225,-383,-21,-423,18,-334,424,-306 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Poison Leech", level = "44-47", pts = { 450,-108,352,-147,268,-228,275,-287 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, mobs = {
                { name = "Yagudo Parasite", level = "45-48", pts = { -81,-80 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Yagudo Parasite", level = "45-47", pts = { -80,-76 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Labyrinth Leech", level = "45-48", pts = { -84,-176,-30,-162,-6,-134,118,-40 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Labyrinth Leech", level = "45-48", pts = { -19,-209,-2,-157 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Obdella", level = "50-59", pts = { -407,-139,-442,-113,-432,-75 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Caedarva Leech", level = "63-65", pts = { 81,-629,210,-659,207,-596,118,-546 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Bouncing Ball", level = "64-67", pts = { -140,20,161,-108 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Phlebotomic Slug", level = "67-70", pts = { -300,42,-238,-60,-162,-61,-98,-114 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Red Kisser", level = "68-69", pts = { 182,361 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Red Kisser", level = "68-71", pts = { 180,279,257,123,-241,-408,-220,-403 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Volcanic Leech", level = "72-75", pts = { 108,-14,45,24,12,96,-4,120 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Ashakku", level = "73-74", pts = { 17,204,-10,113,-54,258,-78,225 } },
                { name = "Nirgali", level = "87-89", pts = { -571,-74,-580,-14,-533,-4,-541,44 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Blood Ball", level = "75-78", pts = { -110,-57,-143,-56,-143,-98 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Gneiss Leech", level = "79-80", pts = { -220,579,-156,578 } },
            } },
            { id = 172, zone = "Zeruhn Mines", kind = nil, mobs = {
                { name = "Veindigger Leech", level = "79-80", pts = { 130,-195 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Couloir Leech", level = "87-88", pts = { -120,221,-110,278,-83,260,-419,122 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Bilis Leech", level = "87-88", pts = { -134,-38,-163,-73,-124,-80,-219,-101 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Duskjaw Obdella", level = "99-107", pts = { -21,21,139,20,221,-60,165,-159 } },
                { name = "Weatherworn Leech", level = "99-107", pts = { -21,21,139,20,221,-60,300,-221 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Loathsome Obdella", level = "99-107", pts = { -162,-162,-220,-310,-316,-336,-140,-197 } },
                { name = "Loathsome Leech", level = "102-103", pts = { -316,-336 } },
                { name = "Quiescent Leech", level = "119-121", pts = { 340,484,409,520,429,528,420,497 } },
                { name = "Apex Leech", level = "125-127", pts = { -34,-192,-1,-200,99,-221,138,-287 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Writhing Obdella", level = "101-110", pts = { 219,-249 } },
                { name = "Thirsting Obdella", level = "102-110", pts = { 297,-286 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Tenebrous Obdella", level = "102-106", pts = { -104,-259,-285,354,-5,418,363,439 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Shrouded Obdella", level = "102-103", pts = { -437,76,-439,104,-366,115,-410,100 } },
                { name = "Vampire Leech", level = "102-103", pts = { -168,-150,-248,-192,-199,-124,-277,-162 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Obfuscous Obdella", level = "113-116", pts = { -436,-418,-483,-414,-456,-376,-487,-348 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Fleshrending Obdella", level = "120-123", pts = { 235,-419,240,-427,402,-490,393,-508 } },
            } },
        },
    },
    [522] = {
        name = "Death Ray", level = 34, element = 7, skill = 76,
        family = "Hecteyes", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Hecteyes", level = "31-34", pts = { 137,-62 } },
                { name = "Taisai", level = "35-38", pts = { -34,-106 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Hecteyes", level = "35-39", pts = { -144,-181,-118,-144,3,-152,-18,-221 } },
            } },
            { id = 195, zone = "The Eldieme Necropolis", kind = nil, mobs = {
                { name = "Gazer", level = "41-43", pts = { -236,129,-223,65,-657,176 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Gazer", level = "42-46", pts = { -175,-19,-146,-20,-142,21,-64,189 } },
                { name = "Blubber Eyes", level = "53-58", pts = { 310,-91,312,-112,291,-112,291,-90 } },
                { name = "Thousand Eyes", level = "64-68", pts = { 96,-383,96,-298,152,-391,130,-372 } },
                { name = "Million Eyes", level = "74-77", pts = { -328,369,-388,348,-351,390,-331,390 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Gazer", level = "48-50", pts = { -143,10,-135,62 } },
                { name = "Blubber Eyes", level = "57-59", pts = { -72,-15,-48,18,100,5,142,13 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Blubber Eyes", level = "55-58", pts = { -125,20,-169,-102,-177,-42,-181,25 } },
                { name = "Mindgazer", level = "66-69", pts = { 108,16,98,-73,122,-116,152,-127 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Gazer", level = "60-62", pts = { 195,301,220,329,299,296,306,264 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Dodomeki", level = "63-68", pts = { -21,-210,-21,-176,-14,-133,52,-129 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Mindgazer", level = "69-72", pts = { -223,-34,-187,-68,-246,-65,-339,-59 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Million Eyes", level = "73-76", pts = { 96,-342,96,-308,24,-308,-19,-244 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Beholder", level = "74-75", pts = { -88,-128,-118,-103,-179,-100 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Myriadeyes", level = "82-83", pts = { 16,-58,58,-16 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Thousand Eyes", level = "135-137", pts = { -79,-257,-23,-306 } },
            } },
        },
    },
    [524] = {
        name = "Sandspin", level = 1, element = 3, skill = 0,
        family = "Worm", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Tunnel Worm", level = "1", pts = { 105,150,233,261,201,391 } },
                { name = "Carrion Worm", level = "2-6", pts = { 198,63,337,108,290,-47,329,415 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Tunnel Worm", level = "1", pts = { 694,420,548,438,386,310 } },
                { name = "Stone Eater", level = "2-6", pts = { 381,640,245,662,272,683,130,518 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Tunnel Worm", level = "1", pts = { 588,-370,526,-446,295,-265,185,-211 } },
                { name = "Stone Eater", level = "2-5", pts = { 277,-337,236,-317,127,-484,341,-417 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Tunnel Worm", level = "1", pts = { -289,286,-291,402,-154,186 } },
                { name = "Carrion Worm", level = "2-6", pts = { -454,366,-406,216,-289,95,-567,472 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Carrion Worm", level = "2-5", pts = { -138,242,-144,196,-91,-64,-117,-97 } },
                { name = "Stone Eater", level = "5-7", pts = { -234,59,40,19,103,22,140,74 } },
                { name = "Rock Eater", level = "14-16", pts = { -17,196,-43,210,-59,167,142,60 } },
                { name = "Locus Tomb Worm", level = "131-133", pts = { 15,-234 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Stone Eater", level = "3-5", pts = { -42,-232,-82,-225 } },
                { name = "Witchetty Grub", level = "88-90", pts = { -208,192,-163,287,-173,423,-157,460 } },
            } },
            { id = 145, zone = "Giddeus", kind = nil, mobs = {
                { name = "Dirt Eater", level = "3-5", pts = { -116,85,-74,66,-59,98,-141,-10 } },
                { name = "Earth Eater", level = "10-12", pts = { -138,60,-104,124,-60,140,-21,119 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Carrion Worm", level = "10-12", pts = { 233,366,275,298,231,265,272,257 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Rock Eater", level = "10-11", pts = { -126,-690,433,-424,607,179,577,403 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Rock Eater", level = "10-11", pts = { -718,443,-463,-138,-321,245,-77,124 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Tunnel Worm", level = "10-12", pts = { 382,212,342,265,250,253,191,281 } },
                { name = "Stone Eater", level = "18-22", pts = { -414,-88,-440,-31,-493,-30,-540,-9 } },
                { name = "Rock Eater", level = "32-35", pts = { -20,547,51,576,91,626,113,684 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Maze Maker", level = "18-21", pts = { -251,-114,-178,4,-102,-45,-102,-97 } },
                { name = "Abyss Worm", level = "27-30", pts = { 176,-6,120,0,60,38,59,0 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Land Worm", level = "20-25", pts = { 411,179,354,134,314,100,283,97 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Ore Eater", level = "23-26", pts = { 183,-101,-114,-99,147,-19 } },
                { name = "Amphisbaena", level = "28-30", pts = { -4,130,36,131 } },
                { name = "Rockmill", level = "85-86", pts = { -123,7,123,161,124,197,159,187 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Land Worm", level = "26-27", pts = { 155,-20,96,22,90,-23,15,-25 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Rock Eater", level = "33-35", pts = { -607,-786,-482,-765,-404,-634,-366,-531 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Flesh Eater", level = "34-37", pts = { -118,-144,3,-152,-128,-102,-169,-121 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Flesh Eater", level = "37-42", tags = { "Evening only" }, pts = { 170,-9,32,200,-54,249,89,116 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Desert Worm", level = "43-47", tags = { "Evening only" }, pts = { 632,-66,542,0,612,104,460,90 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Worm", level = "50-59", pts = { -407,-139,-442,-113,-432,-75,-364,21 } },
            } },
            { id = 208, zone = "Quicksand Caves", kind = nil, mobs = {
                { name = "Sand Eater", level = "51-59", pts = { 833,-458,775,-462,842,-490,795,-556 } },
                { name = "Sand Digger", level = "62-65", pts = { -498,-401,-480,-360,-438,-340,-417,-305 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Glacier Eater", level = "58-62", pts = { 38,-386,103,-419,-409,-136,-341,-152 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Cave Worm", level = "60-63", pts = { 24,-97,-22,-109,21,48,55,17 } },
                { name = "Kuftal Digger", level = "66-69", pts = { 81,121,104,103,63,96,31,133 } },
                { name = "Kuftal Delver", level = "99-101", pts = { 128,-105,85,-92,81,-105,92,-146 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Cave Worm", level = "61-64", pts = { 37,-38,36,-79,-3,-78,41,-112 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Mold Eater", level = "69-71", pts = { -459,-260,-357,-339,-333,-337,-341,-358 } },
                { name = "Slime Eater", level = "87-89", pts = { 347,494,383,497,358,448,392,443 } },
            } },
            { id = 172, zone = "Zeruhn Mines", kind = nil, mobs = {
                { name = "Burrower Worm", level = "77-79", pts = { -30,-138,60,-140,-88,-218,-66,-264 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Rock Grinder", level = "79-80", pts = { 617,-28,640,-100,609,-91,658,-103 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Entozoon", level = "81-82", pts = { 263,212,335,222,341,182,319,209 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Ectozoon", level = "83-84", pts = { 579,62,579,101,596,102,571,144 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Boulder Eater", level = "100-102", pts = { 19,144,28,170,40,206,64,181 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Midnight Worm", level = "120-123", pts = { 315,-248,348,-220,401,-292,269,-384 } },
                { name = "Void Worm", level = "121-123", pts = { -227,263 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Metalcruncher Worm", level = "124-127", pts = { 356,359,378,396,301,479,299,398 } },
            } },
        },
    },
    [527] = {
        name = "Smite of Rage", level = 34, element = 15, skill = 76,
        family = "Evil Weapon", stats = "AGI+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Poltergeist", level = "18-19", pts = { 550,416,464,249 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Poltergeist", level = "18-19", pts = { 654,-100 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Poltergeist", level = "18-19", pts = { 177,486 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Boggart", level = "22-26", pts = { -301,-99,-284,-43,-239,-41,-279,40 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Boggart", level = "25-26", pts = { 279,-331,337,-222,572,191 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Boggart", level = "26-27", pts = { -251,94,402,3,495,38,617,-5 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Dancing Weapon", level = "28-30", pts = { -360,-630,-362,-661 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Dancing Weapon", level = "28-29", pts = { 152,-374,179,-204,118,57,-142,234 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Evil Weapon", level = "35-37", pts = { -278,200 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Evil Weapon", level = "37-38", pts = { 158,-328 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Evil Weapon", level = "37-38", pts = { 318,-320,441,-61,387,-155,325,234 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Evil Weapon", level = "37-38", pts = { 81,-209,-206,189,-106,73 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Cursed Weapon", level = "43-45", pts = { 392,-150,241,-99,61,-22 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Demonic Weapon", level = "45-46", pts = { 192,-84,-5,-16 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Demonic Weapon", level = "47-49", pts = { -167,248,-126,217,-112,249 } },
                { name = "Over Weapon", level = "59-62", pts = { 27,132,130,48,152,75,-288,179 } },
                { name = "Vault Weapon", level = "60-62", pts = { 27,132,130,48,152,75,-288,179 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Killing Weapon", level = "59-61", pts = { 72,234,-141,180,-90,72,-109,71 } },
                { name = "Hellish Weapon", level = "61-63", pts = { 72,234,-141,180,-90,72,-109,71 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Weapon", level = "60-69", pts = { -458,109,-520,170,-470,242,-403,282 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Killing Weapon", level = "60-64", pts = { 1,-126,-30,-109,-42,-94,43,-100 } },
                { name = "Ominous Weapon", level = "61-65", pts = { 1,-126,-42,-94,43,-100,-83,-96 } },
                { name = "Apocalyptic Weapon", level = "78-80", pts = { -117,50,-143,28,-146,5,-193,-40 } },
                { name = "Infernal Weapon", level = "79-81", pts = { -117,50,-164,20,-193,-40,-186,-9 } },
            } },
            { id = 177, zone = "VeLugannon Palace", kind = nil, mobs = {
                { name = "Mystic Weapon", level = "74-77", pts = { -38,-397,-125,-397,-125,-359,3,-305 } },
                { name = "Ornamental Weapon", level = "74-76", pts = { 38,-399,125,-395,122,-363,-1,-323 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Decorative Weapon", level = "79-81", pts = { -43,86,-70,71,-87,48,-20,28 } },
                { name = "Aura Weapon", level = "80-82", pts = { 881,722,900,698,879,642,859,621 } },
            } },
        },
    },
    [529] = {
        name = "Bludgeon", level = 18, element = 15, skill = 28,
        family = "Cardian", stats = "STR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, more = 37, mobs = {
                { name = "Three of Cups", level = "1-9", pts = { -460,-699,-420,-703,290,710,350,708 } },
                { name = "Two of Batons", level = "1-5", pts = { -499,-661,-500,-701,331,740,305,741 } },
                { name = "Two of Coins", level = "1-5", pts = { -499,-661,-500,-701,331,740,305,741 } },
                { name = "Two of Cups", level = "1-5", pts = { -499,-661,-500,-701,331,740,305,741 } },
                { name = "Two of Swords", level = "1-5", pts = { -499,-661,-500,-701,331,740,305,741 } },
                { name = "Three of Batons", level = "5-9", pts = { -460,-699,-420,-703,331,707,350,772 } },
            } },
            { id = 94, zone = "Windurst Waters (S)", kind = nil, mobs = {
                { name = "Ace of Batons", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Ace of Coins", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Ace of Cups", level = "1", nm = true, tags = { "NM (pop/scripted)" }, pts = { 144,166 } },
                { name = "Ace of Swords", level = "1", nm = true, tags = { "NM (pop/scripted)" }, pts = { 146,168 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Cardian Prototype", level = "60-64", tags = { "Scripted spawn" } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Cardian Prototype", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Cardian Prototype", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Cardian Prototype", level = "70", tags = { "Scripted spawn" } },
                { name = "Ace of Batons", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { -4,296 } },
                { name = "Ace of Coins", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { -5,296 } },
                { name = "Ace of Cups", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { -4,297 } },
                { name = "Ace of Swords", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { -4,296 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Mellonia", level = "94-95", nm = true, tags = { "NM (pop/scripted)" }, pts = { 58,259 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Brittlis", level = "125", tags = { "Scripted spawn" }, pts = { 35,126 } },
            } },
            { id = 170, zone = "Full Moon Fountain", kind = "Battlefield", mobs = {
                { name = "Ace of Batons", level = "73-75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -65,59,-385,419,335,-341 } },
                { name = "Ace of Coins", level = "73-75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -59,59,-379,419,341,-341 } },
                { name = "Ace of Cups", level = "73-75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -56,59,-376,419,344,-341 } },
                { name = "Ace of Swords", level = "73-75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -62,59,-382,419,338,-341 } },
            } },
            { id = 146, zone = "Balgas Dais", kind = "Battlefield", mobs = {
                { name = "Queen of Batons", level = "75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -137,-228,22,-28,183,172 } },
                { name = "Queen of Cups", level = "75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -141,-228,18,-29,179,172 } },
                { name = "King of Batons", level = "79", nm = true, tags = { "NM (pop/scripted)" }, pts = { -145,-224,15,-25,177,175 } },
                { name = "King of Coins", level = "79", nm = true, tags = { "NM (pop/scripted)" }, pts = { -141,-224,18,-25,179,175 } },
                { name = "King of Cups", level = "79", nm = true, tags = { "NM (pop/scripted)" }, pts = { -133,-224,26,-25,186,175 } },
                { name = "King of Swords", level = "79", nm = true, tags = { "NM (pop/scripted)" }, pts = { -137,-224,22,-25,183,175 } },
            } },
        },
    },
    [530] = {
        name = "Refueling", level = 48, element = 15, skill = 118,
        family = "Cluster", stats = "AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Cluster", level = "38-40", tags = { "Fog" }, pts = { -21,-228,178,-96,397,-155 } },
                { name = "Atomic Cluster", level = "44-46", tags = { "Fog" }, pts = { -392,134,-174,23 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Atomic Cluster", level = "44-46", tags = { "Fog" }, pts = { 247,188,98,45,20,331 } },
            } },
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Atomic Cluster", level = "45-48", pts = { -186,-833,-348,-709,-284,-601,-732,-308 } },
            } },
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Nitro Cluster", level = "55-57", pts = { 219,-667,293,-741,38,640,-540,692 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Sweeping Cluster", level = "73-78", pts = { 36,227,86,209,574,224,597,226 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Dynamo Cluster", level = "82-83", pts = { -241,182,-273,175,-308,182,-301,168 } },
            } },
        },
    },
    [531] = {
        name = "Ice Break", level = 50, element = 1, skill = 124,
        family = "Golem", stats = "INT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Stone Golem", level = "40-42", pts = { 202,13,229,-124,267,-140,354,-178 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Ore Golem", level = "43-45", pts = { -22,39,-20,79,204,-40,203,161 } },
                { name = "Colossus", level = "56-58", pts = { 3,229,-70,181,-191,190,-192,170 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Rock Golem", level = "49-50", pts = { -179,-346,23,-425,420,-301,499,-577 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Mythril Golem", level = "68-70", pts = { 1,-67,1,-23,-1,16 } },
                { name = "Darksteel Golem", level = "80-82", pts = { -250,-13,-257,-46,248,-18,261,-46 } },
            } },
            { id = 177, zone = "VeLugannon Palace", kind = nil, mobs = {
                { name = "Enkidu", level = "77-80", pts = { -198,400,-255,396,-117,405,-119,440 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Aura Statue", level = "81-84", pts = { 737,-576,56,42,59,-38,28,-62 } },
                { name = "Aura Sculpture", level = "104-106", pts = { 82,-1,116,1 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Verglas Golem", level = "98-99", pts = { -196,373,-210,339,-218,296,-282,321 } },
            } },
        },
    },
    [532] = {
        name = "Blitzstrahl", level = 44, element = 4, skill = 106,
        family = "Doll", stats = "DEX+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Chaos Idol", level = "28-30", pts = { 539,18,523,101 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Panzer Doll", level = "31-32", pts = { 66,60,102,19 } },
                { name = "Jagd Doll", level = "33-34", pts = { -418,-61,-478,76 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Living Statue", level = "37-39", pts = { -177,-222,-19,-64,-340,139,97,139 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Drone", level = "41-43", pts = { -91,-76,-152,-81,-123,-54,-190,-8 } },
                { name = "Talos", level = "53-55", pts = { -70,32,-70,8,-50,32,-50,10 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Gargoyle", level = "53-57", pts = { -288,-227,-342,-222 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Branding Iron", level = "55-58", pts = { 58,-68,-144,-20 } },
                { name = "Iron Maiden", level = "64-68", pts = { -97,-109,-30,-151,-70,-150,0,-19 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Cursed Puppet", level = "65-69", pts = { -42,-94,43,-100,-95,-86,92,-84 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, mobs = {
                { name = "Demonic Doll", level = "68-70", pts = { -370,-35,-231,-36,-297,20 } },
            } },
            { id = 130, zone = "Ru'Aun Gardens", kind = nil, mobs = {
                { name = "Groundskeeper", level = "75-78", pts = { 155,-367,177,-416,148,-431,-159,-369 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Aura Butler", level = "77-82", pts = { 818,-40,841,-63,830,-9,809,-9 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Sand Sweeper", level = "87-88", pts = { -800,-490,-790,-420,-762,-392 } },
            } },
        },
    },
    [533] = {
        name = "Self-Destruct", level = 50, element = 0, skill = 124,
        family = "Bomb", stats = "STR+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Bombs only use Self-Destruct some of the time.", },
        extra_lists = { },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Bomb", level = "8-10", tags = { "Fog" }, pts = { 636,330,451,-13,248,-372 } },
            } },
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Balloon", level = "8-10", tags = { "Fog" }, pts = { 52,-68,88,119,402,263,280,276 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Balloon", level = "8-10", pts = { -65,-89 } },
                { name = "Will-o-the-Wisp", level = "23-25", pts = { -293,-133,-301,-74,-187,-6,-279,40 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Shrapnel", level = "8-10", tags = { "Fog" }, pts = { 33,413,-77,286,-81,436,-400,-68 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Balloon", level = "8-10", pts = { 310,708,510,708,530,772,500,-577 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Shrapnel", level = "8-10", tags = { "Fog" }, pts = { 355,-623,-138,-313,-8,-421,52,-510 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Bomb", level = "8-10", tags = { "Fog" }, pts = { -178,-136,-543,-36,-334,-338 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Balloon", level = "8-10", tags = { "Fog" }, pts = { 51,107,-66,292,181,249,79,368 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Grenade", level = "15-17", tags = { "Fog" }, pts = { 369,456,-404,-37,4,188 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Grenade", level = "15-17", tags = { "Fog" }, pts = { -620,66,31,186,484,78,338,-454 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Grenade", level = "15-17", tags = { "Fog" }, pts = { -456,-140,-324,239,88,130,91,348 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Glide Bomb", level = "20-21", tags = { "Fog" }, pts = { -424,520 } },
                { name = "Will-o-the-Wisp", level = "25-26", tags = { "Fog" }, pts = { -242,-115,-171,-463 } },
                { name = "Spunkie", level = "32-33", tags = { "Fog" }, pts = { 102,-576 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Will-o-the-Wisp", level = "23-27", tags = { "Fog" }, pts = { -427,-206,-181,104,-73,-158,-5,35 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Will-o-the-Wisp", level = "23-25", pts = { -143,257 } },
                { name = "Napalm", level = "31-33", pts = { -158,-201 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Will-o-the-Wisp", level = "24-25", tags = { "Fog" }, pts = { -12,-263,98,-362,306,-396 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Will-o-the-Wisp", level = "24-25", tags = { "Fog" }, pts = { -487,-147,245,-373,582,617,14,319 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Fox Fire", level = "24-25", tags = { "Fog" }, pts = { -101,-16,-163,130,594,211 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Will-o-the-Wisp", level = "25-27", tags = { "Fog" }, pts = { 631,217,442,202,400,53,276,147 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Spunkie", level = "28-30", pts = { -54,-26 } },
                { name = "Feu Follet", level = "35-38", pts = { -119,241,-128,351,-147,325 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Ignis Fatuus", level = "34-36", tags = { "Fog" }, pts = { -317,-14,27,195,250,-152,-471,341 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Ignis Fatuus", level = "34-36", tags = { "Fog" }, pts = { -111,-412,-338,-26,64,219 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Ignis Fatuus", level = "34-36", tags = { "Fog" }, pts = { 528,139,390,116,-7,184 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Ignis Fatuus", level = "35-37", tags = { "Fog" }, pts = { -332,-436,-517,-780,-158,-686,-280,-520 } },
                { name = "Teine Sith", level = "75-78", tags = { "Fog" }, pts = { 223,791,285,838 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Will-o-the-Wykes", level = "40-43", tags = { "Fog" }, pts = { 3,-152,-128,-102,27,-55,-121,2 } },
                { name = "Bifrons", level = "75", tags = { "Fog" }, pts = { -539,-34 } },
            } },
            { id = 11, zone = "Oldton Movalpolos", kind = nil, mobs = {
                { name = "Ancient Bomb", level = "40-45", pts = { -85,65,-45,-259,-196,-300,-29,-130 } },
            } },
            { id = 195, zone = "The Eldieme Necropolis", kind = nil, mobs = {
                { name = "Puroboros", level = "42-44", pts = { -223,65,-620,179 } },
                { name = "Azer", level = "51-53", pts = { 254,23,180,95,183,-54,106,23 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Puroboros", level = "43-45", pts = { -328,250,-272,250 } },
                { name = "Explosure", level = "52-53", pts = { -2,201,-40,240,-127,353,-149,326 } },
                { name = "Hellmine", level = "59-62", pts = { 41,116,-134,223 } },
                { name = "Kaboom", level = "94-96", pts = { -368,257,-303,260,-346,286,-248,235 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Puroboros", level = "45", pts = { 62,22 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Puroboros", level = "47-49", tags = { "Fog" }, pts = { 296,46,318,198,-423,-105,-369,-160 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Lava Bomb", level = "47-50", tags = { "Fog" }, pts = { -624,15,-22,-469,464,75 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Puroboros", level = "51-54", tags = { "Fog" }, pts = { 535,-436,556,-408 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Volcanic Gas", level = "62-68", pts = { 43,-278,-6,-284,-80,-241,-83,-204 } },
                { name = "Volcanic Bomb", level = "71-78", pts = { -106,4,14,178,77,165,27,98 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Explosure", level = "64-65", pts = { 219,-100,-141,-109,-149,-99 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Enna-enna", level = "65-69", tags = { "Fog" }, pts = { -32,137,-13,126,-57,160,-233,165 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Cannonball", level = "66-70", tags = { "Fog" }, pts = { 24,-40,7,11,-3,112 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Bifrons", level = "68-70", pts = { -79,-1,403,360,199,-284 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Puroboros", level = "69-70", pts = { 66,27,57,264,-135,212 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Friars Lantern", level = "72-79", pts = { 205,235,223,254,277,227,106,15 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Bonfire", level = "86-87", pts = { -609,-566,-653,-629,-676,-611,-682,-558 } },
            } },
        },
    },
    [534] = {
        name = "Mysterious Light", level = 40, element = 2, skill = 94,
        family = "Magic Pot", stats = "AGI+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Magic Pot", level = "28-29", pts = { 460,-60,460,-57 } },
                { name = "Magic Urn", level = "34-35", pts = { 641,121,420,-17 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Magic Pot", level = "28-29", pts = { 91,62,80,17,82,-36 } },
                { name = "Magic Jar", level = "31-32", pts = { -419,-49,-480,-40,-458,99 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, mobs = {
                { name = "Magic Urn", level = "34-35", pts = { -239,82 } },
                { name = "Magic Pot", level = "68-70", pts = { -295,20,-274,69 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Clockwork Pod", level = "41-43", pts = { -19,56,40,-47,41,139,63,121 } },
                { name = "Droma", level = "54-56", pts = { 0,39,3,229,-162,240,-171,9 } },
                { name = "Sentient Carafe", level = "98-99", pts = { 124,46,111,64 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Clockwork Pod", level = "44-45", pts = { -288,250 } },
                { name = "Droma", level = "52-54", pts = { 13,190,-52,227,-130,324,-191,326 } },
                { name = "Magic Jug", level = "62-64", pts = { -174,251,-167,187,-109,253,-107,188 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Magic Millstone", level = "54-58", pts = { 251,-68,274,-47,191,-332,-378,-265 } },
                { name = "Maledict Millstone", level = "64-68", pts = { 113,-350,92,-329,142,-338,257,302 } },
                { name = "Demonic Millstone", level = "72-75", pts = { -369,393,-391,393 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Magic Flagon", level = "64-69", pts = { -158,-89,160,-89,-68,16,60,18 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Hover Tank", level = "64-68", pts = { 17,-99,16,-137,-98,-131,-9,-150 } },
            } },
            { id = 130, zone = "Ru'Aun Gardens", kind = nil, mobs = {
                { name = "Sprinkler", level = "73-76", pts = { 2,-432,-26,-384,25,-386,0,-383 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Aura Pot", level = "75-80", pts = { 879,478,901,506,898,537,883,563 } },
            } },
            { id = 177, zone = "VeLugannon Palace", kind = nil, mobs = {
                { name = "Dustbuster", level = "75-78", pts = { 404,-41,401,-96,365,42,398,41 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Sinister Seidel", level = "87-88", pts = { 493,621,536,686,471,695,445,700 } },
            } },
        },
    },
    [535] = {
        name = "Cold Wave", level = 52, element = 1, skill = 134,
        family = "Bomb", stats = "INT-1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Upas-Kamuy", level = "100", nm = true, tags = { "NM (pop/scripted)" }, pts = { -212,449 } },
            } },
        },
    },
    [536] = {
        name = "Poison Breath", level = 22, element = 5, skill = 40,
        family = "Hound", stats = "MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Mad Fox", level = "3-8", tags = { "Night only" }, pts = { 140,-245,345,-180,-76,-104,-208,-30 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Mad Fox", level = "4-6", tags = { "Night only" }, pts = { -66,292,314,333,49,457,-100,40 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Black Wolf", level = "5-8", tags = { "Night only" }, pts = { 381,640,245,662,130,518,202,378 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Black Wolf", level = "5-8", tags = { "Night only" }, pts = { 236,-317,127,-484,341,-417,112,-338 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Tainted Hound", level = "5-8", tags = { "Night only" }, pts = { -318,-78,-178,-136,-543,-36,-470,-148 } },
            } },
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Tainted Hound", level = "6-8", tags = { "Night only" }, pts = { 290,-47,513,140,451,-13,337,-272 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Wolf Zombie", level = "8-10", tags = { "Night only" }, pts = { -718,443,-463,-138,-321,245,-77,124 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Barghest", level = "8-11", tags = { "Night only" }, pts = { 197,-27,94,-36,23,-15,-126,37 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Wolf Zombie", level = "9-14", tags = { "Night only" }, pts = { -198,-193,-354,-226,-462,-61,-304,-86 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Bog Dog", level = "17-22", tags = { "Night only" }, pts = { -466,-484,-262,-270,-2,-263,355,-143 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Bandersnatch", level = "21-24", pts = { -58,-210,183,-101,-114,-99,-54,-26 } },
                { name = "Mauthe Doog", level = "28-31", pts = { 94,36,-25,12,-22,76,-4,130 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Scavenging Hound", level = "22-23", tags = { "Night only" }, pts = { -450,-423,-343,-299,-251,-142,-294,174 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Scavenging Hound", level = "22-26", tags = { "Night only" }, pts = { -300,38,-81,-50,478,134,596,441 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Mauthe Doog", level = "31-32", tags = { "Night only" }, pts = { -400,-30,-275,-36,-186,-8,-495,-43 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Black Wolf", level = "31-39", tags = { "Night only" }, pts = { -198,361,-350,354 } },
            } },
            { id = 195, zone = "The Eldieme Necropolis", kind = nil, mobs = {
                { name = "Marchosias", level = "40-43", pts = { -95,293,-26,267,-1,96,35,-20 } },
                { name = "Hell Hound", level = "46-49", pts = { 219,316,-499,489,-453,496,417,7 } },
                { name = "Tomb Wolf", level = "53-55", pts = { -392,387,225,-2,191,66,174,-27 } },
                { name = "Nekros Hound", level = "93-95", pts = { 346,-330,39,314,333,-268,271,-253 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Hell Hound", level = "46-50", tags = { "Night only" }, pts = { -93,60,-228,-76,-368,19,-421,58 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Mad Fox", level = "48-49", tags = { "Night only" }, pts = { 55,406 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Black Wolf", level = "49-50", tags = { "Night only" }, pts = { -266,-716,-58,-439,-83,-269,296,638 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Scavenging Hound", level = "49", tags = { "Night only" }, pts = { -402,506,92,-56,2,-29,-264,63 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Scavenging Hound", level = "49", tags = { "Night only" }, pts = { 393,-24,424,-247 } },
            } },
            { id = 167, zone = "Bostaunieux Oubliette", kind = nil, mobs = {
                { name = "Hecatomb Hound", level = "56-59", pts = { -105,-65,-150,-100,-218,-106 } },
                { name = "Garm", level = "64-66", pts = { -261,-181,-56,-138,-94,-245 } },
                { name = "Dabilla", level = "94-96", pts = { 91,-274,68,-42,129,-37 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Cwn Annwn", level = "59-64", tags = { "Night only" }, pts = { -226,-426,-195,-498,-138,-397,-206,-328 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Hell Hound", level = "64-66", pts = { 254,135,226,141,129,140,69,98 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Moor Hound", level = "69-74", tags = { "Night only" }, pts = { 590,197,545,-277 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Hati", level = "77-78", pts = { 200,-298,236,-304 } },
                { name = "Locus Hati", level = "135-137", pts = { -175,-263,-239,-219,-258,-223,-262,-282 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Inugami", level = "81-82", pts = { -422,325,-395,304,-381,347 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Dreadhound", level = "113-116", pts = { -225,44,-266,42,-699,-79,-652,-77 } },
            } },
        },
    },
    [537] = {
        name = "Stinking Gas", level = 44, element = 2, skill = 106,
        family = "Doomed", stats = "AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Addled Tumor", level = "36-38", pts = { 126,-219 } },
                { name = "Foul Meat", level = "45-47", pts = { 156,60,-200,124,-19,99,61,19 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Foul Meat", level = "43-45", pts = { 22,302,142,210 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Fetid Flesh", level = "54-56", pts = { -76,140,-78,299 } },
                { name = "Tainted Flesh", level = "63-65", pts = { 22,12,-256,189,-212,141 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Rotten Sod", level = "58-60", pts = { -299,59 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Tainted Flesh", level = "60-63", pts = { 134,71,126,213 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Jnun", level = "72-77", pts = { 296,-372,304,-384,137,-184,455,-303 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Doom Toad", level = "75-78", pts = { 122,-80,155,-98,158,-121,-37,-358 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Jnun", level = "77-80", pts = { 425,149,-131,378,-60,452,-266,147 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Decayed Flesh", level = "83-84", pts = { -100,44,-120,-2,-93,-46 } },
            } },
        },
    },
    [538] = {
        name = "Memento Mori", level = 62, element = 15, skill = 183,
        family = "Corse", stats = "INT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Corse", level = "66-67", tags = { "Night only" }, pts = { -360,60,-394,58 } },
                { name = "Arch Corse", level = "75-80", tags = { "Night only" }, pts = { -531,112,-539,-34 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Corse", level = "70-79", pts = { -32,49,1,97,66,53,13,-17 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Wiederganger", level = "80-81", pts = { -237,539,-240,565 } },
            } },
        },
    },
    [539] = {
        name = "Terror Touch", level = 40, element = 15, skill = 94,
        family = "Ghost", stats = "HP-5, MP+10", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Spook", level = "11-13", tags = { "Night only" }, pts = { 1,-104 } },
                { name = "Crypt Ghost", level = "20-21", pts = { -104,56 } },
                { name = "Locus Lemures", level = "136-138", pts = { 142,-283 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Ghost", level = "15-16", tags = { "Night only" }, pts = { 607,179,4,188,-701,105 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Ghost", level = "15-16", tags = { "Night only" }, pts = { -176,256,467,57,422,-174 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Ghost", level = "15-16", tags = { "Night only" }, pts = { -266,-547,199,66,389,493,88,130 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Bogy", level = "23-25", tags = { "Night only" }, pts = { -360,-321,-129,-254,-71,-319,-202,-278 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Bogy", level = "25-26", tags = { "Night only" }, pts = { -496,301,-84,352,91,413,-25,-619 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Bogy", level = "25-26", tags = { "Night only" }, pts = { -300,38,-133,132,231,46,310,171 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Bogy", level = "25-26", tags = { "Night only" }, pts = { -418,-243,167,-322,225,150,-290,300 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Bogy", level = "27-29", pts = { -54,-26,19,-16,-4,-38,21,-37 } },
                { name = "Banshee", level = "31-34", pts = { -4,165,44,162,-19,203,-18,301 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Bogy", level = "28-30", tags = { "Night only" }, pts = { 289,-40,322,-173,-248,-39,-205,-139 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Bogy", level = "30-33", pts = { -259,167,-272,142,-298,135,-318,119 } },
            } },
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Bogy", level = "30-32", pts = { 342,13,581,98,468,-54,539,20 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Banshee", level = "31-32", tags = { "Night only" }, pts = { 14,-72,203,123,-8,104,7,287 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Banshee", level = "32-33", pts = { 80,17,52,-54,18,101 } },
                { name = "Evil Spirit", level = "34-35", pts = { 18,101,-422,99,-360,38 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Evil Spirit", level = "35-36", tags = { "Night only" }, pts = { -200,39,-361,162,-78,-77,-43,-38 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Evil Spirit", level = "35-36", tags = { "Night only" }, pts = { -431,-263,418,-85,231,153,64,219 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Evil Spirit", level = "35-36", tags = { "Night only" }, pts = { 496,-179,569,-12,498,78,502,136 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Lugat", level = "39-42", pts = { -91,120,-221,-133,-101,-25,-206,-32 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Revenant", level = "40-42", pts = { -91,-76,-152,-81,-123,-54,-38,40 } },
                { name = "Utukku", level = "55-57", pts = { 10,110,30,113,-40,200,-82,193 } },
                { name = "Wekufe", level = "97-99", pts = { 161,-84,125,-43,154,0,213,22 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Evil Spirit", level = "41", tags = { "Night only" }, pts = { 341,60,156,307 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Evil Spirit", level = "43", tags = { "Night only" }, pts = { 253,-345,-626,-215,-725,-459 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Etemmu", level = "43-46", pts = { 317,-194,339,-341,183,-145,65,-18 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Revenant", level = "44-46", pts = { -200,301 } },
                { name = "Bhuta", level = "47-49", pts = { -168,190,-129,229,-112,190 } },
                { name = "Wraith", level = "60-62", pts = { -125,380,130,72,150,48,-144,226 } },
            } },
            { id = 195, zone = "The Eldieme Necropolis", kind = nil, mobs = {
                { name = "Revenant", level = "44-47", pts = { -5,40,258,262,382,20 } },
                { name = "Blood Soul", level = "50-52", pts = { -420,502,303,17,180,-100 } },
                { name = "Utukku", level = "55-57", pts = { -382,342,180,140,60,20 } },
                { name = "Haunt", level = "63-65", pts = { 178,-91,400,118,58,23,178,140 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Revenant", level = "45-47", pts = { 480,-538,255,279,421,-18,51,116 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Bhuta", level = "47-48", tags = { "Night only" }, pts = { -78,-82,-35,0 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Revenant", level = "51-54", tags = { "Night only" }, pts = { 753,446,302,542,-438,-140 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Blood Soul", level = "53-56", tags = { "Night only" }, pts = { -113,-498,630,-420,-480,102,-472,-580 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Utukku S", level = "55", pts = { -19,19,-19,-24 } },
            } },
            { id = 167, zone = "Bostaunieux Oubliette", kind = nil, mobs = {
                { name = "Haunt", level = "60-63", pts = { -219,-166,-299,-179,-138,-216,-180,-260 } },
                { name = "Gespenst", level = "68-70", pts = { -59,-146,16,-136 } },
                { name = "Nachtmahr", level = "96-97", pts = { -19,-343,-20,-259,30,-221,63,-200 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Haunt", level = "63-64", tags = { "Night only" }, pts = { 323,99,369,302,99,377 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Haunt", level = "63-66", pts = { 21,-158,-5,-174,-20,-179,-24,-127 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Fantasma", level = "65-68", tags = { "Night only" }, pts = { -150,8,-110,13,88,-178,-36,257 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Haunt", level = "65-69", tags = { "Night only" }, pts = { -140,-203,-271,-281,-243,-670 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Haunt", level = "65-66", tags = { "Night only" }, pts = { -49,-119,-79,-599,-76,-627 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Phasma", level = "67-72", tags = { "Night only" }, pts = { 378,-184 } },
                { name = "Srei Ap", level = "71-76", tags = { "Night only" }, pts = { 540,98,465,222,501,301 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, mobs = {
                { name = "Phasma", level = "67-69", pts = { -359,79 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Revenant", level = "68-70", pts = { 283,-222,-67,296,-58,298,140,-121 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Bogy", level = "70-73", tags = { "Night only" }, pts = { -289,301,590,197,545,-277 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Phasma", level = "73-74", pts = { 539,137,-156,406,-136,425,-92,506 } },
                { name = "Bhoot", level = "80-82", pts = { -156,406,100,257,534,499 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Phasma", level = "73-76", tags = { "Night only" }, pts = { 232,-283,246,-204,113,-128,240,-160 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Erlik", level = "75-78", pts = { 170,74,-132,46,-311,-8,-124,217 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Qaitu", level = "78-88", pts = { 545,387,548,435 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Ekimmu", level = "79-80", pts = { 71,-323,135,-284,218,105 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Guard Bhoot", level = "81-83", pts = { -596,-140,-445,-115 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Gidim", level = "81-82", pts = { 15,-125,-45,-88 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Spuk", level = "82-83", pts = { -219,256,-142,181,-106,141 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Horrific Bhoot", level = "114-118", pts = { -854,-49,-852,1,-810,-20 } },
            } },
        },
    },
    [540] = {
        name = "Spinal Cleave", level = 63, element = 15, skill = 188,
        family = "Qutrub", stats = "VIT+2, INT+1, MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used while the monster is in a particular stance.", },
        extra_lists = { },
        zones = {
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Bog Body", level = "79-80", pts = { 352,481,400,496,322,486 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Lamia Idolater", level = "79-81", pts = { -473,-211,-416,-196,-436,-162,-367,-168 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Lamia Idolater", level = "80-82", pts = { 456,441,468,395,506,379,540,422 } },
            } },
        },
    },
    [541] = {
        name = "Blood Saber", level = 48, element = 7, skill = 118,
        family = "Skeleton", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Magicked Bones", level = "3-8", tags = { "Night only" }, pts = { -208,-30,233,-410,315,-388,307,21 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Magicked Bones", level = "3-8", pts = { 419,-21 } },
                { name = "Wendigo", level = "25-28", pts = { -291,109,-332,139,-260,181,-299,179 } },
                { name = "Skinnymajinx", level = "81-83", pts = { 192,55,85,55 } },
                { name = "Skinnymalinks", level = "81-83", pts = { 192,55,85,55 } },
            } },
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "4-8", tags = { "Night only" }, pts = { 509,370,636,330,451,-13,337,-272 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "4-8", tags = { "Night only" }, pts = { -91,-64,-117,-97,-84,-135,1,-64 } },
                { name = "Nachzehrer", level = "15-18", pts = { 24,121,-58,83,62,66,6,54 } },
                { name = "Spartoi Warrior", level = "78-80", pts = { 200,-298,236,-304 } },
                { name = "Spartoi Sorcerer", level = "80-81", pts = { 200,-298,236,-304 } },
                { name = "Locus Spartoi Sorcerer", level = "135-137", pts = { -239,-219,-258,-223,-262,-282,61,-279 } },
                { name = "Locus Spartoi Warrior", level = "135-137", pts = { -239,-219,-258,-223,-262,-282,61,-279 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "4-8", tags = { "Night only" }, pts = { 157,-384,185,-482,248,-393,473,-581 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "4-8", tags = { "Night only" }, pts = { -543,-36,-310,-228,-516,-423,-132,-403 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Magicked Bones", level = "4-8", tags = { "Night only" }, pts = { 181,249,79,368,233,384,-309,303 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "5-8", tags = { "Night only" }, pts = { 269,460,279,580,288,529,-311,296 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Skeleton Warrior", level = "10-12", tags = { "Night only" }, pts = { 448,121,365,296,369,456,-281,-205 } },
                { name = "Skeleton Sorcerer", level = "11-13", tags = { "Night only" }, pts = { 448,121,369,456,-281,-205,-404,-37 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Skeleton Warrior", level = "10-12", tags = { "Night only" }, pts = { -542,361,-718,443,-620,66,-463,-138 } },
                { name = "Skeleton Sorcerer", level = "11-13", tags = { "Night only" }, pts = { -542,361,-718,443,-620,66,-463,-138 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Skeleton Warrior", level = "10-12", tags = { "Night only" }, pts = { -266,-547,52,-179,135,-45,-229,-12 } },
                { name = "Skeleton Sorcerer", level = "11-13", tags = { "Night only" }, pts = { -266,-547,52,-179,135,-45,-229,-12 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, more = 1, mobs = {
                { name = "Skeleton Warrior", level = "15-17", pts = { 19,-220,20,-180,24,-219 } },
                { name = "Ghoul", level = "20-27", pts = { -58,-212,21,-93,-54,-26,19,-16 } },
                { name = "Wendigo", level = "26-30", pts = { 0,-71,22,47,22,107,94,36 } },
                { name = "Wight", level = "29-34", pts = { 22,47,22,107,-58,229,-65,354 } },
                { name = "Ghast", level = "33-36", pts = { -58,229,-65,354,21,366,119,382 } },
                { name = "Accursed Soldier", level = "85-87", pts = { 149,53,156,74 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Ghoul", level = "16-17", tags = { "Night only" }, pts = { -302,-238,-120,82,-17,-284,88,-369 } },
                { name = "Zombie", level = "16-22", tags = { "Night only" }, pts = { -302,-238,-120,82,-17,-284,88,-369 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Zombie", level = "16-24", tags = { "Night only" }, pts = { -81,-50,245,-373,310,-183,636,-362 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Zombie", level = "18-22", tags = { "Night only" }, pts = { -475,48,-313,33,-340,-102,-427,-206 } },
                { name = "Ghoul", level = "20-24", tags = { "Night only" }, pts = { -427,-206,-344,174,-181,104,-317,259 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Ghoul", level = "18-24", tags = { "Night only" }, pts = { -382,-391,14,-234,368,-93,183,40 } },
                { name = "Zombie", level = "18-24", tags = { "Night only" }, pts = { -382,-391,14,-234,368,-93,183,40 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Ghoul", level = "18-24", tags = { "Night only" }, pts = { 442,202,400,53,521,-28,276,147 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Ghoul", level = "21-27", tags = { "Night only" }, pts = { -197,60,-242,-31,-254,-99,-232,-287 } },
                { name = "Wendigo", level = "28-33", tags = { "Night only" }, pts = { 102,-576 } },
                { name = "Wight", level = "29-33", tags = { "Night only" }, pts = { 120,-568 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Ghoul", level = "22-26", pts = { -40,178,-188,-12,-60,-20,-98,-104 } },
                { name = "Wendigo", level = "24-28", pts = { -40,178,-72,156,-186,-104,258,24 } },
                { name = "Wight", level = "32-35", pts = { 58,46,-50,-13,-37,-79,-123,-36 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Ghoul", level = "23-26", pts = { -415,609 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Wight", level = "26-32", tags = { "Night only" }, pts = { -317,-14,-566,52,-358,244,-231,230 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Wight", level = "26-34", tags = { "Night only" }, pts = { 455,-135,536,24,390,116,304,343 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Wight", level = "28-29", tags = { "Night only" }, pts = { 96,22,139,77,125,152,-80,19 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Wight", level = "28-34", tags = { "Night only" }, pts = { -80,-631,-364,-538,-164,-318,-43,-190 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "30", tags = { "Night only" }, pts = { 58,433,-475,270 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Ghast", level = "35-40", pts = { -91,120,-221,-133,-101,-25,-206,-32 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Enchanted Bones", level = "37-46", tags = { "Night only" }, pts = { 255,-12,391,-184,379,-274,478,-361 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Wight", level = "38-40", tags = { "Night only" }, pts = { 15,87,-492,399,-202,-45,280,-362 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Ghast", level = "38-41", pts = { -14,289,-34,297,-29,330,13,179 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Ghoul", level = "39-42", tags = { "Night only" }, pts = { 279,100,347,106,-130,287,-210,206 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Fallen Evacuee", level = "42-43", pts = { -310,272,-350,246,-245,246 } },
                { name = "Fallen Soldier", level = "47-49", pts = { -166,228,-168,210,-112,230,-112,210 } },
                { name = "Fallen Officer", level = "52-55", pts = { 10,290,-150,352,-168,326,-76,378 } },
                { name = "Fallen Mage", level = "59-62", pts = { 142,59 } },
                { name = "Fallen Major", level = "60-62", pts = { 142,59 } },
            } },
            { id = 195, zone = "The Eldieme Necropolis", kind = nil, more = 2, mobs = {
                { name = "Lost Soul", level = "42-46", pts = { -62,301,-32,220,-5,40,261,297 } },
                { name = "Mummy", level = "50-52", pts = { -514,504,-488,501,-458,456,-437,402 } },
                { name = "Lich", level = "51-55", pts = { -514,504,-488,501,-458,456,-437,402 } },
                { name = "Fallen Knight", level = "54-56", pts = { 258,101,257,-59,98,102,97,-61 } },
                { name = "Tomb Mage", level = "60-63", pts = { 154,-129,376,50,341,179,49,61 } },
                { name = "Tomb Warrior", level = "60-62", pts = { 154,-129,376,50,341,179,49,61 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Lost Soul", level = "42-45", pts = { 528,-253,317,-194,368,-89,183,-145 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Lost Soul", level = "44-48", tags = { "Night only" }, pts = { 64,-98,32,-320,-41,-329,-85,-200 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Lost Soul", level = "45-46", tags = { "Night only" }, pts = { 28,-54 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Rot Prowler", level = "49-53", tags = { "Night only" }, pts = { -423,-105,-369,-160,-294,213,-460,105 } },
                { name = "Lost Soul", level = "51-55", tags = { "Night only" }, pts = { -369,-160,-518,198,-436,262,-346,309 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Lich", level = "49-53", tags = { "Night only" }, pts = { -384,-567,-227,-650,-492,-640,-547,-436 } },
                { name = "Fallen Knight", level = "50-54", tags = { "Night only" }, pts = { -348,-411,-274,-493,-384,-567,-227,-650 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Wight", level = "50-60", tags = { "Night only" }, pts = { 258,100,514,23 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, more = 2, mobs = {
                { name = "Fallen Knight", level = "52-55", pts = { -176,194,-153,131,-62,100,-66,26 } },
                { name = "Lich", level = "54-57", pts = { -62,100,18,59 } },
                { name = "Fleshcraver", level = "60-62", pts = { -333,56,-299,59 } },
                { name = "Mindcraver", level = "60-62", pts = { -333,56,-299,59 } },
                { name = "Doom Mage", level = "65-67", pts = { 226,-125,156,-125 } },
                { name = "Doom Soldier", level = "65-67", pts = { 226,-125,156,-125 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Lich", level = "54-56", pts = { -105,29,-105,8,-114,-21,-89,-26 } },
                { name = "Mummy", level = "54-56", pts = { -105,29,-105,8,-114,-21,-89,-26 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Lich", level = "62-64", tags = { "Night only" }, pts = { -349,8,-360,60,-441,75 } },
                { name = "Mummy", level = "62-64", tags = { "Night only" }, pts = { -349,8,-320,-26,-477,-1 } },
                { name = "Tomb Mage", level = "70-73", tags = { "Night only" }, pts = { -397,-58,-491,39,-531,112 } },
                { name = "Tomb Warrior", level = "71-73", tags = { "Night only" }, pts = { -420,-43,-491,39,-531,112 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Doom Mage", level = "65-67", pts = { 0,41,4,81 } },
                { name = "Doom Soldier", level = "65-67", pts = { 0,41,4,81,-14,108,-38,39 } },
                { name = "Doom Guard", level = "75-77", pts = { 66,29,119,46,157,47,191,84 } },
                { name = "Doom Warlock", level = "76-78", pts = { 66,29,119,46,157,47,170,74 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Lich", level = "65-69", pts = { 102,99,99,96,100,-56,-18,220 } },
                { name = "Lost Soul", level = "65-69", pts = { 98,100,100,-64,104,-58,-18,220 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Doom Soldier", level = "66-70", tags = { "Night only" }, pts = { -168,-100,-96,-92,-138,-53,-150,8 } },
                { name = "Doom Mage", level = "67-71", tags = { "Night only" }, pts = { -225,-37,-59,-52,-110,13,0,258 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Doom Mage", level = "66-69", tags = { "Night only" }, pts = { 148,135,-141,-89,609,353,728,550 } },
                { name = "Doom Soldier", level = "66-69", tags = { "Night only" }, pts = { 148,135,-141,-89,693,390,763,451 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Doom Soldier", level = "66-70", pts = { 381,-236,344,-148,420,-141 } },
                { name = "Doom Mage", level = "74-76", pts = { 598,102,507,111,483,179,494,239 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Guard Skeleton", level = "67-69", tags = { "Night only" }, pts = { -388,-604,-448,-577,-414,-569,-370,-560 } },
                { name = "Reserve Draugar", level = "73-74", pts = { 230,-96,182,-62 } },
                { name = "Draugar Servant", level = "78-80", pts = { -399,-121,-520,-220,-473,-211,-445,-115 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Zombie", level = "67", tags = { "Night only" }, pts = { -183,147,-115,-12 } },
                { name = "Ghoul", level = "68", tags = { "Night only" }, pts = { -183,147,-115,-12 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Doom Mage", level = "69-71", tags = { "Night only" }, pts = { -197,-43,-187,72,-210,1,-242,-36 } },
                { name = "Doom Soldier", level = "69-71", tags = { "Night only" }, pts = { -168,12,-168,81,-183,60,-228,-4 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Sorcerer", level = "70-79", pts = { -21,-87,-14,-139 } },
                { name = "Eschan Warrior", level = "70-79", pts = { -32,49,1,97,66,53,13,-17 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Reserve Draugar", level = "72-73", pts = { 475,81,500,210,457,110,413,62 } },
                { name = "Draugar Servant", level = "79-81", pts = { -18,422,58,419,101,12,161,262 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Thawed Bones", level = "76-78", pts = { 71,-323,-35,-314,135,-284,338,-239 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Snow Wight", level = "80-81", pts = { 298,25,199,2,31,22 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Schnitter", level = "81-82", pts = { -369,235,-379,193,-347,169 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Sensenmann", level = "83-92", pts = { -562,157,-509,230,-438,148,-436,190 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Boribaba", level = "95-97", pts = { -3,286,39,280 } },
                { name = "Babaulas", level = "96-98", pts = { 19,252,-3,286,21,272 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Legionless Draugar", level = "113-116", pts = { -225,44,-298,39,-404,-247,-699,-79 } },
            } },
        },
    },
    [542] = {
        name = "Digest", level = 36, element = 7, skill = 82,
        family = "Slime", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Oil Slick", level = "7-9", pts = { -197,-256 } },
                { name = "Ooze", level = "28-30", pts = { -249,-143,-140,-83,140,-200 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Rotten Jam", level = "12-85", pts = { -220,660,-374,650,-385,669,-387,701 } },
                { name = "Black Slime", level = "23-25", pts = { -389,582 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Blob", level = "15-18", pts = { -59,-56 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Goblin Gruel", level = "18-20", pts = { -59,167 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Jelly", level = "23-27", pts = { 239,78,172,83,113,79,58,75 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Jelly", level = "26-28", pts = { 96,138,243,56,-90,-148 } },
                { name = "Protozoan", level = "29-31", pts = { -101,-102,-1,-161,259,-82,279,-229 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Jelly", level = "26-28", pts = { -41,217,-80,198,-99,281 } },
                { name = "Stroper Chyme", level = "33-35", pts = { -65,61,-114,-186 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Jelly", level = "27-29", pts = { 0,-71,147,-19 } },
                { name = "Rancid Ooze", level = "31-34", pts = { -140,340,-4,130 } },
            } },
            { id = 147, zone = "Beadeaux", kind = nil, mobs = {
                { name = "Ooze", level = "28-30", pts = { -102,56,-75,86,-47,127 } },
                { name = "Gloop", level = "38-40", pts = { 268,122,289,34 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Davoi Mush", level = "33-35", pts = { 187,-375,171,-378,-220,-283 } },
            } },
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Gloop", level = "36-38", pts = { 220,-236,183,-219,180,-202,17,-20 } },
                { name = "Oil Spill", level = "44-47", pts = { 40,99,115,103,-61,36,-33,58 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Viscous Clot", level = "38-40", pts = { -396,-435,-644,-671,-341,-882,-158,-686 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, mobs = {
                { name = "Ooze", level = "38-40", pts = { -81,-41 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Ooze", level = "39-42", pts = { -119,164,-192,142,-182,228,36,69 } },
                { name = "Mousse", level = "62-65", pts = { 49,-96,-62,-168,-83,-220,-130,-184 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Oil Spill", level = "43-45", pts = { -311,251 } },
                { name = "Acid Grease", level = "52-54", pts = { -100,345,-190,355,-99,93 } },
            } },
            { id = 167, zone = "Bostaunieux Oubliette", kind = nil, mobs = {
                { name = "Dark Aspic", level = "52-54", pts = { -96,-111,-129,-170,-60,-100,-99,-180 } },
                { name = "Panna Cotta", level = "95-96", pts = { -62,-275,-39,-296,-50,-327,-24,-344 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Dark Aspic", level = "53-55", pts = { -215,211,-137,149,-95,-28,-133,-74 } },
                { name = "Hinge Oil", level = "65", pts = { 79,-26 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Mousse", level = "64-67", pts = { -72,-8,-52,-10,-47,-32,-72,-31 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Oil Slick", level = "65-69", pts = { 301,-363,147,-185,-384,-140 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Slime Mold", level = "67-70", pts = { 176,58,53,17,-59,24,16,-20 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Mousse", level = "69-71", pts = { 595,210,543,-275 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Mountain Clot", level = "71-75", pts = { 415,-88,417,-40,418,-6,55,170 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Brei", level = "77-78", pts = { -260,-172 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Chalybeous Slime", level = "99-107", pts = { -419,-221,-499,-139,-501,20,-422,18 } },
                { name = "Flavescent Slime", level = "99-107", pts = { -419,-221,-499,-139,-501,20,-422,18 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Igneous Clot", level = "102-106", pts = { 439,275,401,119 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Riverscum", level = "106-109", pts = { 135,-59,97,-52,79,-101,37,-103 } },
            } },
        },
    },
    [543] = {
        name = "Mandibular Bite", level = 44, element = 15, skill = 106,
        family = "Antlion", stats = "INT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Februus", },
        zones = {
            { id = 7, zone = "Attohwa Chasm", kind = nil, more = 6, mobs = {
                { name = "Tracer Antlion", level = "38-40", pts = { 110,-133,178,-207,140,-25,288,216 } },
                { name = "Burrow Antlion", level = "41-44", pts = { 231,172,276,123,405,116,315,-146 } },
                { name = "Hunter Antlion", level = "45-46", pts = { 342,-246,404,-254,512,-230,519,-168 } },
                { name = "Pit Antlion", level = "49-51", pts = { 479,-220,465,-98,468,-28 } },
                { name = "Tracker Antlion", level = "70-73", pts = { -263,-24,-315,-180,-375,-174,-414,-128 } },
                { name = "Trench Antlion", level = "70-71", pts = { -258,-26,-345,-110,-399,-60,-433,114 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Funnel Antlion", level = "?", pts = { -514,-13,-511,39,-487,31,-474,95 } },
                { name = "Aggressor Antlion", level = "90", nm = true, tags = { "NM" }, pts = { -527,112 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Ambuscader Antlion", level = "90", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Ogbunabali", level = "94-95", nm = true, tags = { "NM (pop/scripted)" }, pts = { 134,-89,-285,-114 } },
            } },
            { id = 8, zone = "Boneyard Gully", kind = "Battlefield", mobs = {
                { name = "Tuchulcha", level = "83", tags = { "Scripted spawn" }, pts = { -610,-490,-50,69,430,550 } },
                { name = "Armored Hunter", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -536,-458,-15,97,476,572 } },
                { name = "Shrewd Hunter", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -517,-518,9,114,484,605 } },
                { name = "Swift Hunter", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -545,-416,43,42,509,560 } },
            } },
            { id = 182, zone = "Walk of Echoes", kind = "Battlefield", mobs = {
                { name = "Albino Antlion", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { 277,630 } },
                { name = "Anthracite Antlion", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { 277,630 } },
                { name = "Myrmeleontide", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { 277,630 } },
            } },
        },
    },
    [544] = {
        name = "Cursed Sphere", level = 18, element = 5, skill = 28,
        family = "Fly", stats = "MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Buzzing Fly", },
        zones = {
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Crane Fly", level = "20-21", pts = { 59,65,336,29,177,139,285,228 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Gadfly", level = "20-21", pts = { -466,-484,-404,-330,-262,-270,-146,-205 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Damselfly", level = "20-23", pts = { 631,217,442,202,400,53,276,147 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "May Fly", level = "25-26", pts = { -400,-30,-275,-36,-186,-8,-495,-43 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Sadfly", level = "27-30", pts = { 0,-71,41,-67 } },
                { name = "Gallinipper", level = "32-35", pts = { -147,325,-128,351,21,366,119,382 } },
                { name = "Madfly", level = "87-89", pts = { 156,163,123,161,124,197,159,187 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Sadfly", level = "29-31", pts = { 134,132,64,97,63,174,25,120 } },
                { name = "Tsetse Fly", level = "93-94", pts = { -505,283,-451,308,-524,311,-560,309 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Gallinipper", level = "36-39", pts = { 110,-133,178,-207,137,73,288,216 } },
                { name = "Ogrefly", level = "44-47", pts = { 314,-166,342,-246,357,-212,404,-254 } },
                { name = "Monarch Ogrefly", level = "65-67", pts = { -253,-104,-331,-132,-403,-79,-397,-58 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Hawker", level = "38-48", pts = { 4,-756,-4,-818,64,-731 } },
                { name = "Dragonfly", level = "58-62", pts = { -382,301,-363,274 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Ogrefly", level = "41-44", pts = { 338,-139,424,-99,421,-18,296,46 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Hawker", level = "45-48", pts = { 95,-58,118,-40,153,-42,158,-76 } },
            } },
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Hawker", level = "45-48", pts = { 61,375,-288,-732,-388,-690,-427,-537 } },
                { name = "Darner", level = "84-85", pts = { -105,452,-114,490,-158,548,-102,589 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Hornfly", level = "51-53", pts = { 104,-120,100,-166,101,-210 } },
                { name = "Dragonfly", level = "55-58", pts = { -148,358 } },
                { name = "Dancing Jewel", level = "94-96", pts = { 82,-245,125,-293,2,-238,-46,-262 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Dragonfly", level = "55-60", pts = { -165,613,39,608,-57,732,-98,696 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Dragonfly", level = "58-60", pts = { 549,245,417,185,368,138,-295,316 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Dragonfly", level = "58-60", pts = { 122,-476,121,-506,148,-518,151,-485 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Antlion Fly", level = "63-64", pts = { -216,151,-230,118 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Gadfly", level = "64-68", pts = { -280,-358,-184,-193,-41,-202,34,-276 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Assassin Fly", level = "71-76", pts = { 318,-323,275,-251,197,-181,490,7 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Skimmer", level = "72-74", pts = { 21,-61,22,-30,-15,-64,15,-103 } },
                { name = "Darter", level = "75-78", pts = { -167,-104,-120,-88,-110,-57,-143,-56 } },
            } },
            { id = 154, zone = "Dragons Aery", kind = nil, mobs = {
                { name = "Darter", level = "76-79", pts = { -22,15,-22,38,-19,59,84,39 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Spongilla Fly", level = "78-79", pts = { 423,-326,417,-290,488,-275,482,-324 } },
                { name = "Vauxia Fly", level = "87-89", pts = { -579,-19,-555,-29,-608,-74,-572,-80 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Plateau Glider", level = "79-80", pts = { 42,27,59,107,45,71 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Buzzfly", level = "81-82", pts = { -16,462,-29,525 } },
                { name = "Flame Skimmer", level = "90", pts = { -10,495 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Downy Emerald", level = "99-107", pts = { -239,38,-278,-3,-277,-37,-323,-118 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Broad Scarlet", level = "100-101", pts = { -158,-120,-126,-119,-237,-211,-240,-240 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Bloodspattered Fly", level = "120-123", pts = { 294,-248,348,-220,402,-222,281,-314 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Apex Hornfly", level = "131-134", pts = { 106,-241,77,-252,36,-246,15,-246 } },
                { name = "Locus Hornfly", level = "131-133", pts = { 106,-241,77,-252,36,-246,15,-246 } },
                { name = "Apex Dragonfly", level = "133-135", pts = { -43,-366,-43,-386,-10,-407,26,-395 } },
                { name = "Locus Dragonfly", level = "133-135", pts = { -43,-366,-43,-386,-10,-407,26,-395 } },
            } },
        },
    },
    [545] = {
        name = "Sickle Slash", level = 48, element = 15, skill = 118,
        family = "Spider", stats = "HP-5, MP+15", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Huge Spider", level = "28-31", pts = { 239,78,172,83,113,79,58,75 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Giant Spider", level = "30-34", pts = { 400,-46,368,70,463,102,481,148 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Huge Spider", level = "35-38", pts = { 632,362,691,468,548,469,550,398 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Desert Spider", level = "40-44", pts = { 632,-66,542,0,612,104,460,90 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Giant Spider", level = "50-52", pts = { 764,482,795,516,759,543,768,625 } },
            } },
            { id = 208, zone = "Quicksand Caves", kind = nil, mobs = {
                { name = "Sand Spider", level = "51-55", pts = { 940,-324,868,-309,859,-359,844,-408 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Bark Spider", level = "60-63", pts = { 417,-88,359,-100,298,-74,293,-138 } },
                { name = "Bark Tarantula", level = "75-78", pts = { -219,67,-149,53,-140,88,-183,123 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Recluse Spider", level = "63-66", pts = { -17,62,31,22,-2,118,39,160 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Aht Urhgan Attercop", level = "64-65", pts = { 375,17,323,42,338,88,395,182 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Aht Urhgan Attercop", level = "65-67", pts = { 117,-238,51,27,5,11,-4,-267 } },
            } },
            { id = 154, zone = "Dragons Aery", kind = nil, mobs = {
                { name = "Bark Tarantula", level = "77-80", pts = { -60,-5,-22,15,26,19,96,93 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Shore Spider", level = "79-80", pts = { 220,170,222,203,212,239 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Spinner", level = "79-81", pts = { -96,-256,-52,-258,-19,-258,-54,-212 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Spitting Spider", level = "80-81", pts = { 80,-460,109,-444,96,-399,96,-432 } },
            } },
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Aqueduct Spider", level = "84-85", pts = { 140,-239,180,-167,-21,-74,99,155 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Aqueduct Spider", level = "84-86", pts = { -175,-20,164,59,139,85,147,99 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Colossal Spider", level = "99-107", pts = { -360,80,-320,38,-278,-3,-277,-37 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Skittering Spider", level = "99-107", pts = { 55,21,196,1,301,20,301,-55 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Speckled Spider", level = "102-106", pts = { -202,362,-241,402,-73,314,-46,320 } },
                { name = "Subterrane Spider", level = "102-106", pts = { -202,362,-241,402,-73,314,-46,320 } },
                { name = "Moldmouth Attercop", level = "125-126", pts = { -352,-555,-327,-539,-310,-494 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Mafic Spider", level = "102-104", pts = { -487,-184,-356,-250,-267,-380,-497,-286 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Shade-speckled Spider", level = "107-109", pts = { 104,-80,48,18,-11,61,6,141 } },
            } },
        },
    },
    [547] = {
        name = "Cocoon", level = 8, element = 15, skill = 0,
        family = "Crawler", stats = "VIT+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Crawler", level = "4-6", pts = { 27,-388,-88,-315,140,-245,345,-180 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Crawler", level = "4-8", pts = { -144,-384,50,-170,159,8,319,140 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Canyon Crawler", level = "12-13", pts = { -45,-158,0,-125,94,-36,162,-15 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Crawler", level = "18-21", pts = { 238,223,206,197,83,235,220,244 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Carnivorous Crawler", level = "20-23", pts = { 23,-262,326,-76,424,-238,536,-249 } },
            } },
            { id = 147, zone = "Beadeaux", kind = nil, mobs = {
                { name = "Caterpillar", level = "22-25", pts = { -101,100,-59,20,-224,101 } },
                { name = "Larva", level = "35-38", pts = { 193,166,179,47,323,132,381,101 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Carnivorous Crawler", level = "22-25", pts = { -153,15,-132,17,-51,-7,-102,101 } },
                { name = "Caterchipillar", level = "29-31", pts = { 337,-33,399,-56,421,-152,358,-157 } },
                { name = "Crypterpillar", level = "87-88", pts = { 137,16,248,-156,162,-21,197,-88 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Carnivorous Crawler", level = "22-23", pts = { -216,-282,167,-322,224,-288,362,-17 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Berry Grub", level = "27-28", pts = { -11,-730,49,-724,-119,-631,-79,-587 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, mobs = {
                { name = "Meat Maggot", level = "29-31", pts = { -190,113,-190,166,-246,97,-252,106 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Soldier Crawler", level = "37-41", pts = { -579,113,-624,15,-620,-32,-571,-103 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Worker Crawler", level = "40-44", pts = { 308,-28,220,-32,148,-129,100,-21 } },
                { name = "Soldier Crawler", level = "47-49", pts = { -140,26,34,113,45,95,59,146 } },
                { name = "Rumble Crawler", level = "53-55", pts = { -84,235 } },
                { name = "Knight Crawler", level = "60-63", pts = { -287,-258,-342,-257,-192,229,-243,218 } },
                { name = "King Crawler", level = "91-93", pts = { 82,-245,125,-293,115,-371,72,-405 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Berry Grub", level = "42-52", pts = { -430,-124,-517,-54,-592,-81 } },
                { name = "Worker Crawler", level = "60-63", pts = { -354,-656,-297,-660,-335,-712,-412,-536 } },
                { name = "Champion Crawler", level = "93-94", pts = { -348,139,-415,170,-364,54,-419,44 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Worker Crawler", level = "43-46", pts = { 141,114,-178,-99,-109,-178,-246,-120 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Crawler", level = "50-59", pts = { -364,21,-276,6,-228,48,-151,43 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Knight Crawler", level = "62-67", pts = { 183,-66,178,41,19,100 } },
                { name = "Processionaire", level = "72-75", pts = { -22,-179,-23,-204,-64,-175,-67,-227 } },
                { name = "Mourning Crawler", level = "104-105", pts = { -200,-237,-209,-276,-199,-327 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Defoliator", level = "68-73", pts = { 201,110,234,134,241,97,286,52 } },
                { name = "Deforester", level = "87-89", pts = { -323,76,-287,91 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, more = 3, mobs = {
                { name = "Processionaire", level = "69-71", pts = { -192,189,-197,244,-226,234,-231,195 } },
                { name = "Apex Lugcrawler", level = "129-131", pts = { 129,-221,129,-178 } },
                { name = "Locus Lugcrawler", level = "129-131", pts = { 141,-198 } },
                { name = "Apex Worker Lugcrawler", level = "132-134", pts = { 106,-241,77,-252,36,-246,15,-246 } },
                { name = "Locus Worker Lugcrawler", level = "132-134", pts = { 106,-241,77,-252,36,-246,15,-246 } },
                { name = "Locus Soldier Lugcrawler", level = "134-135", pts = { -43,-366,-43,-386 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Carmine Eruca", level = "70", pts = { -724,203,-751,196 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Magmatic Eruca", level = "71-75", pts = { 56,-262,41,-21,69,-17,58,3 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Magmatic Eruca", level = "71-75", pts = { 294,-322,340,-324,280,-296,271,-246 } },
                { name = "Scoriaceous Eruca", level = "88-89", pts = { -285,225,-294,290 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Date Eruca", level = "72-73", pts = { 31,291 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Ignis Eruca", level = "79-80", pts = { 180,-205,179,-265,206,-240 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Devegetator", level = "81-95", pts = { -306,-598,-272,-600,-241,-610 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Felsic Eruca", level = "102-104", pts = { -166,-116,-127,-332,-267,-380,-284,-314 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Apex Eruca", level = "124-127", pts = { 345,21,421,57 } },
            } },
        },
    },
    [548] = {
        name = "Filamented Hold", level = 52, element = 3, skill = 134,
        family = "Diremite", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Diremite", level = "42-48", pts = { 94,-72,66,-53,-19,-40,-39,-19 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Diremite", level = "42-48", pts = { -146,-20,-142,21,-64,189,-10,46 } },
                { name = "Diremite Stalker", level = "56-59", pts = { 298,-60,-311,-222 } },
                { name = "Diremite Assaulter", level = "63-68", pts = { 182,-296,183,-383,96,-383,96,-298 } },
                { name = "Diremite Dominator", level = "74-77", pts = { -251,392,-310,371,-251,369 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Aydeewa Diremite", level = "70-74", pts = { 104,-17,146,-39,-329,-129,481,363 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Hoarmite", level = "84-87", pts = { 446,237,503,247,501,302,455,308 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Pewter Diremite", level = "99-107", pts = { -421,94,-500,96,-339,18,-453,21 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Tortured Diremite", level = "125", pts = { 501,349,517,306,518,278,259,353 } },
            } },
        },
    },
    [549] = {
        name = "Pollen", level = 1, element = 15, skill = 0,
        family = "Bee", stats = "HP+5, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Bumblebee", level = "1", pts = { -84,-638,-64,-451 } },
                { name = "Giant Bee", level = "7-8", pts = { 52,-68,88,119,363,-102,307,21 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Huge Hornet", level = "1", pts = { 694,420,550,435,386,310 } },
                { name = "Maneating Hornet", level = "3-6", pts = { 381,640,245,662,130,518,202,378 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Huge Hornet", level = "1", pts = { 596,-354,526,-446,295,-265,185,-211 } },
                { name = "Maneating Hornet", level = "3-6", pts = { 236,-317,127,-484,341,-417,112,-338 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Bumblebee", level = "1", pts = { 51,-315,328,48,74,-428 } },
                { name = "Giant Bee", level = "7-8", pts = { 181,249,79,368,233,384,-100,40 } },
            } },
            { id = 145, zone = "Giddeus", kind = nil, mobs = {
                { name = "Giddeus Bee", level = "2-5", pts = { -161,320,-41,319,-66,269,-152,247 } },
                { name = "Digger Wasp", level = "11-13", pts = { 99,-156,164,-151,120,-201,123,-237 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Huge Wasp", level = "9-12", pts = { 303,32,391,148,607,179,365,296 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Huge Wasp", level = "10-12", pts = { -718,443,-463,-138,-321,245,51,222 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Killer Bee", level = "10-12", pts = { 136,-180,-45,-158,197,-27,94,-36 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Digger Wasp", level = "14-17", pts = { -415,526 } },
                { name = "Spider Wasp", level = "19-22", pts = { -333,-164,-308,-229,-307,-266,-287,-373 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Bumblebee", level = "15-17", pts = { 55,406,259,380,227,318,202,328 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Water Wasp", level = "17-18", pts = { 174,-243,383,-20,-163,130,-288,481 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Davoi Hornet", level = "20-23", pts = { 225,-77,220,-120,157,-104,268,-60 } },
                { name = "Davoi Wasp", level = "30-33", pts = { -112,87,-114,24,-151,-2,-115,-30 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Death Wasp", level = "25-26", pts = { 10,-737,-96,-608,-132,-519,-214,-404 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Miner Bee", level = "31-34", pts = { -293,-251,-201,-201,-161,-180,12,-133 } },
                { name = "Death Jacket", level = "37-40", pts = { -516,-18,-441,13,-424,65 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Miner Bee", level = "31-34", pts = { 516,-287,530,-377,475,-417,383,-444 } },
                { name = "Death Jacket", level = "37-40", pts = { 360,187,161,141,118,340,-105,89 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Death Jacket", level = "33-37", pts = { 63,-320,175,-174,203,4,258,43 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Death Jacket", level = "34-37", pts = { -494,183,-539,175,-498,226,-466,272 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Yhoator Wasp", level = "37-40", pts = { -214,174,-181,87,-168,36,-134,39 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Huge Hornet", level = "38-39", pts = { 222,642,286,689,369,654,158,578 } },
                { name = "Maneating Hornet", level = "40-42", pts = { 297,516 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Death Jacket", level = "38-48", pts = { -108,321,-174,244,-274,176,-318,20 } },
                { name = "Death Wasp", level = "38-42", pts = { 167,405,189,326,60,373,81,502 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Death Jacket", level = "40-42", pts = { 261,-40,168,-22,184,-79 } },
                { name = "Soul Stinger", level = "48-50", pts = { 90,230,54,305 } },
                { name = "Wespe", level = "55-57", pts = { -83,181,-85,304 } },
                { name = "Vespo", level = "92-93", pts = { 82,-245,125,-293,115,-371,72,-405 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Wespe", level = "52-55", pts = { 209,18,221,5,103,16,58,-104 } },
                { name = "Temple Bee", level = "60-63", pts = { 219,226,219,208,255,260,264,292 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Volcano Wasp", level = "61-64", pts = { 258,-73,220,-1,216,-128,128,-84 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Worker Pephredo", level = "62-64", pts = { 166,298,243,93,2,-297,-205,-415 } },
                { name = "Soldier Pephredo", level = "64-66", pts = { 161,297,239,92,8,-296,-199,-414 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Wespe", level = "64-66", pts = { -92,172,-61,202,-98,267,-101,317 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Great Wasp", level = "79-80", pts = { -247,-75,-198,-103 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Wasp", level = "80-89", pts = { -120,-308,-174,-345,-225,-381,-190,-434 } },
                { name = "Eschan Mosquito", level = "119", pts = { -285,503,327,-282,612,-173,468,-441 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Javelin Wasp", level = "99-107", pts = { -162,-162,-178,-22 } },
                { name = "Flitting Bee", level = "119-122", pts = { 283,480,271,518,184,413,175,390 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Belaboring Wasp", level = "100-101", pts = { -120,120,-165,202,-41,277,40,242 } },
                { name = "Undergrowth Hornet", level = "100-101", pts = { 3,360,23,347,37,337,40,242 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Fiery Wasp", level = "100-101", pts = { -207,-202,-237,-211,-57,-324,-79,-321 } },
                { name = "Nettled Wasp", level = "100-101", pts = { 178,198,178,163,284,81,317,84 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Grove Wasp", level = "107-109", pts = { 19,95,-16,-47,-118,-2,-135,-86 } },
            } },
        },
    },
    [551] = {
        name = "Power Attack", level = 4, element = 15, skill = 0,
        family = "Beetle", stats = "MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Scarab Beetle", level = "4-7", pts = { 198,63,337,108,290,-47,329,415 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Scarab Beetle", level = "4-7", pts = { -454,366,-406,216,-289,95,-559,275 } },
            } },
            { id = 143, zone = "Palborough Mines", kind = nil, mobs = {
                { name = "Copper Beetle", level = "9-12", pts = { 279,215,296,179,270,119,100,139 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Beady Beetle", level = "15-18", pts = { -435,610,-316,485,-350,581,-327,615 } },
                { name = "Stag Beetle", level = "20-23", pts = { -216,97,-187,6,-156,44,-242,-31 } },
                { name = "Diving Beetle", level = "27-30", pts = { 102,-421,78,-503,102,-576,186,-556 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Scarab Beetle", level = "21-23", pts = { 288,-130,334,-83,366,159,261,193 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Stag Beetle", level = "22-23", pts = { -450,-423,-343,-299,-251,-142,-293,41 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Stag Beetle", level = "22-23", pts = { 59,65,336,29,177,139,285,228 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Dung Beetle", level = "23-26", pts = { -78,156,-55,166,-4,162 } },
                { name = "Goliath Beetle", level = "29-31", pts = { -140,207,-61,66,-121,140 } },
                { name = "Targe Beetle", level = "84-85", pts = { -37,-39,-36,-84,5,-54 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Diving Beetle", level = "27-28", pts = { 297,-119,332,88,52,-156,-90,20 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Goliath Beetle", level = "34-36", pts = { -363,-69,-370,-45,-383,-33,-436,44 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Sand Beetle", level = "36-40", pts = { 368,70,463,102,481,148,406,161 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Borer Beetle", level = "41-44", pts = { -346,305,-280,297,-320,221,-256,209 } },
                { name = "Chamber Beetle", level = "56-58", pts = { -137,60,6,61,83,70 } },
                { name = "Warden Beetle", level = "95-96", pts = { -346,286,-368,257,-297,280,-303,260 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Stag Beetle", level = "42-43", pts = { 106,42,-36,144,4,6,266,153 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Stag Beetle", level = "44-47", pts = { 581,258,622,172,492,228,357,184 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Diving Beetle", level = "44-47", pts = { -257,78,-125,-1,-278,226,-115,106 } },
                { name = "Gouger Beetle", level = "92-94", pts = { 214,336,339,327,446,356 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Nest Beetle", level = "45-47", pts = { -81,-100,-116,-82 } },
                { name = "Blazer Beetle", level = "52-54", pts = { -87,-381,-168,-380,-203,-337 } },
                { name = "Helm Beetle", level = "59-62", pts = { -220,-277,-234,-245 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Forester Beetle", level = "47-50", pts = { -448,368,-482,341,-492,399,-437,394 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Desert Beetle", level = "47-51", pts = { 84,236,-75,241,-179,266,-351,312 } },
            } },
            { id = 208, zone = "Quicksand Caves", kind = nil, mobs = {
                { name = "Helm Beetle", level = "51-58", pts = { 868,-309,844,-408,840,-437,678,-421 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Starmite", level = "65-67", pts = { 120,-81 } },
                { name = "Starborer", level = "96-97", pts = { 41,-185,301,-78 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Deathwatch Beetle", level = "79-81", pts = { 264,121,256,-41,176,-4,103,-7 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Canopycrusher Beetle", level = "100-101", pts = { 420,357,408,333,240,392,242,361 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Locus Armet Beetle", level = "134-136", pts = { 3,-284,38,-281 } },
            } },
        },
    },
    [554] = {
        name = "Death Scissors", level = 60, element = 15, skill = 174,
        family = "Scorpion", stats = "MND+2, CHR+2, HP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 143, zone = "Palborough Mines", kind = nil, mobs = {
                { name = "Mine Scorpion", level = "14-16", pts = { -44,220,257,181,24,69 } },
                { name = "Scimitar Scorpion", level = "19-21", pts = { 257,181,24,69 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Maze Scorpion", level = "25-27", pts = { -41,20,18,170,124,-102 } },
                { name = "Labyrinth Scorpion", level = "30-33", pts = { -24,-8,-49,-45,-104,-41,-101,-102 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Cave Scorpion", level = "30-33", pts = { -222,-194,-86,-63 } },
                { name = "Giant Scorpion", level = "38-40", pts = { 36,-142 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Doom Scorpion", level = "41-44", pts = { 178,-207,340,205,544,-2,421,24 } },
                { name = "Tulwar Scorpion", level = "58-59", pts = { -223,-43,-253,-104 } },
                { name = "Cutlass Scorpion", level = "67-69", pts = { -357,-52,-349,8,-360,60,-394,58 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Doom Scorpion", level = "44-47", pts = { 304,60,65,182,21,265,-59,58 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Doom Scorpion", level = "45-47", pts = { 118,45,-140,-29,62,22 } },
                { name = "Mushussu", level = "53-55", pts = { 47,360 } },
                { name = "Crawler Hunter", level = "60-62", pts = { -134,217,-192,229,-243,218 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Mushussu", level = "51-57", pts = { -1,-131,-80,-52,59,-4,-3,-39 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Tulwar Scorpion", level = "53-56", pts = { 545,259,395,171,84,236,-368,193 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Girtab", level = "58-60", pts = { 18,59,-319,-22 } },
                { name = "Rapier Scorpion", level = "96-98", pts = { 100,-261,140,21 } },
            } },
            { id = 208, zone = "Quicksand Caves", kind = nil, mobs = {
                { name = "Girtab", level = "62-65", pts = { -591,-453,-622,-424,-480,-360,-776,-390 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Scolopendrid", level = "67-70", pts = { -356,57,-247,86,-93,-283,-170,-240 } },
                { name = "Mountain Scolopendrid", level = "78-81", pts = { 31,-132,113,-196,149,-109,169,-150 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Cutlass Scorpion", level = "68-70", pts = { 98,-235,119,-269 } },
                { name = "Den Scorpion", level = "79-81", pts = { 462,297,298,218,257,177,186,176 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Scolopendrid", level = "68-70", pts = { 59,-158,77,-184,102,-205,99,-150 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Diplopod", level = "68-71", pts = { 102,145,63,96,81,121 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Sulfur Scorpion", level = "70-73", pts = { -14,-133,27,-137,-118,-79,-124,-119 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Doom Scorpion", level = "71-74", pts = { 42,357 } },
                { name = "Apex Doom Scorpion", level = "135-138", pts = { 131,-231,16,-231,-53,-253,-55,-342 } },
                { name = "Apex Lugcrawler Hunter", level = "137-139", pts = { -236,-249 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Antares", level = "77-79", pts = { -200,76,-234,146,-203,162 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Antares H", level = "77-79", pts = { -480,-42,-407,283,-285,445,-259,436 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Canyon Scorpion", level = "78-82", pts = { -223,67,-274,57,-220,56,-227,57 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Defile Scorpion", level = "81-82", pts = { -363,-181,-386,-180,-418,-130 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Akrab", level = "82-83", pts = { -176,334,-116,232,192,228,-229,209 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Sedge Scorpion", level = "100-101", pts = { -355,318,-326,316,-459,-367,-461,-386 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Locus Cutlass Scorpion", level = "135-137", pts = { -72,-184,-94,-303,17,-185 } },
            } },
        },
    },
    [555] = {
        name = "Magnetite Cloud", level = 46, element = 3, skill = 112,
        family = "Antica", stats = "VIT+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Antican Auxiliarius", level = "35-39", pts = { 463,102,481,148,406,161,480,212 } },
                { name = "Antican Faber", level = "35-38", pts = { 63,310,-46,258,75,13,69,-49 } },
                { name = "Antican Funditor", level = "35-39", pts = { 170,-9,-54,249,-86,222,75,13 } },
                { name = "Antican Sagittarius", level = "44-49", pts = { 34,-175,-41,-329,-4,-244,-85,-200 } },
                { name = "Antican Centurio", level = "50-52", pts = { 63,-45,49,-78 } },
                { name = "Antican Veles", level = "50-52", pts = { 63,-45 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Antican Essedarius", level = "41-45", pts = { 612,104,460,90,545,259,395,171 } },
                { name = "Antican Eques", level = "45-49", pts = { -212,-138,-50,-100,-38,-225,163,-40 } },
                { name = "Antican Retiarius", level = "45-49", pts = { 84,236,-212,-138,-50,-100,-38,-225 } },
                { name = "Antican Hoplomachus", level = "54-58", pts = { -41,371,-179,266,-337,277,-368,193 } },
                { name = "Antican Lanista", level = "54-58", pts = { -75,241,-41,371,-179,266,-351,312 } },
                { name = "Antican Secutor", level = "54-58", pts = { 84,236,-75,241,-357,-87,-212,-138 } },
            } },
            { id = 208, zone = "Quicksand Caves", kind = nil, more = 1, mobs = {
                { name = "Antican Hastatus", level = "52-59", pts = { 840,-437,775,-462,678,-421,842,-490 } },
                { name = "Antican Princeps", level = "52-59", pts = { 840,-437,775,-462,678,-421,701,-443 } },
                { name = "Antican Signifer", level = "52-59", pts = { 840,-437,775,-462,678,-421,842,-490 } },
                { name = "Antican Aedilis", level = "62-72", pts = { -701,-448,-698,-400,-588,-399,-659,-392 } },
                { name = "Antican Antesignanus", level = "62-72", pts = { -771,-474,-698,-400,-659,-392,-658,-443 } },
                { name = "Antican Quaestor", level = "62-72", pts = { -771,-474,-701,-448,-698,-400,-591,-453 } },
            } },
        },
    },
    [557] = {
        name = "Eyes On Me", level = 61, element = 7, skill = 178,
        family = "Ahriman", stats = "HP-5, MP+15", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Bat Eye", level = "40-42", pts = { -31,-223,-106,-154,56,-84,15,52 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Bat Eye", level = "42-44", pts = { 137,-62 } },
                { name = "Hovering Oculus", level = "90-92", pts = { -78,22,-120,214,-57,202,92,114 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Evil Eye", level = "45-48", pts = { 317,-194,368,-89,183,-145,65,-18 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Evil Eye", level = "46-48", pts = { 327,-19,262,63,212,36,179,19 } },
                { name = "Morbid Eye", level = "52-55", pts = { -138,33,-140,9,-70,22,-60,156 } },
                { name = "Ahriman", level = "63-65", pts = { 33,141,38,-98,-157,141,-150,-99 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, mobs = {
                { name = "Evil Eye", level = "46-48", pts = { -38,-19,-58,-21,-82,-21,-61,143 } },
                { name = "Morbid Eye", level = "52-53", pts = { -274,-23,-301,10 } },
                { name = "Deadly Iris", level = "55-56", pts = { -378,41,-500,89,-500,44 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Fachan", level = "73-75", pts = { 452,193 } },
                { name = "Smolenkos", level = "80-82", pts = { 251,472,136,493,74,427,-286,367 } },
                { name = "Scowlenkos", level = "86-87", pts = { -227,240,-176,240,-220,293,-282,320 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Deep Eye", level = "79-80", pts = { 311,306,379,306,413,292 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Gawper", level = "80-82", pts = { 88,60,112,1,130,-72,51,-133 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Ogler", level = "80-82", pts = { -29,-25,-59,-19,-60,-46,-87,-17 } },
                { name = "Doom Lens", level = "82-83", pts = { -86,8,-81,-52,-381,44 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Ogler", level = "81-82", pts = { -141,32,-137,10,-78,46,-60,145 } },
                { name = "Doom Lens", level = "84-85", pts = { -57,35,-61,52,-22,20,14,-34 } },
            } },
        },
    },
    [560] = {
        name = "Frenetic Rip", level = 63, element = 15, skill = 188,
        family = "Imp", stats = "INT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Horned imps stop using this once their horn is broken.", },
        extra_lists = { },
        zones = {
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Orderly Imp", level = "63-68", pts = { 254,-707,154,-468,228,-136,-419,-596 } },
                { name = "Heraldic Imp", level = "79-82", pts = { 423,-326,417,-290,488,-275,482,-324 } },
                { name = "Locus Imp", level = "134-136", pts = { 852,412,843,376 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Heraldic Imp", level = "72-74", pts = { -14,237,-42,542 } },
                { name = "Seneschal Imp", level = "77-78", pts = { 499,460,-465,343 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Seneschal Imp", level = "77-79", pts = { -118,123,-239,-199,-164,-105,120,156 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Seneschal Imp", level = "77-79", pts = { 20,-125,20,-198,130,-141,134,-138 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Seneschal Imp", level = "77-79", pts = { 324,-208,262,-252,66,-107,158,-181 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Glacial Imp", level = "78-80", pts = { -121,147,-48,134,-174,-149,-256,-119 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Dapifer Imp", level = "79-80", pts = { 348,512,398,521,458,514 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Errand Imp", level = "79-80", pts = { 141,59,141,-20,-40,20 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Errand Imp", level = "79-80", pts = { -32,70,-72,90,-26,108,-7,-110 } },
                { name = "Keep Imp", level = "81-83", pts = { -272,-21,-299,7,-326,-20 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Ruly Imp", level = "80-81", pts = { 166,-227,207,-130,140,-58,186,-74 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Ermit Imp", level = "81-82", pts = { -464,-70,-472,-10,-529,0,-534,30 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Clammy Imp", level = "81-82", pts = { -559,-471,-531,-462,-491,-453,-496,-477 } },
            } },
        },
    },
    [561] = {
        name = "Frightful Roar", level = 50, element = 2, skill = 124,
        family = "Taurus", stats = "AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Taurus", level = "37-38", pts = { 128,-123 } },
                { name = "Stegotaur", level = "44-48", pts = { 118,-1,56,108,178,59,120,203 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Stegotaur S", level = "47-49", pts = { -143,10,-180,29,-140,79,-61,47 } },
                { name = "Teratotaur", level = "57-59", pts = { 97,-38,141,60,140,-60,253,-2 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Brontotaur", level = "68-71", pts = { 350,-263,368,-146,436,-175 } },
                { name = "Tyrannotaur", level = "72-75", pts = { 576,104,477,132,424,194,483,270 } },
                { name = "Molech", level = "79-82", pts = { 251,472,136,493,29,492,-286,367 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Dryptotaur", level = "79-80", pts = { -96,-177,-73,-101,-10,-150,48,-107 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Aestutaur", level = "80-81", pts = { -266,-149,-220,-151,-263,-188,-201,-195 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Gorgotaur", level = "80-82", pts = { -227,52,-279,85,-312,96,-229,-99 } },
                { name = "Tarbotaur", level = "82-83", pts = { -227,52,-349,42 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Titanotaur", level = "83", pts = { -502,78,-502,28 } },
            } },
        },
    },
    [563] = {
        name = "Hecatomb Wave", level = 54, element = 2, skill = 144,
        family = "Demon", stats = "AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, more = 10, mobs = {
                { name = "Demon Pawn", level = "48-52", pts = { 301,18,262,63,212,36,125,19 } },
                { name = "Demon Knight", level = "50-52", pts = { 125,19,70,20,99,43,98,67 } },
                { name = "Demon Warlock", level = "50-52", pts = { -20,77,-22,-37,-80,4 } },
                { name = "Demon Wizard", level = "50-52", pts = { 181,100,180,-60,98,67,97,-18 } },
                { name = "Demon Chancellor", level = "57-59", pts = { -94,173,-1,120,1,-82,-119,120 } },
                { name = "Demon Commander", level = "57-59", pts = { -28,174,-1,120,1,-82,-119,120 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Demon Pawn", level = "48-52", pts = { 234,-164,118,-118,37,-133,59,-198 } },
                { name = "Demon Warlock", level = "50-52", pts = { -132,88 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, mobs = {
                { name = "Demon Knight", level = "52-56", pts = { -59,-48,-239,63,-199,-91,-374,-118 } },
                { name = "Demon Pawn", level = "52-56", pts = { -38,-19,-122,-21,-155,6,-226,-20 } },
                { name = "Demon Warlock", level = "52-56", pts = { -82,-21,-221,80,-188,-79,-360,-133 } },
                { name = "Demon Wizard", level = "52-56", pts = { -60,13,-238,98,-211,-82,-348,-116 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, more = 2, mobs = {
                { name = "Dread Demon", level = "75-77", pts = { 576,104,477,132 } },
                { name = "Gore Demon", level = "75-77", pts = { 477,132,483,270 } },
                { name = "Judicator Demon", level = "75-77", pts = { 576,104,424,194 } },
                { name = "Stygian Demon", level = "75-77", pts = { 424,194,483,270 } },
                { name = "Kindred Black Mage", level = "81-84", pts = { 251,472,136,493,74,427,-286,367 } },
                { name = "Kindred Dark Knight", level = "81-84", pts = { 251,472,136,493,29,492,-286,367 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, more = 6, mobs = {
                { name = "Demon Befouler", level = "80-81", pts = { 100,48,100,-10,-20,73,-22,-32 } },
                { name = "Demon Justiciar", level = "80-81", pts = { 266,57,77,15,126,-59,-20,73 } },
                { name = "Demon Magus", level = "80-81", pts = { 266,57,180,-24,181,-61,220,63 } },
                { name = "Demon Warrior", level = "80-81", pts = { 300,10,220,38,128,16,181,-61 } },
                { name = "Demon Condemner", level = "82-83", pts = { 2,119,3,-78,-123,120,-34,50 } },
                { name = "Demon Corrupter", level = "82-83", pts = { 2,119,3,-78,-123,-79,-25,-10 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, more = 6, mobs = {
                { name = "Demon Befouler", level = "80-81", pts = { -173,11,-235,58,-199,-98,-382,-132 } },
                { name = "Demon Justiciar", level = "80-81", pts = { -219,78,-188,-77,-357,-140,-322,-43 } },
                { name = "Demon Magus", level = "80-81", pts = { -241,101,-219,-84,-343,-123,-276,-41 } },
                { name = "Demon Warrior", level = "80-82", pts = { -135,-15,-227,-21,-196,-57,-354,-100 } },
                { name = "Adjudicator Demon", level = "82-83", pts = { -462,-12,-520,82 } },
                { name = "Berserker Demon", level = "82-83", pts = { -452,109,-514,37 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, more = 2, mobs = {
                { name = "Demon Befouler", level = "80-82", pts = { 188,-158,186,-74,-247,6,-242,-37 } },
                { name = "Demon Justiciar", level = "80-82", pts = { 140,-58,82,-49,15,-125,-274,-40 } },
                { name = "Demon Magus", level = "80-82", pts = { 77,-154,44,-75,-233,24,-242,-37 } },
                { name = "Demon Warrior", level = "80-82", pts = { 347,-70,188,-158,63,-164,-247,6 } },
                { name = "Adjudicator Demon", level = "82-83", pts = { 77,-154,-278,30 } },
                { name = "Berserker Demon", level = "82-83", pts = { 188,-158,-274,-40,-408,65 } },
            } },
        },
    },
    [564] = {
        name = "Body Slam", level = 62, element = 15, skill = 183,
        family = "Dragon", stats = "VIT+1, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Sombra Dragon", "Zahhak", "sombra late", },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Dahak", level = "79-82", pts = { -26,26 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Dahak", level = "81-83", pts = { -434,390,-299,288,-359,349 } },
                { name = "Anantaboga", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { -368,366 } },
            } },
            { id = 135, zone = "Dynamis - Xarcabard", kind = "Dynamis", mobs = {
                { name = "Vanguard Dragon", level = "81-83", pts = { -192,-38,-239,55,-240,-34,-259,-120 } },
                { name = "Yang", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -407,19 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Kulili", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Beist", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 395,-245,353,-67 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Shadowsoul Devourer", level = "70", tags = { "Scripted spawn" }, pts = { 119,-120 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Ash Dragon", level = "82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -273,118 } },
                { name = "Hraun Dragon", level = "95-96", nm = true, tags = { "NM (pop/scripted)" }, pts = { -272,-168,-114,170,8,294 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Hazhdiha", level = "100", nm = true, tags = { "NM" }, pts = { -177,-373 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Kur", level = "100", nm = true, tags = { "NM" }, pts = { 238,468 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Azi Dahakas Dragon", level = "117-118", nm = true, tags = { "NM (pop/scripted)" }, pts = { -7,30 } },
                { name = "Beist", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { -306,420 } },
            } },
            { id = 48, zone = "Al Zahbi", kind = nil, mobs = {
                { name = "Garma", level = "119", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Wicked Dahak", level = "119", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Awoken Tanngrisnir", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { -189,45 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Garma", level = "119", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Wicked Dahak", level = "119", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Dahak", level = "66-68", tags = { "Scripted spawn" } },
                { name = "Ash Dragon", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 63, zone = "Lebros Cavern", kind = "Instance", mobs = {
                { name = "Dahak", level = "75", tags = { "Scripted spawn" } },
            } },
            { id = 134, zone = "Dynamis - Beaucedine", kind = "Dynamis", mobs = {
                { name = "Fire Pukis", level = "82", nm = true, tags = { "NM (pop/scripted)" }, pts = { 290,463 } },
                { name = "Poison Pukis", level = "82", nm = true, tags = { "NM (pop/scripted)" }, pts = { 291,462 } },
                { name = "Wind Pukis", level = "82", nm = true, tags = { "NM (pop/scripted)" }, pts = { 291,463 } },
            } },
            { id = 40, zone = "Dynamis - Buburimu", kind = "Dynamis", mobs = {
                { name = "Barong", level = "82-83", nm = true, tags = { "NM" }, pts = { -92,-176 } },
                { name = "Apocalyptic Beast", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -224,100 } },
                { name = "Lost Barong", level = "100", nm = true, tags = { "NM (pop/scripted)" }, pts = { 446,-322 } },
                { name = "Arch Apocalyptic Beast", level = "105", nm = true, tags = { "NM (pop/scripted)" }, pts = { -224,100 } },
            } },
            { id = 146, zone = "Balgas Dais", kind = "Battlefield", mobs = {
                { name = "Black Dragon", level = "25", nm = true, tags = { "NM (pop/scripted)" }, pts = { -138,-224,22,-24,182,176 } },
            } },
            { id = 139, zone = "Horlais Peak", kind = "Battlefield", mobs = {
                { name = "Dread Dragon", level = "25", nm = true, tags = { "NM (pop/scripted)" }, pts = { -396,-64,-156,116,84,296 } },
                { name = "Dragonian Berzerker", level = "75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -402,-63,-162,117,78,297 } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Ormr", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Tanngrisnir", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Neak", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -589,-1028 } },
            } },
        },
    },
    [565] = {
        name = "Radiant Breath", level = 54, element = 6, skill = 144,
        family = "Wyvern", stats = "HP+5, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Firedrake", level = "41-43", pts = { 505,409,459,481,396,332,246,359 } },
                { name = "Flamedrake", level = "47-49", pts = { -178,-872,-348,-709,-86,723 } },
            } },
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Pyrodrake", level = "50-53", pts = { 612,-501,510,-651,661,-701,472,-781 } },
                { name = "Ignidrake", level = "57-59", pts = { 208,-670,-522,552,-536,702 } },
                { name = "Blazedrake", level = "85-86", pts = { 101,-640,95,-675,-97,-512,-87,-560 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Wyvern", level = "72-75", pts = { 35,198 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Hurricane Wyvern", level = "75-78", pts = { -4,277,-33,272,-2,239,-37,244 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Typhoon Wyvern", level = "78-80", pts = { 157,47,170,74,191,84,-311,-8 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Ajattara", level = "79-83", pts = { -184,25,-141,-89,-210,-149,-247,72 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Ladon", level = "80-82", pts = { 182,-42,135,-143,150,-131 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Watch Wyvern", level = "81-83", pts = { 48,-423,0,-446,-8,-409,1,-362 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Viridis Wyvern", level = "82-83", pts = { 560,180,618,148 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Skoffin", level = "82-83", pts = { -142,-616,-184,-574 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Svelldrake", level = "85-86", pts = { 25,502,80,480,69,419 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Ergdrake", level = "86-87", pts = { -127,-421,-184,-359,-268,-340 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Faunus Wyvern", level = "86-97", pts = { 342,-134,319,-36,370,-21 } },
            } },
        },
    },
    [567] = {
        name = "Helldive", level = 16, element = 15, skill = 22,
        family = "Bird", stats = "CHR+1, HP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Carrion Crow", level = "3-5", pts = { 27,-388,-88,-315,140,-245,345,-180 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Vulture", level = "3-7", pts = { 190,266,-13,135,33,413,-77,286 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Vulture", level = "3-7", pts = { 396,-307,11,-104,40,-246,421,-515 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Carrion Crow", level = "3-6", pts = { -144,-384,50,-170,159,8,319,140 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Akbaba", level = "11-13", pts = { -585,474,-481,344,-502,204,-690,212 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Akbaba", level = "11-13", pts = { -266,-547,199,66,389,493,-409,413 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Vulture", level = "15-18", pts = { 250,253,293,201,190,280,118,305 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Screamer", level = "17-18", pts = { -251,-142,-83,282,106,41,3,-196 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Jubjub", level = "17-18", pts = { -245,-302,-368,-332,-487,-147,-300,38 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Zu", level = "20-24", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Carrion Crow", level = "22-25", pts = { -25,409,-26,176,407,112,338,100 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Ba", level = "27-28", pts = { -114,-36,-37,-53,-60,-154,-71,116 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Ba", level = "33-37", pts = { 266,12,180,21,142,-120,186,66 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Raven", level = "36-38", pts = { 590,814,568,809,493,754 } },
                { name = "Toucan", level = "38-40", pts = { -357,-445,-518,-602,-517,-780,-605,-711 } },
                { name = "Tragopan", level = "71-73", pts = { 285,864,285,838,232,825,128,778 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Carrion Marabou", level = "36-38", pts = { 163,273,200,267,185,246,224,245 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Carrion Crow", level = "38-40", pts = { 736,50,690,9 } },
            } },
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Riverne Vulture", level = "39-42", pts = { 697,-520,720,-675,575,-786,432,-867 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Screamer", level = "40-42", pts = { 197,113,206,-23,178,-115,128,3 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Jubjub", level = "42-45", pts = { 92,-56,2,-29,63,-84,-264,63 } },
                { name = "Mountain Jubjub", level = "61-64", pts = { 335,-254,283,-45 } },
                { name = "Condor", level = "90-93", pts = { -81,-29,-52,-83,-108,-70,-136,-118 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Marsh Murre", level = "64-68", pts = { 82,-674,94,-706,140,-694,76,-547 } },
                { name = "Slough Skua", level = "88-89", pts = { -242,-525,-265,-475,-234,-489 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Vulture", level = "70-79", pts = { 18,40,-24,-122,-21,-87 } },
            } },
            { id = 130, zone = "Ru'Aun Gardens", kind = nil, mobs = {
                { name = "Flamingo", level = "72-74", pts = { -26,-384,25,-386,48,-443,-56,-448 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Geier", level = "74-75", pts = { -438,105,-412,44,-452,69 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Frigatebird", level = "80-81", pts = { 78,-43,101,-91,66,-79,69,-124 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Seaboard Vulture", level = "83-84", pts = { 431,57,462,86,456,270,497,324 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Vinelash Vulture", level = "106-109", pts = { 331,-160,281,-269,241,-299 } },
            } },
        },
    },
    [569] = {
        name = "Jet Stream", level = 38, element = 15, skill = 88,
        family = "Flock Bat", stats = "DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Ding Bats", level = "1-5", tags = { "Evening only" }, pts = { 105,150,282,212,233,261,201,391 } },
            } },
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Spectacled Bats", level = "1-5", tags = { "Evening only" }, pts = { -4,68,-6,2,-140,125,-126,68 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Battue Bats", level = "1-3", pts = { 462,142,382,142,409,58,352,60 } },
                { name = "Troika Bats", level = "78-80", pts = { 264,121,256,-41,240,16,176,-4 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Ding Bats", level = "1-5", tags = { "Evening only" }, pts = { 694,420,550,435,386,310,381,640 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Ding Bats", level = "1-5", tags = { "Evening only" }, pts = { 596,-354,526,-446,295,-265,185,-211 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Ding Bats", level = "1-5", tags = { "Evening only" }, pts = { -289,286,-291,402,-154,186,-454,366 } },
            } },
            { id = 172, zone = "Zeruhn Mines", kind = nil, mobs = {
                { name = "Ding Bats", level = "1-2", pts = { -62,23,-64,61,-25,61,-27,50 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Ding Bats", level = "2-5", tags = { "Evening only" }, pts = { -138,242,-142,214,-91,-64,-117,-97 } },
                { name = "Wind Bats", level = "9-11", pts = { 19,-13,40,19,103,22,140,74 } },
                { name = "Plague Bats", level = "15-17", tags = { "Evening only" }, pts = { 118,55,142,60,163,42,111,213 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Battue Bats", level = "2-4", pts = { 462,-657,464,-696 } },
                { name = "Stink Bats", level = "15-18", pts = { -317,773,-309,740,-379,739 } },
                { name = "Fetor Bats", level = "81-83", pts = { -227,712,-253,698,-284,639,-315,622 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Wind Bats", level = "3-5", pts = { -197,-256,-153,-227 } },
                { name = "Seeker Bats", level = "25-28", pts = { -197,-138,-249,-143,-298,-162,-222,-194 } },
            } },
            { id = 141, zone = "Fort Ghelsba", kind = nil, mobs = {
                { name = "Spectacled Bats", level = "6-8", tags = { "Evening only" }, pts = { -98,107,-100,-15,-52,-55,-57,130 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Gale Bats", level = "8-10", tags = { "Evening only" }, pts = { -718,443,-463,-138,-321,245,-77,124 } },
                { name = "Plague Bats", level = "10-12", pts = { 184,321,274,264,556,371 } },
            } },
            { id = 142, zone = "Yughott Grotto", kind = nil, mobs = {
                { name = "Grotto Bats", level = "8-11", pts = { -225,-94,-200,-104,-164,-90,-115,-62 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Ding Bats", level = "11-13", tags = { "Evening only" }, pts = { 290,138,275,95,546,210,403,391 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Night Bats", level = "12-15", tags = { "Evening only" }, pts = { 811,308,525,329,521,-28,887,-237 } },
                { name = "Sand Bats", level = "12-13", pts = { 749,-229,420,-201,-298,-159,-576,230 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Bulldog Bats", level = "15-20", tags = { "Evening only" }, pts = { -415,526 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Stink Bats", level = "15-18", pts = { -256,-104,-178,4,-132,17,-102,-45 } },
                { name = "Seeker Bats", level = "23-26", pts = { 183,-172,243,56,176,-6,56,16 } },
                { name = "Chaser Bats", level = "84-85", pts = { 83,39,117,71,125,44,128,5 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Night Bats", level = "15-16", tags = { "Evening only" }, pts = { -245,-302,-300,38,-81,-50,-173,-201 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Stink Bats", level = "15-18", pts = { -116,605,-11,579,36,540,60,441 } },
                { name = "Seeker Bats", level = "23-26", pts = { 57,-47,96,0,48,21,-19,44 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Night Bats", level = "15-16", tags = { "Evening only" }, pts = { -466,-484,-404,-330,-262,-270,-146,-205 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, mobs = {
                { name = "Bastion Bats", level = "18-21", pts = { -176,25,-183,-62,-122,3,-125,-43 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Wood Bats", level = "20-23", tags = { "Evening only" }, pts = { 333,-27,300,-22,377,-176 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Seeker Bats", level = "22-26", pts = { 411,179,354,134,314,100,283,97 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Midnight Wings", level = "22-23", tags = { "Evening only" }, pts = { 78,-672,-290,-496,-392,-485,-273,-628 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Midnight Wings", level = "23-24", tags = { "Evening only" }, pts = { 471,-262,424,-260,478,-62,528,139 } },
            } },
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Seeker Bats", level = "25-27", pts = { 463,16,384,-54,342,13,573,20 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Mold Bats", level = "25-27", pts = { -34,22,66,60,80,17 } },
                { name = "Tower Bats", level = "27-29", pts = { -470,-38,-372,-31,-418,20,-356,56 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Ding Bats", level = "26-28", tags = { "Evening only" }, pts = { 632,362,691,468,550,398,662,519 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Dark Bats", level = "26-27", tags = { "Evening only" }, pts = { 96,22,25,-21,139,77,125,152 } },
                { name = "Seeker Bats", level = "26-27", pts = { 106,-300,179,-193,229,-67,-320,456 } },
            } },
            { id = 11, zone = "Oldton Movalpolos", kind = nil, mobs = {
                { name = "Dark Bats", level = "31-35", pts = { -339,433,-334,311,-304,287,-301,218 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Undead Bats", level = "36-39", pts = { 221,293,175,248,96,254,136,212 } },
                { name = "Nightmare Bats", level = "66-69", pts = { 122,-116,152,-127 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Undead Bats", level = "38-40", pts = { -161,-160,-114,-130,-192,-25,-97,35 } },
                { name = "Underworld Bats", level = "50-52", pts = { -68,19,-20,99,22,96,26,143 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Midnight Wings", level = "38-42", tags = { "Evening only" }, pts = { 317,301,344,-354,-430,-124,-517,-54 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Lesser Gaylas", level = "39-42", tags = { "Evening only" }, pts = { 338,-139,460,-357,483,-501,431,-623 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Wingrats", level = "40-42", pts = { -349,266,-328,266,-288,270,-246,265 } },
                { name = "Citadel Bats", level = "46-48", pts = { -178,213,-139,261,-139,185,-293,359 } },
                { name = "Funnel Bats", level = "51-53", pts = { -63,202,-31,143,-58,297,-71,338 } },
                { name = "Fortalice Bats", level = "92-94", pts = { -345,260,-297,280,-254,262,-248,235 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Lesser Gaylas", level = "41-42", pts = { 150,-110,-74,-49,-70,14 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Wingrats", level = "41-49", tags = { "Evening only" }, pts = { -65,-700,50,-653,217,605,199,552 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Wingrats", level = "41-44", pts = { 295,7 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Wingrats", level = "41-44", pts = { 153,-249 } },
            } },
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Canal Bats", level = "41-46", pts = { 66,-53,14,-55,118,-1,-17,176 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Canal Bats", level = "45-47", pts = { -260,243,-176,194,-184,171,-153,131 } },
                { name = "Impish Bats", level = "58-97", pts = { 24,-70,102,-221,132,63,193,58 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Greater Gaylas", level = "46-49", pts = { -174,-219,-128,-186,46,-78,-82,-98 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Greater Gaylas", level = "46-48", pts = { -143,10,-140,79,19,114,60,114 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Midnight Wings", level = "49-52", tags = { "Evening only" }, pts = { 13,140,32,230,221,246,369,178 } },
            } },
            { id = 167, zone = "Bostaunieux Oubliette", kind = nil, mobs = {
                { name = "Funnel Bats", level = "52-55", pts = { -20,-20,-26,-58,-60,-58,-99,-125 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Night Bats", level = "55-57", tags = { "Evening only" }, pts = { 417,185,144,20,-259,-393,-396,-408 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Incubus Bats", level = "61-63", tags = { "Evening only" }, pts = { 42,563,-18,525 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Incubus Bats", level = "62-64", pts = { -54,-62,-20,-8,-28,22,-60,65 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, mobs = {
                { name = "Incubus Bats", level = "62-64", pts = { -344,-30,-251,65,-340,62,-339,-18 } },
            } },
            { id = 12, zone = "Newton Movalpolos", kind = nil, mobs = {
                { name = "Succubus Bats", level = "63-65", pts = { 71,189,-98,65,-67,-101,-14,-89 } },
                { name = "Nightmare Bats", level = "72-74", pts = { 99,-141,37,-19 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Succubus Bats", level = "65-68", pts = { 111,-148,12,-195,63,-194,48,-232 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Night Bats", level = "65-66", tags = { "Evening only" }, pts = { 580,19,590,197,545,-277 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Succubus Bats", level = "65-68", pts = { 417,-318,381,-236,344,-148,420,-141 } },
                { name = "Nightmare Bats", level = "69-72", pts = { 598,102,483,179,494,239,453,413 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Nightmare Bats", level = "68-72", pts = { 81,144,84,124,42,139,27,98 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Volcanic Bats", level = "69-71", pts = { -44,-377,-58,-313,-135,-288,-127,-257 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Bastion Bats", level = "70-72", pts = { -177,24,-182,-66,-107,-15,-63,82 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Wood Bats", level = "71-73", tags = { "Evening only" }, pts = { 191,-79,154,-121 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Slough Bats", level = "80-81", pts = { -127,-275,-127,-343,-169,-356,-130,-308 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "New Moon Bats", level = "99-107", pts = { 196,1,141,95,221,99,301,94 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Echo Bats", level = "101-103", pts = { -278,-403 } },
                { name = "Hemorraghic Bats", level = "119-122", pts = { 340,484,409,520,430,513,421,486 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Balas Bats", level = "102-106", pts = { 281,-203,420,-202,142,-11,258,-71 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Duskprowlers", level = "121-123", pts = { -320,218 } },
                { name = "Apex Bats", level = "128-130", pts = { -60,118,-90,20,12,-87,42,-112 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Depthdiver Bats", level = "124-126", pts = { 95,179,59,196,40,180,130,254 } },
            } },
        },
    },
    [570] = {
        name = "Blood Drain", level = 20, element = 7, skill = 34,
        family = "Bat", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Mouse Bat", level = "2-6", tags = { "Evening only" }, pts = { -454,366,-406,216,-289,95,-567,472 } },
            } },
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Mouse Bat", level = "3-7", tags = { "Evening only" }, pts = { 198,63,337,108,290,-47,329,415 } },
            } },
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Cheiroptera", level = "3-6", pts = { -38,289,24,419,45,367,46,286 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, mobs = {
                { name = "Mouse Bat", level = "3-6", pts = { -141,155,-175,112,-122,99,-190,63 } },
                { name = "Grave Bat", level = "11-13", pts = { 140,74,168,79,128,131,59,183 } },
                { name = "Tomb Bat", level = "17-19", pts = { -104,56 } },
                { name = "Locus Dire Bat", level = "133-135", pts = { -133,-149,-72,-184,-65,-234,-117,-255 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Fledermaus", level = "3-6", tags = { "Evening only" }, pts = { 381,640,245,662,130,518,202,378 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Fledermaus", level = "3-6", tags = { "Evening only" }, pts = { 236,-317,127,-484,341,-417,112,-338 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Blade Bat", level = "4-6", pts = { 373,-20 } },
                { name = "Battle Bat", level = "17-20", pts = { -221,-112,-219,-168,-254,-141,-203,-218 } },
                { name = "Covin Bat", level = "81-83", pts = { 69,27,22,51,83,-63,19,-120 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Blade Bat", level = "4-6", pts = { 533,-627,536,-696 } },
                { name = "Combat", level = "20-23", pts = { -415,609 } },
                { name = "Thorn Bat", level = "82-84", pts = { -410,702,-458,736 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Blade Bat", level = "4-7", pts = { -197,-256,-153,-227,-179,-180 } },
                { name = "Stirge", level = "30-33", pts = { -143,-83,-61,-32,-34,-106,57,-123 } },
                { name = "Bilesucker", level = "87-89", pts = { -78,22,-24,54,-134,41,-201,95 } },
            } },
            { id = 141, zone = "Fort Ghelsba", kind = nil, mobs = {
                { name = "Cheiroptera", level = "8-10", tags = { "Evening only" }, pts = { -98,107,-100,-15,-52,-55,-57,130 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Acro Bat", level = "8-11", tags = { "Evening only" }, pts = { -718,443,-463,-138,-321,245,-77,124 } },
                { name = "Poison Bat", level = "12-14", tags = { "Evening only" }, pts = { 184,321,274,264,556,371 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Mouse Bat", level = "13-15", tags = { "Evening only" }, pts = { 354,197,362,124,491,205,216,43 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Specter Bat", level = "15-20", tags = { "Evening only" }, pts = { -415,526 } },
            } },
            { id = 142, zone = "Yughott Grotto", kind = nil, mobs = {
                { name = "Stealth Bat", level = "15-18", pts = { -83,-52,313,146,318,109,358,102 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Black Bat", level = "17-18", tags = { "Evening only" }, pts = { -245,-302,-300,38,-81,-50,-173,-201 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Hognosed Bat", level = "17-20", pts = { -23,282,-87,258,-136,238,-160,174 } },
                { name = "Ancient Bat", level = "26-28", pts = { -61,66,-121,140,-69,-120,-105,-179 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Black Bat", level = "17-18", tags = { "Evening only" }, pts = { -466,-484,-404,-330,-262,-270,-146,-205 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Star Bat", level = "17-20", tags = { "Evening only" }, pts = { 811,308,525,329,521,-28,887,-237 } },
                { name = "Giant Bat", level = "21-22", pts = { -298,-159,-576,230,-802,28 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, mobs = {
                { name = "Combat", level = "20-23", pts = { -223,-44,-178,4,-132,17,-102,-45 } },
                { name = "Ancient Bat", level = "26-29", pts = { 183,-172,243,56,176,-6,-24,-8 } },
                { name = "Warren Bat", level = "86-88", pts = { 166,-88,197,-88,211,-111,225,-131 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Moon Bat", level = "24-26", tags = { "Evening only" }, pts = { 471,-262,424,-260,478,-62,528,139 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Wolf Bat", level = "25-28", tags = { "Evening only" }, pts = { -20,8,-18,-58,-58,45,-219,3 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Moon Bat", level = "25-26", tags = { "Evening only" }, pts = { 10,-737,-96,-608,-132,-519,-214,-404 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Ancient Bat", level = "26-28", tags = { "Evening only" }, pts = { -327,-408,-196,-372,-135,-292,-120,-453 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Combat", level = "27-30", pts = { 239,78,172,83,113,79,58,75 } },
            } },
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Ancient Bat", level = "27-29", pts = { 463,16,384,-54,342,13,573,20 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Stirge", level = "27-29", pts = { -34,22,66,60,80,17,52,-54 } },
                { name = "Big Bat", level = "29-31", pts = { -481,39,-360,38,-418,20,-372,-52 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Ancient Bat", level = "28-29", tags = { "Evening only" }, pts = { -320,456,-451,415,-520,384 } },
                { name = "Glow Bat", level = "28-29", tags = { "Evening only" }, pts = { 96,22,25,-21,139,77,125,152 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, mobs = {
                { name = "Bulwark Bat", level = "29-31", pts = { 20,-91,31,-197,76,11,20,-14 } },
            } },
            { id = 11, zone = "Oldton Movalpolos", kind = nil, mobs = {
                { name = "Stirge", level = "33-36", pts = { -264,-90,-178,42,-170,-55,-132,-148 } },
            } },
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Vampire Bat", level = "36-38", pts = { 128,-123 } },
                { name = "Hell Bat", level = "44-46", pts = { -39,-19,-3,142,-72,131,-159,-77 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Moon Bat", level = "38-41", tags = { "Evening only" }, pts = { 258,100,-280,-394,-351,-419,-318,-447 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Vampire Bat", level = "40-42", pts = { -91,-76,-152,-81,-123,-54,-38,40 } },
                { name = "Camazotz", level = "52-54", pts = { 0,39,-32,89,-31,109,3,229 } },
                { name = "Balayang", level = "95-97", pts = { 221,90,221,102,159,115,120,153 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Siege Bat", level = "40-43", pts = { -346,305,-280,297,-341,279,-320,221 } },
                { name = "Donjon Bat", level = "91-93", pts = { -346,286,-368,257,-297,280,-303,260 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Vampire Bat", level = "40-45", tags = { "Evening only" }, pts = { 340,-116,10,216,24,316,-40,309 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Vampire Bat", level = "42-44", pts = { 295,7 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Vampire Bat", level = "42-44", pts = { 153,-249 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Vampire Bat", level = "42-45", pts = { 96,-17,178,-35,220,-66 } },
                { name = "Dire Bat", level = "63-66", pts = { -107,-265,-96,-302,-87,-176,-130,-184 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Greater Gayla", level = "43-44", pts = { 150,-110,-74,-49,-70,14 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Hell Bat", level = "44-48", pts = { 46,-78,318,21 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Fledermaus", level = "45-47", tags = { "Evening only" }, pts = { 234,992,328,1032 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Vampire Bat", level = "45-50", pts = { 340,-25,-20,71,-21,19,-47,55 } },
                { name = "Camazotz", level = "52-57", pts = { 271,-67,-391,-208,-340,-186,-330,-175 } },
                { name = "Dire Bat", level = "63-68", pts = { 91,-349,182,-296,183,-383,-299,-253 } },
                { name = "Purgatory Bat", level = "72-76", pts = { -366,363,-389,371,-249,350,-273,368 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Hell Bat", level = "47-49", pts = { -176,194,-184,171,-153,131,-62,100 } },
                { name = "Dire Bat", level = "62-64", pts = { 226,-125,173,-69,121,-138 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Moon Bat", level = "49-51", tags = { "Evening only" }, pts = { 13,140,32,230,221,246,369,178 } },
            } },
            { id = 167, zone = "Bostaunieux Oubliette", kind = nil, mobs = {
                { name = "Werebat", level = "55-59", pts = { -135,-60,-140,-81,-220,-141,-335,-181 } },
                { name = "Blind Bat", level = "95-97", pts = { -62,-275,-24,-292,-50,-327,-14,-226 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Black Bat", level = "55", tags = { "Evening only" }, pts = { 368,138,144,20,-259,-393,-339,-438 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Esbat", level = "59-61", pts = { 38,-386,103,-419,-409,-136,-340,-160 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Dire Bat", level = "60-63", pts = { -1,-40,20,-40,18,-73,18,-104 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Dire Bat", level = "60-63", tags = { "Evening only" }, pts = { 43,-278,-6,-284,-52,-291,-80,-241 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Dire Bat", level = "61-63", tags = { "Evening only" }, pts = { -280,379,-98,628,254,385,-444,-661 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Dire Bat", level = "62-64", pts = { -91,-55,-19,-12,-60,23,-60,65 } },
            } },
            { id = 12, zone = "Newton Movalpolos", kind = nil, mobs = {
                { name = "Dire Bat", level = "63-65", pts = { -139,202,-98,65 } },
                { name = "Purgatory Bat", level = "72-74", pts = { 112,-103,41,20 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, mobs = {
                { name = "Dire Bat", level = "64-66", pts = { -295,20,-274,69 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Sanguine Bat", level = "65-66", tags = { "Evening only" }, pts = { -183,147,-115,-12 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Bulwark Bat", level = "70-72", pts = { -66,-138,-101,-100,-166,62,-60,-60 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Purgatory Bat", level = "70-72", pts = { -44,-377,-58,-313,-135,-288,-127,-257 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Wolf Bat", level = "71-73", tags = { "Evening only" }, pts = { 218,-77,234,-120 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Purgatory Bat", level = "72-73", pts = { 62,118,-59,140 } },
                { name = "Naraka Bat", level = "88-89", pts = { 261,69,258,138,265,180,254,213 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Blood Bat", level = "74-75", pts = { 175,-138,206,-144 } },
            } },
            { id = 172, zone = "Zeruhn Mines", kind = nil, mobs = {
                { name = "Colliery Bat", level = "75-77", pts = { -35,-58,-30,-138,36,-106,-59,-196 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Gore Bats", level = "80-81", pts = { -63,33,-58,0,-4,-25 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Desmodus", level = "80-82", pts = { -226,141,-262,144,-368,-179,-140,-95 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Duskbringer Bat", level = "99-107", pts = { 141,95,221,99,301,94,141,-60 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Macabre Bat", level = "101-103", pts = { -278,-403 } },
                { name = "Esurient Bat", level = "119-122", pts = { 517,306,518,278,475,314,256,340 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Grossular Bat", level = "102-106", pts = { 198,-202,350,-220,335,-190 } },
                { name = "Drearyeyed Bat", level = "125-126", pts = { -308,-458,-391,-418 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Bristlehair Bat", level = "113-116", pts = { 779,120,703,117,717,-217,715,-142 } },
                { name = "Apex Bat", level = "134-136", pts = { 281,301,289,261 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Twilight Bat", level = "121-123", pts = { -307,302 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Soundsplitter Bat", level = "121-124", pts = { -277,-500,-356,-459,-342,-469,-447,-498 } },
                { name = "Grimfang Bat", level = "124-127", pts = { 130,189,22,209,66,148,60,229 } },
            } },
        },
    },
    [572] = {
        name = "Sound Blast", level = 32, element = 0, skill = 70,
        family = "Cockatrice", stats = "None", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Axe Beak", level = "27-28", pts = { -81,-50,-173,-201,-26,-154,110,-159 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Tabar Beak", level = "36-37", pts = { 528,139,386,-14,411,152,403,266 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Cockatrice", level = "50-53", pts = { -2,-157,-1,-131,39,-136,80,-124 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Tabar Beak", level = "52-54", pts = { 93,247,94,299,83,203,143,244 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Axe Beak", level = "66-69", pts = { 478,-147,446,-187,382,-176,349,-100 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Sand Cockatrice", level = "71-74", pts = { -9,139,28,-86,46,-34,8,2 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Ziz", level = "76-78", pts = { 244,-245,202,-237,207,-293,175,-313 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Cluckatrice", level = "78-82", pts = { -94,59,-103,45 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Greater Cockatrice", level = "78-80", pts = { 116,-58,182,-42,150,-131 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Amuckatrice", level = "81-82", pts = { 104,56,154,60 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Dune Cockatrice", level = "83-84", pts = { -98,-217,-79,-150,-138,-160 } },
            } },
        },
    },
    [573] = {
        name = "Feather Tickle", level = 64, element = 2, skill = 193,
        family = "Colibri", stats = "AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Colibri", level = "45-47", pts = { 360,61,285,35,332,68,148,-6 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Lesser Colibri", level = "63-65", pts = { 323,42,274,151,329,235,277,253 } },
                { name = "Colibri", level = "71-73", pts = { 145,338,202,344,110,262,53,267 } },
                { name = "Locus Colibri", level = "133-135", pts = { -550,-67,-519,-54,-544,-47,-606,-30 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Lesser Colibri", level = "63-65", pts = { 669,190,566,214,476,239,402,260 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Colibri", level = "70-71", pts = { 316,-211,342,-218,207,-190,240,-235 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Coastal Colibri", level = "80-81", pts = { 90,102,104,50,45,53,60,14 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Longface Colibri", level = "106-109", pts = { 73,-33,40,-33 } },
            } },
        },
    },
    [574] = {
        name = "Feather Barrier", level = 56, element = 15, skill = 154,
        family = "Greater Bird", stats = "None", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Diatryma", level = "47-50", pts = { -181,296,276,-312,68,-376,-41,-329 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Diatryma", level = "47-51", pts = { -32,487,-40,554,1,585,-84,588 } },
            } },
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Lesser Roc", level = "47-51", pts = { 612,-501,661,-701,474,-542,455,-432 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Phorusrhacos", level = "57-60", pts = { -523,-52,-859,-546,-676,-665 } },
            } },
            { id = 128, zone = "Valley of Sorrows", kind = nil, mobs = {
                { name = "Peryton", level = "69-72", pts = { -120,-15,-57,-39,-15,-30,-37,16 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Gastornis", level = "84-85", pts = { 150,-252,105,-163,40,-90 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Abraxas", level = "85-86", pts = { 364,159,292,181,465,125,487,187 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Stryx", level = "106-109", pts = { -116,53,-119,97,-148,119,280,216 } },
            } },
        },
    },
    [575] = {
        name = "Jettatura", level = 48, element = 7, skill = 118,
        family = "Hippogryph", stats = "MP+15", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Hippogryph", level = "40-42", pts = { 690,-539,715,-678,738,-859,569,-790 } },
                { name = "Cloud Hippogryph", level = "45-47", pts = { 70,380,-602,-569,-723,-335 } },
            } },
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Nimbus Hippogryph", level = "49-52", pts = { 612,-501,510,-651,661,-701,474,-542 } },
                { name = "Strato Hippogryph", level = "55-57", pts = { 261,-508,167,-530,73,-517,-242,727 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Grauberg Hippogryph", level = "73-75", pts = { 10,216,24,316,14,379,-40,309 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Nesting Hippogryph", level = "125", pts = { -238,-339,-181,-355,-313,-421,-204,-470 } },
            } },
        },
    },
    [576] = {
        name = "Yawn", level = 64, element = 6, skill = 193,
        family = "Apkallu", stats = "HP+5, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Arrapago Apkallu", level = "70-72", pts = { 503,51,527,66,422,180,486,177 } },
                { name = "Emperor Apkallu", level = "81-83", pts = { -500,276,-567,296,-614,293,-540,251 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Zhayolm Apkallu", level = "70-74", pts = { 558,-18,605,-19,638,-51,680,-57 } },
                { name = "King Apkallu", level = "78-80", pts = { -548,-187,-589,-152,-650,-158 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Overking Apkallu", level = "79-80", pts = { 174,260,221,299,260,318,198,348 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Canyon Apkallu", level = "106-109", pts = { 314,-240,-241,236,-245,205,-261,156 } },
            } },
        },
    },
    [577] = {
        name = "Foot Kick", level = 1, element = 15, skill = 0,
        family = "Rabbit", stats = "AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Wild Rabbit", level = "1", pts = { 105,150,233,261,201,391 } },
                { name = "Forest Hare", level = "2-6", pts = { 198,63,337,108,290,-47,329,415 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Wild Rabbit", level = "1", pts = { -289,286,-291,402,-154,186 } },
                { name = "Forest Hare", level = "2-6", pts = { -454,366,-406,216,-289,95,-567,472 } },
            } },
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Savanna Rarab", level = "2-6", pts = { -84,-638,-64,-451,27,-388,-88,-315 } },
            } },
            { id = 143, zone = "Palborough Mines", kind = nil, mobs = {
                { name = "Pit Hare", level = "2-6", pts = { 67,61,64,103,30,118,87,169 } },
                { name = "Rabid Rat", level = "11-13", pts = { 180,22,178,-19,261,102,92,138 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Savanna Rarab", level = "2-5", pts = { 51,-315,328,48,-144,-384,50,-170 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Hoarder Hare", level = "6-8", pts = { -116,113,-197,84 } },
                { name = "Wadi Hare", level = "11-14", pts = { -252,25,-318,26,-230,-39 } },
                { name = "Prim Pika", level = "88-90", pts = { -91,398,-145,357,-209,339,-256,309 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Canyon Rarab", level = "7-11", pts = { 115,-577,128,-626,329,-488,-75,-369 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Steppe Hare", level = "8-10", pts = { -585,474,-481,344,-502,204,-690,212 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Forest Hare", level = "11-15", pts = { 366,159,354,197,240,162,270,159 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Savanna Rarab", level = "12-15", pts = { -53,246,-78,219,302,48,197,-11 } },
                { name = "Hispid Rarab", level = "92-93", pts = { -74,-374,-127,-383,-40,-402,-89,-401 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Mighty Rarab", level = "15-18", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Bog Bunny", level = "15-16", pts = { -466,-484,-404,-330,-262,-270,-146,-205 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Sand Hare", level = "15-18", pts = { 811,308,631,217,525,329,442,202 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Blood Bunny", level = "17-19", pts = { -11,579,36,540,39,477,60,441 } },
                { name = "Vorpal Bunny", level = "23-26", pts = { -78,156,-55,166,-4,162 } },
                { name = "Buds Bunny", level = "84-86", pts = { -192,28,-185,4,-125,43,-124,-3 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Vorpal Bunny", level = "27-30", pts = { -436,-653,-454,-540,-492,-445,-501,-422 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Island Rarab", level = "34-36", pts = { 630,855,568,809,488,793,431,825 } },
                { name = "Tropical Rarab", level = "73-76", pts = { 320,870,318,824,285,864,285,838 } },
                { name = "Locus Bight Rarab", level = "135-137", pts = { 120,598,90,567,90,514,127,494 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Variable Hare", level = "58-61", pts = { -226,-426,-195,-498,-138,-397,-235,-363 } },
                { name = "Polar Hare", level = "65-68", pts = { 263,-285,186,-311,270,-355,174,-286 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Bog Bunny", level = "61-64", pts = { -246,-286,-185,-255,343,3,256,-29 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Beach Bunny", level = "62-65", pts = { -169,-256,-204,-215,-178,-158,-168,-100 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Moss Eater", level = "62-66", pts = { 180,-86,205,-58,162,-16,120,48 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Plateau Hare", level = "74-75", pts = { -569,232,-553,195 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Limestone Hare", level = "77-78", pts = { 461,83,430,53,456,75 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Russet Rarab", level = "81-82", pts = { -354,-639,-339,-668 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Twigtrip Lapinion", level = "100-101", pts = { 202,113,201,81,21,-309,24,-288 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Pepper Hare", level = "101-110", pts = { 142,-25 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Lapinion", level = "106-109", pts = { -245,-210,-242,-237,-266,-205,-318,-160 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Leaflick Lapinion", level = "107-109", pts = { 40,419,19,318,-35,208 } },
            } },
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Snowpelt Rabbit", level = "111-113", pts = { 442,-440,270,-281,221,-362,153,-281 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Serac Rabbit", level = "124-127", pts = { 378,396,331,450,328,419,287,381 } },
            } },
        },
    },
    [578] = {
        name = "Wild Carrot", level = 30, element = 15, skill = 64,
        family = "Rabbit", stats = "HP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Island Rarab", level = "34-36", pts = { 630,855,568,809,488,793,431,825 } },
                { name = "Tropical Rarab", level = "73-76", pts = { 320,870,318,824,285,864,285,838 } },
                { name = "Goblins Rarab", level = "29-69", tags = { "Scripted spawn" }, pts = { 412,840,342,869,192,800,118,678 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Variable Hare", level = "58-61", pts = { -226,-426,-195,-498,-138,-397,-235,-363 } },
                { name = "Polar Hare", level = "65-68", pts = { 263,-285,186,-311,270,-355,174,-286 } },
                { name = "Black Coney", level = "70-72", nm = true, tags = { "NM (pop/scripted)" }, pts = { 414,-410 } },
                { name = "White Coney", level = "70-72", nm = true, tags = { "NM (pop/scripted)" }, pts = { 404,-446 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Goblins Rarab", level = "51-54", tags = { "Scripted spawn" }, pts = { -34,50,322,265,319,372,-116,-208 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Mangy-tailed Marvin", level = "85", nm = true, tags = { "NM" }, pts = { -571,252 } },
            } },
        },
    },
    [579] = {
        name = "Voracious Trunk", level = 64, element = 2, skill = 193,
        family = "Marid", stats = "AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Marid", level = "77-78", pts = { 210,370,161,338 } },
                { name = "Grand Marid", level = "79-80", pts = { 161,338 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Marid", level = "77-78", pts = { 125,309,202,286,281,120,180,116 } },
                { name = "Grand Marid", level = "79-80", pts = { 125,309,281,120 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Morose Marid", level = "81-82", pts = { 147,116,126,108,62,79,34,68 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Olyphant", level = "93-95", pts = { -246,373,-361,352,-243,383,-280,375 } },
            } },
        },
    },
    [581] = {
        name = "Healing Breeze", level = 16, element = 15, skill = 22,
        family = "Dhalmel", stats = "HP+10, CHR+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Wild Dhalmel", level = "14-16", pts = { 197,-27,94,-36,23,-15,-126,37 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Bull Dhalmel", level = "21-24", pts = { -73,-158,-5,35,94,-101,83,148 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Marine Dhalmel", level = "34-37", pts = { 590,814,561,782,488,793,452,781 } },
                { name = "Catoblepas", level = "76-77", pts = { 281,804,232,825,232,780,128,778 } },
                { name = "Locus Camelopard", level = "135-137", pts = { 85,541,110,520,166,470,168,414 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Savanna Dhalmel", level = "35-37", pts = { 298,608,320,580,319,546,269,555 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Desert Dhalmel", level = "39-44", pts = { 400,-46,281,97,278,-55,380,-154 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Desert Dhalmel", level = "44-48", pts = { 632,-66,612,104,460,90,545,259 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Dhalmel", level = "60-69", pts = { -458,109,-520,170,-470,242,-403,282 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Camelopardalis", level = "85-86", pts = { -362,90,-467,90 } },
            } },
        },
    },
    [582] = {
        name = "Chaotic Eye", level = 32, element = 2, skill = 70,
        family = "Coeurl", stats = "AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Coeurl", level = "25-26", pts = { 478,134,596,441,582,617,-494,296 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Champaign Coeurl", level = "33-34", pts = { 455,-135,390,116,304,343,132,-33 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Jungle Coeurl", level = "35-38", pts = { 201,242,285,264,297,204,350,177 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Attohwa Coeurl", level = "37-39", pts = { 212,160,479,120,502,49,481,0 } },
                { name = "Master Coeurl", level = "46-48", pts = { 277,-153,324,-203,480,-126,442,-66 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Master Coeurl", level = "44-47", pts = { -93,60,-228,-76,-368,19,-421,58 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Lynx", level = "47-50", pts = { 495,236,484,164,582,184,476,110 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Master Coeurl", level = "47-50", pts = { 228,75,226,44,-246,-120,-316,-117 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Master Coeurl", level = "49-50", pts = { -78,-82,-35,0 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Lynx", level = "49-51", pts = { -259,586,-200,560,-84,511,17,485 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Torama", level = "55-58", pts = { -100,-20,-103,-62,-147,-60,-7,-141 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Coeurl", level = "60-69", pts = { -306,212,-282,224 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Torama", level = "70-73", pts = { -63,131,-126,122,-137,145,69,106 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "War Lynx", level = "71-73", pts = { 37,-173,73,-175,32,-118,87,-117 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Jaguarundi", level = "78-82", pts = { -104,223,1,245 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Chasm Coeurl", level = "79-80", pts = { 131,-38,153,-69,163,-22,197,-65 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Caracal", level = "80-82", pts = { 45,121,-9,90 } },
            } },
        },
    },
    [584] = {
        name = "Sheep Song", level = 16, element = 6, skill = 22,
        family = "Sheep", stats = "HP+5, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Ornery Sheep", level = "5-8", pts = { 381,640,245,662,130,518,202,378 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Ornery Sheep", level = "5-8", pts = { 236,-317,127,-484,341,-417,112,-338 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Wild Sheep", level = "5-8", pts = { -442,65,-287,6,-318,-78,-178,-136 } },
            } },
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Wild Sheep", level = "6-8", pts = { 290,-47,513,140,451,-13,337,-272 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Mad Sheep", level = "9-14", pts = { -198,-193,-354,-226,-462,-61,-304,-86 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Mad Sheep", level = "11-13", pts = { -718,443,-463,-138,-321,245,-77,124 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Wild Sheep", level = "16-18", pts = { 631,197,541,141,494,147,469,94 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Brutal Sheep", level = "20-21", pts = { -450,-423,-343,-299,-251,-142,-293,41 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Brutal Sheep", level = "21-23", pts = { 631,217,525,329,442,202,400,53 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Ornery Sheep", level = "25-28", pts = { 683,422,696,398,596,465,548,469 } },
            } },
            { id = 147, zone = "Beadeaux", kind = nil, mobs = {
                { name = "Charging Sheep", level = "28-30", pts = { -82,-78,-43,-118,-94,-172 } },
                { name = "Broo", level = "39-41", pts = { 42,88,144,196,167,156,208,127 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Tavnazian Sheep", level = "33-37", pts = { -293,-251,-90,-174,-21,-228,-78,-275 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Tavnazian Sheep", level = "33-37", pts = { 516,-287,530,-377,475,-417,383,-444 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Brutal Sheep", level = "39-41", pts = { -266,79,-255,159,-316,131,-279,-96 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Wild Karakul", level = "68-70", pts = { 335,-437,283,-403,324,-377,264,-360 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Black Merino", level = "79-80", pts = { 395,159,510,218,633,274 } },
                { name = "Irate Sheep", level = "79-80", pts = { 489,-153,451,-183,402,-157,431,-160 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Fluffy Sheep", level = "100-101", pts = { 285,282,316,280,-99,182,3,360 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Ulbukan Sheep", level = "100-101", pts = { 80,275,90,361,110,376,-2,400 } },
            } },
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Bedraggled Lucerewe", level = "111-113", pts = { -58,-399,-146,-359,-176,-437,-317,-241 } },
            } },
        },
    },
    [585] = {
        name = "Ram Charge", level = 73, element = 15, skill = 237,
        family = "Ram", stats = "HP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Tremor Ram", level = "22-23", pts = { 4,188,-141,508 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Battering Ram", level = "22-23", pts = { -294,-34,0,-178 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Mosshorn", level = "80-81", pts = { 446,14,492,-13,528,22,475,25 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Hammering Ram", level = "81-82", pts = { 256,65,292,43,258,-26,288,-47 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Tavnazian Ram", level = "82-84", pts = { 372,173 } },
            } },
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Shaggy Ovim", level = "111-113", pts = { -123,-412,-200,-368,-317,-272,-145,-236 } },
            } },
        },
    },
    [587] = {
        name = "Claw Cyclone", level = 20, element = 15, skill = 34,
        family = "Tiger", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Forest Tiger", level = "22-25", pts = { -254,-99,-232,-287,-230,-310,-158,-462 } },
                { name = "Sabertooth Tiger", level = "29-32", pts = { 102,-421,78,-503,102,-576,186,-556 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Forest Tiger", level = "24-25", pts = { -302,-238,-120,82,-17,-284,-52,-653 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Sabertooth Tiger", level = "31-32", pts = { -400,-30,-275,-36,-186,-8,-495,-43 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Sabertooth Tiger", level = "31-32", pts = { 645,-331 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Tundra Tiger", level = "34-37", pts = { -322,-436,-274,-317,-346,-207,-177,-222 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Smilodon", level = "46-48", pts = { 134,132,-188,78,-280,166,-238,80 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "War Smilodon", level = "59-60", pts = { 162,110,207,8,120,57,157,30 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Uleguerand Tiger", level = "61-63", pts = { -226,-426,-195,-498,-138,-397,-478,-40 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Wajaom Tiger", level = "67-69", pts = { 311,204,293,240,278,184,212,294 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Fierce Smilodon", level = "67-70", pts = { 200,267,185,246,52,78,2,70 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Wajaom Tiger", level = "67-69", pts = { 382,-10,-389,281,-412,236,-534,154 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Cave Tiger", level = "73-76", pts = { -355,-397,-349,-420,-371,-466,-318,8 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Fighting Smilodon", level = "75-78", pts = { 288,-259,271,-278,338,-222,238,-301 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Icefang Tiger", level = "77-79", pts = { 108,-239,5,-278,140,-135,233,-114 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Ovinnik", level = "77-79", pts = { 36,-16,75,-22,102,-45,149,-55 } },
                { name = "Machairodus", level = "101-103", pts = { 84,-99,96,-120,92,-146,59,-152 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Angler Tiger", level = "79-80", pts = { -704,170,-711,26,-692,107 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Slaughterous Smilodon", level = "80-81", pts = { -177,-25,-165,31,-187,62,-224,-14 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Sierra Tiger", level = "82-83", pts = { 240,-341,289,-352,346,-336 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Manigordo", level = "85-86", pts = { -533,-42,-479,-26,-367,-54 } },
            } },
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Ashen Tiger", level = "111-113", pts = { -257,240,122,242,14,402,198,103 } },
            } },
        },
    },
    [588] = {
        name = "Lowing", level = 71, element = 0, skill = 227,
        family = "Buffalo", stats = "HP-5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Buffalo", level = "62-65", pts = { -206,-328,-577,-37 } },
                { name = "Giant Buffalo", level = "68-71", pts = { 389,-197 } },
                { name = "King Buffalo", level = "79-82", pts = { -81,32,-290,-46,-257,-89 } },
                { name = "Bonnacon", level = "69", nm = true, tags = { "NM" }, pts = { -577,-37 } },
                { name = "Geush Urvan", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { 564,110 } },
                { name = "Camahueto", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -241,-303,-605,-124,-637,-16 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Bluffalo", level = "83-84", pts = { 374,-236,421,-173,396,-114 } },
                { name = "Audumbla", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 337,-277 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Jajaro", level = "60", tags = { "Scripted spawn" }, pts = { 45,-34 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Jajaro", level = "60", tags = { "Scripted spawn" } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Jajaro", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Jajaro", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Jajaro", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Bonnacon", level = "75-80", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 6, zone = "Bearclaw Pinnacle", kind = "Battlefield", mobs = {
                { name = "Apis", level = "81", tags = { "Scripted spawn" }, pts = { -460,902,-223,503,-624,223 } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Audhumbla", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Himinrjot", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [589] = {
        name = "Dimensional Death", level = 60, element = 15, skill = 174,
        family = "Shadow", stats = "DEX+1, CHR+1, HP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Shadow", level = "44-46", pts = { -7,-96,41,-128,80,-101,96,8 } },
                { name = "Specter", level = "55-58", pts = { 81,118,-40,276,0,318,42,280 } },
            } },
            { id = 195, zone = "The Eldieme Necropolis", kind = nil, mobs = {
                { name = "Shade", level = "46-48", pts = { -32,220,179,-182,92,134 } },
                { name = "Ka", level = "52-54", pts = { -437,402,-440,321,303,17,180,-100 } },
                { name = "Dark Stalker", level = "57-59", pts = { 180,140,60,20,298,64,296,-15 } },
                { name = "Spriggan", level = "64-66", pts = { 400,118,58,23,178,140 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Eastern Spriggan", level = "66-69", pts = { 178,23,292,63,293,-18,299,21 } },
                { name = "Northern Spriggan", level = "66-69", pts = { 178,23,304,64,307,-17,262,20 } },
                { name = "Southern Spriggan", level = "66-69", pts = { 307,54,306,-26,267,55,33,319 } },
                { name = "Western Spriggan", level = "66-69", pts = { 177,17,292,57,292,-23,340,18 } },
            } },
        },
    },
    [591] = {
        name = "Heat Breath", level = 71, element = 0, skill = 227,
        family = "Manticore", stats = "STR+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Lesser Manticore", level = "47-49", pts = { -265,130,-189,64,-318,49,-259,-46 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Desert Manticore", level = "53-57", pts = { -75,241,-41,371,-179,266,-351,312 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Labyrinth Manticore", level = "71-74", pts = { -137,145,-141,168,7,192,35,198 } },
            } },
            { id = 128, zone = "Valley of Sorrows", kind = nil, mobs = {
                { name = "Valley Manticore", level = "71-74", pts = { -2,4 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Greater Manticore", level = "76-79", pts = { 136,355,-208,359,-204,415,-256,446 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Dune Manticore", level = "86-87", pts = { -374,301,-456,272,-401,216,-505,210 } },
            } },
        },
    },
    [592] = {
        name = "Blank Gaze", level = 38, element = 6, skill = 88,
        family = "Opo Opo", stats = "None", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Young Opo-opo", level = "34-36", pts = { -494,183,-539,175,-498,226,-279,63 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Coastal Opo-opo", level = "37-39", pts = { -381,-476,-523,-573,-519,-601,-515,-644 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Young Opo-opo", level = "40-44", pts = { -53,-128,11,-73,-71,-99,-110,-60 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Temple Opo-opo", level = "51-54", pts = { 221,5,202,-19,179,-42,161,-62 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Old Opo-opo", level = "61-65", pts = { 43,-278,-6,-284,-52,-291,-80,-241 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Bullbeggar", level = "78-80", pts = { 351,337,434,299,462,297,340,261 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Brae Opo-Opo", level = "79-80", pts = { 598,153,679,135,732,136 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Wily Opo-opo", level = "79-80", pts = { -42,260,-14,263,23,273 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Natty Gibbon", level = "92-93", pts = { -75,495,-214,564,-250,544,-188,518 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Opo-Opo", level = "107-109", pts = { 612,-173,445,-459,484,-501,486,-473 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Cheeky Opo-opo", level = "107-109", pts = { 48,380,121,463,-20,342,-149,443 } },
            } },
        },
    },
    [593] = {
        name = "Magic Fruit", level = 58, element = 15, skill = 164,
        family = "Opo Opo", stats = "CHR+1, HP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Young Opo-opo", level = "34-36", pts = { -494,183,-539,175,-498,226,-279,63 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Coastal Opo-opo", level = "37-39", pts = { -381,-476,-523,-573,-519,-601,-515,-644 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Young Opo-opo", level = "40-44", pts = { -53,-128,11,-73,-71,-99,-110,-60 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Temple Opo-opo", level = "51-54", pts = { 221,5,202,-19,179,-42,161,-62 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Old Opo-opo", level = "61-65", pts = { 43,-278,-6,-284,-52,-291,-80,-241 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Bullbeggar", level = "78-80", pts = { 351,337,434,299,462,297,340,261 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Brae Opo-Opo", level = "79-80", pts = { 598,153,679,135,732,136 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Wily Opo-opo", level = "79-80", pts = { -42,260,-14,263,23,273 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Natty Gibbon", level = "92-93", pts = { -75,495,-214,564,-250,544,-188,518 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Opo-Opo", level = "107-109", pts = { 612,-173,445,-459,484,-501,486,-473 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Cheeky Opo-opo", level = "107-109", pts = { 48,380,121,463,-20,342,-149,443 } },
            } },
        },
    },
    [594] = {
        name = "Uppercut", level = 38, element = 15, skill = 88,
        family = "Goobbue", stats = "STR+2, DEX+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Goobbue", level = "24-25", pts = { -382,-391,14,-234,368,-93,183,40 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Goobbue Farmer", level = "31-32", pts = { 10,-737,-96,-608,-132,-519,-214,-404 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Goobbue Gardener", level = "40-43", pts = { 483,-501,431,-623,362,-574,421,-18 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Goobbue Farmer", level = "59-61", pts = { 180,191,315,187,402,126,483,-23 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Old Goobbue", level = "65-68", pts = { 162,-16,120,48,68,77,42,124 } },
                { name = "Elder Goobbue", level = "74-77", pts = { -14,3,40,1,78,-37,78,-82 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Goobbue", level = "71-73", pts = { -246,-286,-185,-255,343,3,256,-29 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Hoary Ragwort", level = "78-88", pts = { -524,-128,-468,-92,-378,-78 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Goobbue", level = "80-89", pts = { -120,-308,-174,-345,-225,-381,-313,-421 } },
            } },
        },
    },
    [595] = {
        name = "1000 Needles", level = 62, element = 6, skill = 183,
        family = "Cactaur", stats = "VIT+3, AGI+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Sabotender", level = "42-46", pts = { 170,-9,180,-230,32,200,75,13 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Cactuar", level = "48-53", pts = { 545,259,250,118,84,236,-75,241 } },
            } },
            { id = 208, zone = "Quicksand Caves", kind = nil, mobs = {
                { name = "Sabotender Bailaor", level = "52-59", pts = { 675,-629,600,-679,550,-707,782,-794 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Sabotender Sediendo", level = "64-67", pts = { -3,-82,-23,-61,-43,-37,-54,-2 } },
            } },
        },
    },
    [596] = {
        name = "Pinecone Bomb", level = 36, element = 15, skill = 82,
        family = "Treant", stats = "STR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Languishing Larch", "Splendid Sakura", },
        zones = {
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Walking Tree", level = "27-28", pts = { -251,-142,306,-396,260,241 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Treant", level = "36-37", pts = { -159,426,-637,347 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Walking Tree", level = "48-49", pts = { 305,284,-299,195,348,-333,-314,-127 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Leshy", level = "52-54", pts = { -234,257,-180,251,-210,270,-175,287 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Walking Tree", level = "53-54", pts = { 143,-477,144,-521,280,-482,298,-519 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Knotty Treant", level = "62-65", pts = { -91,-341,-83,-269,122,-408,125,-327 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Mature Treant", level = "70-72", pts = { 157,-422,148,-310,160,-209,168,-134 } },
                { name = "Elder Treant", level = "80-82", pts = { 530,-18,522,-46,475,25,486,90 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Defoliate Treant", level = "71-74", pts = { -243,355,-237,388,-291,506,-316,589 } },
                { name = "Colorful Treant", level = "74-75", pts = { -414,278,-522,-79 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Olden Treant", level = "72-74", pts = { 326,387,230,485,191,510,37,554 } },
                { name = "Colorful Treant", level = "74-75", pts = { 230,485,37,554,81,636,-37,466 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Treant", level = "73-76", pts = { -409,-370,-449,-290,-475,-360,-474,-324 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Highland Treant", level = "78-88", pts = { 229,78,288,95,345,90,282,12 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Barrens Treant", level = "83-84", pts = { -437,-554,-509,-499,-537,-439 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Rift Treant", level = "83-84", pts = { 562,14,536,48,527,-18 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Knobby Treant", level = "100-102", pts = { -442,278,-562,-154 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Verdant Treant", level = "100-102", pts = { -400,82,-402,46,-445,-164,-473,-188 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Droughted Treant", level = "107-109", pts = { 282,-181,409,-227,396,-371,222,-271 } },
            } },
        },
    },
    [597] = {
        name = "Sprout Smack", level = 4, element = 15, skill = 0,
        family = "Sapling", stats = "MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Walking Sapling", level = "3-6", pts = { 190,266,-13,135,33,413,-77,286 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Walking Sapling", level = "3-6", pts = { 396,-307,11,-104,40,-246,421,-515 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Strolling Sapling", level = "7-11", pts = { 115,-577,128,-626,329,-488,-75,-369 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Strolling Sapling", level = "8-13", pts = { -108,-488,294,-381,303,32,391,148 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Strolling Sapling", level = "8-10", pts = { -585,474,-481,344,-502,204,-690,212 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Walking Sapling", level = "12-14", pts = { 382,212,342,265,390,335,250,253 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "15-16", pts = { -450,-423,-343,-299,-251,-142,-293,41 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "15-16", pts = { -245,-302,-368,-332,-487,-147,-300,38 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Stalking Sapling", level = "18-21", pts = { -23,282,-136,238,-160,174,-32,105 } },
                { name = "Slash Pine", level = "27-29", pts = { -98,-65 } },
                { name = "Swagger Spruce", level = "86-88", pts = { -26,41,-25,-9,23,36,29,-7 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Stalking Sapling", level = "23-24", pts = { -400,-30,-275,-36,-186,-8,-495,-43 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Stalking Sapling", level = "24-27", pts = { -19,136,-47,74,-104,81,-132,100 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "26-28", pts = { -436,-653,-510,-574,-492,-445,-501,-422 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "28-30", pts = { -426,458,-227,374,-30,446,107,370 } },
                { name = "Treant Sapling", level = "56-59", pts = { 578,475,700,526,621,496,530,463 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "35-36", pts = { -274,-173,-234,-163,-230,-211,-142,-226 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "36-39", pts = { -411,-814,-266,-716,-204,-698,-170,-672 } },
                { name = "Feyweald Sapling", level = "92-94", pts = { 11,-348,8,-266,-2,-208 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Wandering Sapling", level = "38-41", pts = { 28,75,-91,89,278,232,-215,-80 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Caveberry", level = "42-44", pts = { -7,-82 } },
                { name = "Witch Hazel", level = "50-52", pts = { -36,142,20,236,-26,331 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Leshachikha", level = "49-53", pts = { -294,228,-108,182,-213,270,-134,238 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Treant Sapling", level = "61-63", pts = { 94,-706,110,-733,146,-736,76,-547 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Witch Hazel", level = "62-64", pts = { 43,21,20,4,62,-3,60,62 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Treant Sapling", level = "66-69", pts = { 73,146,53,142,107,98,144,137 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Treant Sapling", level = "66-68", pts = { 435,327,372,381,336,404,289,435 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Treant Sapling", level = "66-68", pts = { -243,355,-237,388,-511,56,-523,-6 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Trotting Sapling", level = "74-75", pts = { -148,-443,368,-152,-302,-365,-327,-329 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Boyahda Sapling", level = "74-77", pts = { -190,20,-219,34,-219,67,-149,53 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Nascent Sapling", level = "107-109", pts = { 409,-227,222,-271,184,-207,-207,93 } },
            } },
        },
    },
    [598] = {
        name = "Soporific", level = 24, element = 7, skill = 46,
        family = "Flytrap", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Flytrap", level = "18-22", pts = { -350,581,-327,615 } },
                { name = "Battrap", level = "23-27", pts = { -216,97,-187,6,-156,44,-242,-31 } },
                { name = "Birdtrap", level = "29-33", pts = { 102,-421,78,-503,102,-576,186,-556 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Battrap", level = "35-37", pts = { 181,-426,143,-477,97,-525,209,-482 } },
            } },
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Hawkertrap", level = "38-41", pts = { 697,-520,575,-786,432,-867,323,-798 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Hawkertrap", level = "40-42", pts = { -15,323,53,285,118,413,122,463 } },
                { name = "Gnoletrap", level = "92-93", pts = { 303,-382,349,-373,328,-424,369,-391 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Puktrap", level = "64-66", pts = { 82,-674,140,-694,81,-629,80,-582 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Puktrap", level = "67-70", pts = { 67,104,108,64,-11,-13,197,132 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Boartrap", level = "81-82", pts = { -40,641,-55,673,-105,670,-68,658 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Lapiniontrap", level = "106-109", pts = { 280,-1,159,45,12,-1,-161,-157 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Saptrap", level = "107-109", pts = { 353,245,281,299,252,420,177,264 } },
            } },
        },
    },
    [599] = {
        name = "Queasyshroom", level = 8, element = 15, skill = 0,
        family = "Funguar", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used by Funguar in their normal form.", },
        extra_lists = { },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Forest Funguar", level = "4-6", pts = { 198,63,337,108,290,-47,509,370 } },
            } },
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Toadstool", level = "4-6", pts = { -52,256,-12,261,-20,295,-65,302 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Forest Funguar", level = "4-6", pts = { -406,216,-289,95,-490,155,-543,-36 } },
            } },
            { id = 143, zone = "Palborough Mines", kind = nil, mobs = {
                { name = "Cave Funguar", level = "9-11", pts = { -60,180,-62,258,-44,220 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Grass Funguar", level = "12-13", pts = { -207,375,599,131,592,-437,478,-425 } },
                { name = "Poison Funguar", level = "14-15", pts = { -334,234,51,222,419,349,436,234 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Poison Funguar", level = "16-19", pts = { -435,610,-482,554,-324,639 } },
                { name = "Marsh Funguar", level = "21-24", pts = { -234,-59,-319,-85,-365,-220,-307,-266 } },
                { name = "Shrieker", level = "28-31", pts = { 38,-562,100,-647,85,-702,90,-790 } },
            } },
            { id = 196, zone = "Gusgen Mines", kind = nil, mobs = {
                { name = "Fly Agaric", level = "20-23", pts = { -22,-181,56,-181 } },
                { name = "Myconid", level = "30-32", pts = { -153,213,-119,241,-138,275,-58,300 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Fly Agaric", level = "21-24", pts = { -23,282,42,441 } },
                { name = "Shrieker", level = "24-27", pts = { -143,257 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Jugner Funguar", level = "24-25", pts = { -358,-338,-233,-203,-236,-107,-308,46 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Marsh Funguar", level = "24-25", pts = { -222,-151,-172,-75,-6,61,-178,150 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Coppercap", level = "41-50", pts = { -82,438,-21,477,-143,444,58,433 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Myxomycete", level = "41-46", pts = { -186,-431,-142,-344,-98,-364,-28,-384 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Jugner Funguar", level = "42-44", pts = { 20,40,-110,102,-299,29,-260,-72 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Killer Mushroom", level = "45-47", pts = { 202,-158 } },
                { name = "Exoray", level = "51-53", pts = { 100,-166,101,-210,-36,142,-81,81 } },
                { name = "Olid Funguar", level = "93-95", pts = { 72,-405,2,-238,-46,-262,-8,-401 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Coppercap", level = "47-49", pts = { 317,301,344,-354,-129,-399,137,-248 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Brasscap", level = "59-61", pts = { 458,366,494,401,609,353,693,390 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Death Cap", level = "60-63", pts = { 313,-39,299,-108,257,-100,199,-163 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Mycohopper", level = "68-71", pts = { -153,47,-410,-322,-358,-204 } },
                { name = "Mycoskulker", level = "89-90", pts = { -121,-33,-127,-75,-77,-86,-69,-45 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Electrumcap", level = "68-70", pts = { -60,118,-73,85 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Electrumcap", level = "68-70", pts = { 595,210,523,-161,543,-275 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Electrumcap", level = "69-71", pts = { -91,-82,-39,-116,-79,-162,-132,-164 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Shadow Funguar", level = "78-88", pts = { -245,90,-173,91,-164,139,-112,141 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Cankercap", level = "79-80", pts = { -340,273,-335,190,-344,272,-343,239 } },
                { name = "Pasture Funguar", level = "79-80", pts = { 49,225,108,256,63,232 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Speltercap", level = "82-83", pts = { -495,168,-477,218,-434,201,-448,237 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Stillwater Funguar", level = "99-107", pts = { -557,-205,-439,-160,-578,-60,-426,-59 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Ferocious Funguar", level = "99-107", pts = { -236,-198,-240,-105,-217,-89,-354,-57 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Ferocious Funguar", level = "101-110", pts = { 47,-360,72,-360,-12,-379 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Foreboding Funguar", level = "102-106", pts = { 297,-257,119,-283,79,-322,39,-323 } },
                { name = "Pallid Funguar", level = "102-106", pts = { 281,-203,198,-202,119,-283,79,-322 } },
                { name = "Moist Funguar", level = "104-109", pts = { 132,121,163,140,134,56 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Bronzecap", level = "107-109", pts = { 353,46,372,-85,442,-97 } },
            } },
        },
    },
    [603] = {
        name = "Wild Oats", level = 4, element = 15, skill = 0,
        family = "Mandragora", stats = "CHR+1, HP+10", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Magh Bihu TVR", },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Tiny Mandragora", level = "1", pts = { -84,-638,-64,-451 } },
                { name = "Mandragora", level = "4-6", pts = { 52,-68,88,119,363,-102,-170,276 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Tiny Mandragora", level = "1", pts = { 51,-315,328,48,74,-428 } },
                { name = "Mandragora", level = "4-5", pts = { 51,107,-66,292,314,333,181,249 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Pygmaioi", level = "8-11", pts = { 128,-626,115,-577,329,-488,-75,-369 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Tiny Lycopodium", level = "10-12", pts = { 329,-9,373,21,338,100,302,48 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Sylvestre", level = "15-19", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "22-25", pts = { -436,-653,-510,-574,-454,-540,-492,-445 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "28-32", pts = { 392,-86,296,-103,200,-38,131,16 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "28-32", pts = { 167,405,189,326,60,373,81,502 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "28-32", pts = { -316,341,-316,280,-304,446,-251,338 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Yuhtunga Mandragora", level = "30-33", pts = { -212,473,-221,405,-218,352,-154,356 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "31-34", pts = { -364,434,-311,409,-541,296,-496,-358 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Yhoator Mandragora", level = "35-37", pts = { -262,157,-264,105,-299,69,-254,59 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Alraune", level = "38-40", pts = { -327,-481,-443,-521,-473,-522,-553,-765 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Mourioche", level = "62-68", pts = { 180,-86,205,-58,215,-62,162,-16 } },
                { name = "Korrigan", level = "72-75", pts = { -37,-92,-15,-123,-124,-34,-166,-45 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Puck", level = "74-77", pts = { 434,299,400,238,461,317,460,326 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Pachypodium", level = "78-82", pts = { 107,-12,129,-27,82,6,161,-45 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Fear Dearg", level = "82-83", pts = { -617,-300,-618,-341,-663,-340,-663,-283 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Hannequet", level = "82-95", pts = { 424,26,428,76,465,-30,438,-53 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Orapodium", level = "84-85", pts = { 655,-496,700,-466,706,-476,706,-443 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Blanched Mandragora", level = "100-101", pts = { 320,113,323,84,324,53,282,-5 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Pinetorum", level = "100-101", pts = { 237,-82,282,-279,364,151,365,129 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Nachtschatten", level = "101-110", pts = { 113,-257,100,-278,59,-323 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Bonaria", level = "101-103", pts = { -103,-133,-100,-120 } },
                { name = "Apex Mandragora", level = "125-127", pts = { 85,-179,18,-267,23,-284 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Fuliginous Mandragora", level = "102-106", pts = { 412,361,458,356,366,196,227,269 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Maca Maca", level = "102-105", pts = { 259,-263,279,-370,307,-441,301,333 } },
            } },
        },
    },
    [604] = {
        name = "Bad Breath", level = 61, element = 3, skill = 178,
        family = "Morbol", stats = "INT+2, MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Malboro", level = "27-28", pts = { -382,-391,14,-234,183,40,-67,345 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, mobs = {
                { name = "Stroper", level = "31-34", pts = { -101,-264 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Ochu", level = "36-37", pts = { 78,-672,-290,-496,-392,-485,-273,-628 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Morbol", level = "37-39", pts = { 97,59,187,-375,171,-378 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Overgrown Rose", level = "45-48", pts = { -571,-103,-297,-1,-98,-105,-246,-374 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Overgrown Rose", level = "47-50", pts = { -189,118,-256,153 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Anemone", level = "51-54", pts = { -130,42,-20,-97,-279,-194,-259,-379 } },
            } },
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Lunantishee", level = "55-58", pts = { 261,-508,167,-530,73,-517,8,738 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Ochu", level = "64-67", pts = { -351,-419,-318,-447,-273,-551,-315,-595 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Ameretat", level = "65-66", pts = { 311,204,329,235,435,327 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Ameretat", level = "66-68", pts = { 382,-10,51,27,5,11,-53,-212 } },
                { name = "Great Ameretat", level = "73-74", pts = { -641,-124,-606,-177,-611,-362,-584,-340 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Morbol Menace", level = "67-70", pts = { -80,102 } },
                { name = "Demonic Rose", level = "75-78", pts = { -219,67,-183,123,-198,202 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Malboro", level = "71-74", pts = { -415,-258,163,-287,164,172 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Great Ameretat", level = "73-76", pts = { -192,-30,-200,-78,-122,-148,-82,-172 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Demonic Rose", level = "74-78", pts = { -475,-491,-478,-443,-510,-446,-537,-465 } },
            } },
            { id = 154, zone = "Dragons Aery", kind = nil, mobs = {
                { name = "Demonic Rose", level = "77-79", pts = { -19,59 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Morboling", level = "79-80", pts = { 83,168,160,180,238,187,322,185 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Morbol", level = "83", pts = { 95,60,182,-368 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Qohanyk", level = "102-104", pts = { 482,78,519,78,244,2,258,-59 } },
                { name = "Anthousai", level = "105-110", pts = { 90,404,49,376,171,385,108,349 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Dwende", level = "125", pts = { 537,-422,201,-438,181,-481 } },
            } },
        },
    },
    [605] = {
        name = "Geist Wall", level = 46, element = 7, skill = 112,
        family = "Eft", stats = "HP-5, MP+10", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Eft", level = "33-35", pts = { 561,782,500,758,481,763,460,724 } },
                { name = "Tartarus Eft", level = "76-77", pts = { 166,828,93,923 } },
                { name = "Locus Hypnos Eft", level = "135-137", pts = { 200,502,217,548,230,529 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Razorback", level = "78-88", pts = { -154,-184,-203,-126,-270,-106 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Canyon Eft", level = "78-82", pts = { 368,-433,375,-407,330,-350 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Terminus Eft", level = "81-82", pts = { 428,174,459,126 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Baleful Tarichuk", level = "99-107", pts = { -516,-43,-500,67 } },
                { name = "Unrelenting Eft", level = "99-107", pts = { -516,-43,-540,21,-454,-59 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Erythemic Eft", level = "101-110", pts = { 239,-202,164,57 } },
                { name = "Rank Eft", level = "120-124", pts = { -479,367,-473,407,-418,319 } },
                { name = "Apex Eft", level = "124-127", pts = { 371,-155,399,-135,395,-159 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Bellicose Tarichuk", level = "102-110", pts = { 403,53,442,40,86,440,115,438 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Tundra Eft", level = "102-104", pts = { 90,-312,108,-388,129,-461,39,-385 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Tarichuk", level = "107-109", pts = { 252,-150,305,-126,376,-167,436,-238 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Irascible Tarichuk", level = "120-123", pts = { 436,-276,322,-317,281,-314,328,-349 } },
                { name = "Unyielding Tarichuk", level = "121-123", pts = { -156,204,-360,182,-363,178,-457,78 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Malodorous Tarichuk", level = "121-123", pts = { -286,-264,-222,-236,-216,-224,-332,-223 } },
                { name = "Talus Tarichuk", level = "124-127", pts = { 376,283,402,279,431,342,423,321 } },
            } },
        },
    },
    [606] = {
        name = "Awful Eye", level = 46, element = 5, skill = 112,
        family = "Bugard", stats = "MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Bugard", level = "34-37", pts = { -90,-174,-21,-228,0,-185,-23,-285 } },
                { name = "Gigantobugard", level = "40-43", pts = { -424,65,-423,195,-392,134,-359,75 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Bugard", level = "34-37", pts = { 530,-377,475,-417,383,-444,473,-337 } },
                { name = "Gigantobugard", level = "40-43", pts = { 99,-194,463,165,508,220,247,188 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Bugard", level = "66-68", pts = { 79,-104,38,-115 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Battle Bugard", level = "78-79", pts = { -248,-71,-280,-76,-159,-161,-126,-159 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Ypotryll", level = "79-80", pts = { 91,268,108,309,91,323,92,374 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Abyssobugard", level = "84-85", pts = { 520,-396,539,-372,529,-323,530,-295 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Deimobugard", level = "94-100", pts = { -151,-93,-148,-15,-138,35,-199,19 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Bugard", level = "107-110", pts = { 305,-126,376,-167,436,-238,362,-293 } },
            } },
        },
    },
    [608] = {
        name = "Frost Breath", level = 66, element = 1, skill = 203,
        family = "Raptor", stats = "INT-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "On VanaDreams only monsters in Uleguerand Range use this move.", },
        extra_lists = { },
        zones = {
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Nival Raptor", level = "68-70", pts = { 263,-285,186,-311,270,-355,382,-405 } },
            } },
        },
    },
    [610] = {
        name = "Infrasonics", level = 65, element = 1, skill = 198,
        family = "Lizard", stats = "INT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Watch Lizard", level = "3-5", pts = { -192,249,-130,260,-107,368,-64,391 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Rock Lizard", level = "4-8", pts = { 130,286,-13,135,-180,204,-400,-68 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Rock Lizard", level = "4-8", pts = { 396,-307,11,-104,40,-246,421,-515 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, mobs = {
                { name = "Rock Lizard", level = "5-8", pts = { -82,26,-74,-79,-164,28,-156,-59 } },
                { name = "Steam Lizard", level = "16-20", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
                { name = "Fume Lizard", level = "87-89", pts = { -252,444,-305,412,-309,444,-374,456 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Mist Lizard", level = "10-12", pts = { -108,-488,294,-381,303,32,391,148 } },
            } },
            { id = 141, zone = "Fort Ghelsba", kind = nil, mobs = {
                { name = "Sentry Lizard", level = "11-14", pts = { 38,53,18,29,41,-16,54,-66 } },
            } },
            { id = 142, zone = "Yughott Grotto", kind = nil, mobs = {
                { name = "Riding Lizard", level = "12-15", pts = { -115,-62,-142,-55,-133,-16,-123,-43 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Hill Lizard", level = "15-19", pts = { 650,-183,749,-229,887,-237,-289,106 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Hill Lizard", level = "21-22", pts = { -245,-302,-368,-332,-487,-147,-300,38 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Rock Lizard", level = "21-24", pts = { -488,105,-444,143,-427,191,-386,176 } },
                { name = "Drachenlizard", level = "92-94", pts = { -493,347,-557,334,-579,296,-617,296 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Hill Lizard", level = "25-26", pts = { 471,-262,424,-260,478,-62,528,139 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "War Lizard", level = "29-32", pts = { 305,-200,269,-234,284,-270,335,-242 } },
                { name = "Geezard", level = "34-37", pts = { -46,-101,25,-104,-79,-273,-31,-215 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Ivory Lizard", level = "32-35", pts = { -140,262,-122,218,-262,115,-379,222 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "White Lizard", level = "36-39", pts = { -262,157,-264,105,-257,28,-339,-8 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Chasm Lizard", level = "40-42", pts = { 421,24,380,81,322,85,278,81 } },
                { name = "Bane Lizard", level = "47-49", pts = { 427,-184,473,-240,484,-186,520,-87 } },
                { name = "Sand Lizard", level = "65-68", pts = { -223,-43,-254,-107,-300,-62,-322,-76 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "War Lizard", level = "40-43", pts = { -82,549,-44,537,16,493 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Maze Lizard", level = "41-43", pts = { 125,-79 } },
                { name = "Labyrinth Lizard", level = "49-51", pts = { 37,200,-3,276 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "War Lizard", level = "41-49", pts = { -482,-765,-411,-814,-404,-634,-366,-531 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Hill Lizard", level = "42-44", pts = { -402,506,-426,458,-263,368,-64,461 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Maze Lizard", level = "43-47", pts = { 340,-25,328,-51,351,-71,114,58 } },
                { name = "Labyrinth Lizard", level = "53-58", pts = { 206,309,227,290,250,349,309,307 } },
                { name = "Snow Lizard", level = "63-68", pts = { 251,350,271,328,247,271,267,252 } },
                { name = "Frost Lizard", level = "73-77", pts = { -249,330,-267,351,-273,390 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Hill Lizard", level = "45-48", pts = { 348,-91,283,-104,316,-152,437,-183 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Labyrinth Lizard", level = "46-49", pts = { -84,-176,-30,-162,-6,-134,46,-78 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Sand Lizard", level = "61-64", pts = { -24,-213,12,-205,31,22,77,-1 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Sand Lizard", level = "62-66", pts = { -169,-256,-204,-215,-178,-158,-168,-100 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Labyrinth Lizard", level = "65-67", pts = { 86,221,-110,218,-34,340,-18,311 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Carriage Lizard", level = "70-72", pts = { 331,-143,262,-343,249,-376,227,-409 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "War Lizard", level = "71-73", pts = { 218,-77,156,-102,246,-123,238,-81 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Ash Lizard", level = "73-76", pts = { 120,123,117,159,52,261,-4,277 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Shadow Lizard", level = "74-75", pts = { 103,-626,19,-504,57,-361,-142,-701 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Tormentor", level = "75-78", pts = { 319,320,347,272,397,297,440,266 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Dusk Lizard", level = "83-84", pts = { 474,-406,455,-426,442,-412,411,-430 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Invidious Lizard", level = "102-106", pts = { -158,-125,-198,-44,-124,-42,-2,89 } },
                { name = "Tunnel Lizard", level = "102-106", pts = { -200,-204,-198,-44,-124,-42,-77,33 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Tephra Lizard", level = "102-104", pts = { 199,-142,248,-191,424,-183,419,-52 } },
                { name = "Petrous Lizard", level = "105-110", pts = { -243,151,-243,42,-172,167,-204,76 } },
            } },
        },
    },
    [611] = {
        name = "Disseverment", level = 72, element = 15, skill = 232,
        family = "Aern", stats = "INT+1, MND-1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 33, zone = "Al'Taieu", kind = nil, mobs = {
                { name = "Ul'aern", level = "70-73", pts = { -7,-547,32,-683 } },
                { name = "Om'aern", level = "75-78", pts = { 561,-528,662,-133,-651,-121,-526,-5 } },
            } },
            { id = 34, zone = "Grand Palace of Hu'Xzoi", kind = nil, mobs = {
                { name = "Aern (any)", level = "79-82", pts = { -358,533,-506,259,-544,257,-410,521 } },
            } },
            { id = 35, zone = "The Garden of Ru'Hmet", kind = nil, mobs = {
                { name = "Aern (any)", level = "81-84", pts = { -545,346,-340,301,-559,242,-499,-461 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Il'aern", level = "115-119", pts = { -2,-259,0,-204,74,-167,114,-185 } },
            } },
        },
    },
    [612] = {
        name = "Actinic Burst", level = 74, element = 6, skill = 242,
        family = "Ghrah", stats = "HP+20, CHR+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 34, zone = "Grand Palace of Hu'Xzoi", kind = nil, mobs = {
                { name = "Eo'ghrah", level = "75-77", pts = { -463,699,-419,733,-368,700,-420,604 } },
            } },
            { id = 35, zone = "The Garden of Ru'Hmet", kind = nil, mobs = {
                { name = "Aw'ghrah", level = "79-82", pts = { -500,251,-339,252,-498,467,-338,467 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Ghrah", level = "115-119", pts = { -390,-126,-359,-152,-379,-86,-393,-15 } },
            } },
        },
    },
    [613] = {
        name = "Reactor Cool", level = 74, element = 15, skill = 242,
        family = "Zdei", stats = "INT+3, MND+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 34, zone = "Grand Palace of Hu'Xzoi", kind = nil, mobs = {
                { name = "Eo'zdei", level = "77-78", pts = { -460,740,-380,660,-420,757,-60,500 } },
            } },
            { id = 35, zone = "The Garden of Ru'Hmet", kind = nil, mobs = {
                { name = "Aw'zdei", level = "80-83", pts = { -580,140,-700,460,-420,660,-140,460 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Zdei", level = "81-89", pts = { 15,-416,-32,-369,30,-377,35,-462 } },
            } },
        },
    },
    [614] = {
        name = "Saline Coat", level = 72, element = 15, skill = 232,
        family = "Xzomit", stats = "MP+5, STR+2, DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 33, zone = "Al'Taieu", kind = nil, mobs = {
                { name = "Ul'xzomit", level = "68-71", pts = { -7,-547,-71,-696,32,-683,144,-599 } },
                { name = "Om'xzomit", level = "72-76", pts = { 524,-361,623,-283,662,-133,-533,-402 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Abxzomit", level = "79-80", pts = { -481,109,-480,178 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Xzomit", level = "115-119", pts = { -274,371,-200,330,-258,288,-135,366 } },
            } },
        },
    },
    [615] = {
        name = "Plasma Charge", level = 75, element = 15, skill = 247,
        family = "Phuabo", stats = "STR+3, DEX+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 33, zone = "Al'Taieu", kind = nil, mobs = {
                { name = "Ul'phuabo", level = "75-77", pts = { -18,-532,36,-538,-58,-679,28,-699 } },
                { name = "Om'phuabo", level = "79-81", pts = { 632,-306,652,-235,638,-194,586,-32 } },
                { name = "Ru'phuabo", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { 478,-566 } },
                { name = "Jailer of Hope", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -682,-77 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Phuabo", level = "112-115", pts = { 70,-206,74,-167,114,-185,-68,-200 } },
                { name = "Warders Phuabo", level = "123", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Warder of Hope", level = "124", nm = true, tags = { "NM (pop/scripted)" }, pts = { -79,-198 } },
            } },
            { id = 143, zone = "Palborough Mines", kind = nil, mobs = {
                { name = "Mind-warped Scorpion", level = "139", nm = true, tags = { "NM (pop/scripted)" }, pts = { 95,-61 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Tristitia", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [616] = {
        name = "Temporal Shift", level = 73, element = 4, skill = 237,
        family = "Hpemde", stats = "HP+10, MP+15", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 33, zone = "Al'Taieu", kind = nil, mobs = {
                { name = "Ul'hpemde", level = "68-72", pts = { 39,-550,-47,-535,-71,-696,32,-683 } },
                { name = "Om'hpemde", level = "73-77", pts = { 524,-361,489,-466,623,-283,638,-170 } },
                { name = "Qnhpemde", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { 480,-561 } },
                { name = "Jailer of Prudence", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { 706,24 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Hpemde", level = "115-119", pts = { 241,330,258,291,202,333,137,369 } },
                { name = "Warders Hpedme", level = "123-124", tags = { "Scripted spawn" } },
                { name = "Warder of Prudence", level = "124", nm = true, tags = { "NM (pop/scripted)" }, pts = { 373,256 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Ketea", level = "85-87", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [617] = {
        name = "Vertical Cleave", level = 75, element = 15, skill = 247,
        family = "Euvhi", stats = "STR+1, HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 34, zone = "Grand Palace of Hu'Xzoi", kind = nil, mobs = {
                { name = "Eo'euvhi", level = "74-77", pts = { -388,700,-452,700,-100,492,-100,428 } },
            } },
            { id = 33, zone = "Al'Taieu", kind = nil, mobs = {
                { name = "Aw'euvhi", level = "78-80", pts = { 300,441,-131,587,134,719,-329,438 } },
            } },
            { id = 35, zone = "The Garden of Ru'Hmet", kind = nil, mobs = {
                { name = "Aw'euvhi", level = "78-82", pts = { -547,293,-547,467,-467,507,-373,507 } },
            } },
        },
    },
    [618] = {
        name = "Blastbomb", level = 18, element = 0, skill = 28,
        family = "Orcish Warmachine", stats = "STR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Orcish Stonelauncher", level = "8-10", pts = { -15,114,15,-34,-86,25,-86,134 } },
                { name = "Orcish Wallbreacher", level = "15-16", pts = { 18,460 } },
                { name = "Orcish Barricader", level = "17-18", pts = { 18,460 } },
            } },
            { id = 141, zone = "Fort Ghelsba", kind = nil, mobs = {
                { name = "Orcish Flamethrower", level = "16-18", pts = { -26,-80,-32,125,73,84,53,22 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Orcish Stonelauncher", level = "37-40", pts = { -23,-285 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Orcish Firebelcher", level = "39-42", pts = { 269,-234,-58,45 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Orcish Stonelauncher", level = "43-46", pts = { 463,165,247,188,-11,13,20,331 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Orcish Firebelcher", level = "81-83", pts = { -60,28 } },
            } },
        },
    },
    [620] = {
        name = "Battle Dance", level = 12, element = 15, skill = 10,
        family = "Orc", stats = "DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Crusader", "Bozzetto Duelist", "Bozzetto Pugilist", "Bozzetto Reaver", "Bozzetto Tamer", "Bozzetto Warlock", },
        zones = {
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Orcish Fodder", level = "3-8", pts = { 198,63,337,108,290,-47,451,-13 } },
                { name = "Orcish Grappler", level = "3-8", pts = { 222,14,290,-47,451,-13,337,-272 } },
                { name = "Orcish Mesmerizer", level = "3-8", pts = { 222,14,290,-47,451,-13,337,-272 } },
            } },
            { id = 140, zone = "Ghelsba Outpost", kind = nil, mobs = {
                { name = "Orcish Fodder", level = "3-9", pts = { -4,68,-6,2,-37,39,-56,100 } },
                { name = "Orcish Grappler", level = "3-9", pts = { -4,68,-6,2,-17,39,-37,39 } },
                { name = "Orcish Mesmerizer", level = "3-9", pts = { -4,68,-6,2,-37,39,-140,125 } },
                { name = "Orcish Grunt", level = "11-15", pts = { 49,-40,45,367,46,286,96,333 } },
                { name = "Orcish Neckchopper", level = "11-15", pts = { 45,367,46,286,96,333,118,322 } },
                { name = "Orcish Stonechucker", level = "11-15", pts = { 45,367,46,286,96,333,118,322 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Orcish Fodder", level = "3-7", pts = { -454,366,-406,216,-293,137,-289,95 } },
                { name = "Orcish Grappler", level = "3-8", pts = { -454,366,-406,216,-567,472,-714,573 } },
                { name = "Orcish Mesmerizer", level = "4-8", pts = { -505,496,-567,472,-714,573,-657,547 } },
            } },
            { id = 141, zone = "Fort Ghelsba", kind = nil, more = 2, mobs = {
                { name = "Orcish Fodder", level = "8-10", pts = { -98,107,-100,-15,-85,-60,-19,-113 } },
                { name = "Orcish Grappler", level = "8-10", pts = { -98,107,-100,-15,-85,-60,-19,-113 } },
                { name = "Orcish Mesmerizer", level = "8-10", pts = { -98,107,-100,-15,-85,-60,-19,-113 } },
                { name = "Orcish Grunt", level = "11-17", pts = { 38,147,161,164,214,156,145,108 } },
                { name = "Orcish Neckchopper", level = "11-17", pts = { 38,147,161,164,214,156,145,108 } },
                { name = "Orcish Stonechucker", level = "11-17", pts = { 38,147,90,147,161,164,145,108 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Orcish Fodder", level = "8-10", pts = { -542,361,-620,66,-294,-34,0,-178 } },
                { name = "Orcish Grappler", level = "8-10", pts = { -542,361,-620,66,-247,-106,0,-178 } },
                { name = "Orcish Mesmerizer", level = "8-10", pts = { -542,361,-620,66,-294,-34,0,-178 } },
                { name = "Orcish Grunt", level = "12-13", pts = { -620,66,-294,-34,0,-178,467,57 } },
                { name = "Orcish Neckchopper", level = "12-13", pts = { -620,66,-294,-34,0,-178,467,57 } },
                { name = "Orcish Stonechucker", level = "12-13", pts = { -620,66,-294,-34,0,-178,280,64 } },
            } },
            { id = 142, zone = "Yughott Grotto", kind = nil, mobs = {
                { name = "Orcish Grunt", level = "14-18", pts = { -225,-94,-200,-104,-164,-90,-142,-55 } },
                { name = "Orcish Neckchopper", level = "14-18", pts = { -225,-94,-200,-104,-164,-90,-142,-55 } },
                { name = "Orcish Stonechucker", level = "14-18", pts = { -225,-94,-200,-104,-164,-90,-142,-55 } },
                { name = "Orcish Cursemaker", level = "21-23", pts = { 151,64,149,113,200,61,212,106 } },
                { name = "Orcish Fighter", level = "21-23", pts = { 151,64,149,113,200,61,212,106 } },
                { name = "Orcish Serjeant", level = "21-23", pts = { 405,117,359,172 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Orcish Grunt", level = "16-20", pts = { -350,581,-415,526 } },
                { name = "Orcish Neckchopper", level = "16-20", pts = { -350,581,-327,615,-415,526 } },
                { name = "Orcish Stonechucker", level = "16-20", pts = { -350,581,-327,615,-415,526 } },
                { name = "Orcish Cursemaker", level = "21-25", pts = { -216,97,-254,-99 } },
                { name = "Orcish Fighter", level = "21-25", pts = { -216,97,-187,6,-254,-99 } },
                { name = "Orcish Serjeant", level = "21-25", pts = { -197,60,-187,6 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Orcish Grunt", level = "16-17", pts = { -302,-238,-17,-284,-175,-459,88,-369 } },
                { name = "Orcish Neckchopper", level = "16-17", pts = { -302,-238,-17,-284,-175,-459,88,-369 } },
                { name = "Orcish Stonechucker", level = "16-17", pts = { -302,-238,-17,-284,-175,-459,88,-369 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, more = 13, mobs = {
                { name = "Orcish Cursemaker", level = "22-27", pts = { 225,-77,220,-120,157,-104,324,-60 } },
                { name = "Orcish Fighter", level = "22-26", pts = { 225,-77,220,-120,157,-104,324,-60 } },
                { name = "Orcish Serjeant", level = "22-28", pts = { 220,-120,157,-104,324,-60,300,-22 } },
                { name = "Orcish Impaler", level = "32-36", pts = { 305,-200,269,-234,284,-270,335,-242 } },
                { name = "Orcish Beastrider", level = "33-37", pts = { 305,-200,269,-234,335,-242,34,-20 } },
                { name = "Orcish Nightraider", level = "34-38", pts = { 305,-200,269,-234,284,-270,335,-242 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, more = 1, mobs = {
                { name = "Orcish Cursemaker", level = "26-27", pts = { -358,244,-231,230,27,195,195,155 } },
                { name = "Orcish Fighter", level = "26-27", pts = { -358,244,-231,230,-138,304,27,195 } },
                { name = "Orcish Serjeant", level = "26-27", pts = { -358,244,-231,230,27,195,195,155 } },
                { name = "Orcish Beastrider", level = "30-31", pts = { -358,244,-231,230,27,195,195,155 } },
                { name = "Orcish Brawler", level = "30-31", pts = { -138,304,-347,256,-231,230,27,195 } },
                { name = "Orcish Impaler", level = "30-31", pts = { -358,244,-231,230,27,195,195,155 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, more = 2, mobs = {
                { name = "Orcish Beastrider", level = "35-38", pts = { -21,-228,105,-52,56,27,162,-158 } },
                { name = "Orcish Brawler", level = "35-38", pts = { -21,-228,105,-52,162,-158 } },
                { name = "Orcish Impaler", level = "35-38", pts = { -21,-228,105,-52,56,27,162,-158 } },
                { name = "Orcish Nightraider", level = "35-38", pts = { -21,-228,105,-52,56,27,162,-158 } },
                { name = "Orcish Bowshooter", level = "41-44", pts = { -392,134,-147,94,-174,23 } },
                { name = "Orcish Footsoldier", level = "41-44", pts = { -392,134,-217,117,-106,20,-144,-59 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Orcish Bowshooter", level = "41-44", pts = { 463,165,247,188,230,304,69,-113 } },
                { name = "Orcish Footsoldier", level = "41-44", pts = { 247,188,230,304,69,-113,-55,18 } },
                { name = "Orcish Gladiator", level = "41-44", pts = { 261,179,69,-113,-55,18,98,45 } },
                { name = "Orcish Trooper", level = "41-44", pts = { 463,165,247,188,230,304,78,-54 } },
            } },
            { id = 150, zone = "Monastic Cavern", kind = nil, more = 7, mobs = {
                { name = "Orcish Bowshooter", level = "42-46", pts = { -10,-378,-39,-318,1,-320,200,42 } },
                { name = "Orcish Footsoldier", level = "43-47", pts = { -10,-378,-39,-318,1,-320,200,42 } },
                { name = "Orcish Gladiator", level = "44-48", pts = { -10,-378,-39,-318,1,-320,200,42 } },
                { name = "Orcish Trooper", level = "45-49", pts = { -10,-378,-39,-318,1,-320,200,42 } },
                { name = "Orcish Veteran", level = "52-56", pts = { -39,-318,1,-320,4,-272,41,-280 } },
                { name = "Orcish Predator", level = "53-57", pts = { -39,-318,1,-320,4,-272,41,-280 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Orcish Bowshooter", level = "47-49", pts = { 10,-93,-9,-37,22,-41,-40,-58 } },
                { name = "Orcish Footsoldier", level = "47-49", pts = { 10,-93,-9,-37,22,-41,-40,-58 } },
                { name = "Orcish Gladiator", level = "47-49", pts = { 10,-93,-9,-37,22,-41,-40,-58 } },
                { name = "Orcish Trooper", level = "47-49", pts = { 10,-93,-9,-37,22,-41,-40,-58 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, more = 2, mobs = {
                { name = "Orcish Bowshooter", level = "47-49", pts = { -26,-103,-10,-111,-59,-98,-70,-110 } },
                { name = "Orcish Footsoldier", level = "47-49", pts = { -26,-103,-10,-111,-59,-98,-70,-110 } },
                { name = "Orcish Gladiator", level = "47-49", pts = { -26,-103,-10,-111,-59,-98,-70,-110 } },
                { name = "Orcish Trooper", level = "47-49", pts = { -26,-103,-10,-111,-59,-98,-70,-110 } },
                { name = "Orcish Predator", level = "50-52", pts = { -96,-138,-112,-150,-20,-137,-29,-151 } },
                { name = "Orcish Veteran", level = "50-52", pts = { -96,-138,-112,-150,-20,-137,-29,-151 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Orcish Fodder", level = "62-64", pts = { 460,-471,358,-317,326,-346 } },
                { name = "Orcish Mesmerizer", level = "62-64", pts = { 460,-471,358,-317 } },
                { name = "Orcish Neckchopper", level = "62-64", pts = { 460,-471,358,-317,326,-346 } },
                { name = "Orcish Stonechucker", level = "62-64", pts = { 460,-471,326,-346 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Orcish Brawler", level = "65-69", pts = { -584,101,-618,149,-672,168,-708,133 } },
                { name = "Orcish Chasseur", level = "65-69", pts = { -584,101,-618,149,-654,192,-672,168 } },
                { name = "Orcish Impaler", level = "65-69", pts = { -584,101,-618,149,-642,192 } },
                { name = "Orcish Trooper", level = "65-69", pts = { -642,192,-672,168,-708,133 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Orcish Brawler", level = "67-69", pts = { 340,-126,340,-154,278,-139 } },
                { name = "Orcish Chasseur", level = "67-69", pts = { 340,-126,340,-154,278,-139 } },
                { name = "Orcish Cursemaker", level = "67-69", pts = { 340,-126,340,-154,339,-138 } },
                { name = "Orcish Trooper", level = "67-69", pts = { 340,-126,340,-154,339,-138 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Orcish Footsoldier", level = "71-74", pts = { -444,-328,-474,-324,-476,-350,-449,-476 } },
                { name = "Orcish Gladiator", level = "71-74", pts = { -409,-370,-444,-328,-476,-350,-509,-482 } },
                { name = "Orcish Hexspinner", level = "71-74", pts = { -409,-370,-474,-324,-476,-350,-449,-476 } },
                { name = "Orcish Zerker", level = "71-74", pts = { -409,-370,-444,-328,-474,-324,-449,-476 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, more = 1, mobs = {
                { name = "Orcish Augur", level = "76-79", pts = { -3,-102,-3,-44,-27,-60 } },
                { name = "Orcish Bowshooter", level = "76-78", pts = { -3,-102,2,-73,-40,-62 } },
                { name = "Orcish Champion", level = "76-79", pts = { -3,-102,-3,-44,2,-73 } },
                { name = "Orcish Dragonbrander", level = "76-78", pts = { -3,-44,-54,-60 } },
                { name = "Orcish Protector", level = "76-79", pts = { -3,-102,2,-73,18,-43 } },
                { name = "Orcish Veteran", level = "76-78", pts = { 2,-73,18,-43,-40,-62 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Orcish Bowshooter", level = "76-79", pts = { -197,-146,263,60,-122,83,133,-88 } },
                { name = "Orcish Champion", level = "76-79", pts = { -146,-409,-187,-441,-67,-198,45,-240 } },
                { name = "Orcish Dragonbrander", level = "76-79", pts = { -146,-409,-187,-441,-162,-473,-67,-198 } },
                { name = "Orcish Protector", level = "76-79", pts = { -163,-447,244,-532,240,-555 } },
                { name = "Orcish Veteran", level = "76-79", pts = { -146,-409,-162,-473,-163,-447,0,-200 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, more = 8, mobs = {
                { name = "Orcish Augur", level = "76-79", pts = { 156,-102,227,-121,334,-58,300,-22 } },
                { name = "Orcish Bowshooter", level = "76-79", pts = { 309,-57,333,-142,379,-180,278,-276 } },
                { name = "Orcish Champion", level = "76-79", pts = { 154,-121,246,-123,164,-259,158,-20 } },
                { name = "Orcish Dragonbrander", level = "76-79", pts = { 227,-121,334,-58,342,-109,379,-180 } },
                { name = "Orcish Veteran", level = "76-79", pts = { 155,-74,246,-123,309,-57,300,-22 } },
                { name = "Orcish Protector", level = "77-79", pts = { -128,16,-118,-22,-141,80,-218,45 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, more = 1, mobs = {
                { name = "Orcish Cupholder", level = "81-82", pts = { -58,-96,-102,-102,-99,-135,-50,-142 } },
                { name = "Orcish Dreadnought", level = "81-82", pts = { -22,-97,-102,-102,-18,-137 } },
                { name = "Orcish Farkiller", level = "81-82", pts = { -99,-135,-18,-137,-50,-142,-67,-151 } },
                { name = "Orcish Imperial Guard", level = "81-82", pts = { -99,-135,-18,-137,-50,-142,-69,-153 } },
                { name = "Orcish Prophetess", level = "81-82", pts = { -22,-97,-102,-102 } },
                { name = "Orcish Strategist", level = "81-82", pts = { -70,-152,-99,-135,-18,-137,-50,-142 } },
            } },
        },
    },
    [621] = {
        name = "Sandspray", level = 66, element = 7, skill = 203,
        family = "Qiqirn", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Qiqirn Mireguide", level = "67-69", pts = { -448,-577,-414,-569,-370,-560 } },
                { name = "Qiqirn Rock Hound", level = "67-69", pts = { -388,-604,-445,-602 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Qiqirn Enterpriser", level = "68-70", pts = { 26,24,66,-14,27,93,102,31 } },
                { name = "Qiqirn Lieuter", level = "68-70", pts = { 68,61,100,-72,-219,99,481,419 } },
                { name = "Qiqirn Archaeologist", level = "73-75", pts = { -507,-182,-428,-218,-319,-183,-290,-182 } },
                { name = "Qiqirn Mosstrooper", level = "73-75", pts = { -486,-223,-421,-188,-396,-181,-367,-99 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Qiqirn Diamantaire", level = "72-73", pts = { 20,-384 } },
                { name = "Qiqirn Mercenary", level = "72-73", pts = { 20,-384,425,216 } },
            } },
            { id = 72, zone = "Alzadaal Undersea Ruins", kind = nil, mobs = {
                { name = "Qiqirn Goldsmith", level = "76-78", pts = { 104,148,60,102,-25,142,-103,100 } },
                { name = "Qiqirn Poulterer", level = "76-78", pts = { 104,148,60,102,-103,100,-181,59 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Qiqirn Trailer", level = "77", pts = { -58,60 } },
                { name = "Qiqirn Treasure Hunter", level = "77", pts = { -58,60 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Qiqirn Goldsmith", level = "77", pts = { -300,-269 } },
                { name = "Qiqirn Poulterer", level = "77", pts = { -300,-269 } },
            } },
        },
    },
    [622] = {
        name = "Grand Slam", level = 30, element = 15, skill = 64,
        family = "Gigas", stats = "INT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Fistfighter", "Bozzetto Marshal", "Bozzetto Swiftshooter", "Bozzetto Trainer", },
        zones = {
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, more = 2, mobs = {
                { name = "Giant Gatekeeper", level = "28-30", pts = { 463,16,384,-54,529,88,385,88 } },
                { name = "Giant Guard", level = "28-30", pts = { 463,16,384,-54,529,88,385,88 } },
                { name = "Giant Lobber", level = "28-30", pts = { 463,16,384,-54,529,88,385,88 } },
                { name = "Giant Sentry", level = "28-30", pts = { 463,16,384,-54,529,88,385,88 } },
                { name = "Gigas Butcher", level = "34-35", pts = { 572,21 } },
                { name = "Gigas Hallwatcher", level = "34-35", pts = { 572,21 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Giant Ascetic", level = "29-30", pts = { 96,22,15,-25,25,-21,139,77 } },
                { name = "Giant Trapper", level = "29-30", pts = { 96,22,25,-21,139,77,125,152 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, more = 2, mobs = {
                { name = "Giant Gatekeeper", level = "30-32", pts = { 53,32,20,102,-57,33,-41,1 } },
                { name = "Giant Guard", level = "30-32", pts = { 53,32,20,102,-57,33,-41,1 } },
                { name = "Giant Lobber", level = "30-32", pts = { 59,30,20,102,-57,33,-41,1 } },
                { name = "Giant Sentry", level = "30-32", pts = { 53,32,20,102,-57,33,-41,1 } },
                { name = "Gigas Jailer", level = "32-34", pts = { -418,20,-434,48,-414,4,-498,22 } },
                { name = "Gigas Kettlemaster", level = "32-34", pts = { -418,20,-420,19,-434,48,-452,15 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, more = 2, mobs = {
                { name = "Gigas Bonecutter", level = "34-35", pts = { -379,21,-327,62,-288,93,-219,54 } },
                { name = "Gigas Spirekeeper", level = "34-35", pts = { -327,62,-288,93,-379,51,-219,54 } },
                { name = "Gigas Stonemason", level = "34-35", pts = { -379,21,-327,62,-288,93,-219,54 } },
                { name = "Gigas Torturer", level = "34-35", pts = { -379,21,-288,93,-219,54,-280,24 } },
                { name = "Jotunn Gatekeeper", level = "65-69", pts = { -297,55,-302,-10,-332,20,-272,13 } },
                { name = "Jotunn Hallkeeper", level = "65-69", pts = { -297,55,-302,-10,-332,20,-272,13 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Gigas Foreman", level = "35-37", pts = { 140,79,41,53,-160,18,-261,1 } },
                { name = "Gigas Stonecarrier", level = "35-37", pts = { 140,79,41,53,-160,18,-261,1 } },
                { name = "Gigas Stonegrinder", level = "35-37", pts = { 140,79,41,53,-160,18,-261,1 } },
                { name = "Gigas Stonemason", level = "35-37", pts = { 140,79,41,53,-160,18,-261,1 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, more = 1, mobs = {
                { name = "Gigas Fighter", level = "35-38", pts = { 178,-96,392,-161 } },
                { name = "Gigas Slinger", level = "35-38", pts = { 178,-96,392,-161,501,-217,-12,-21 } },
                { name = "Gigas Wrestler", level = "35-38", pts = { 178,-96,392,-161,501,-217 } },
                { name = "Gigas Braver", level = "41-44", pts = { -392,134,-147,94,-174,23,-144,-59 } },
                { name = "Gigas Catapulter", level = "41-44", pts = { -392,134,-217,117,-106,20 } },
                { name = "Gigas Martialist", level = "41-44", pts = { -392,134,-147,94,-123,-44 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Cold Gigas", level = "40-43", pts = { -31,-223,-106,-154,56,-84,72,46 } },
                { name = "Rime Gigas", level = "40-43", pts = { -31,-223,-106,-154,56,-84,72,46 } },
                { name = "Sleet Gigas", level = "40-43", pts = { -31,-223,-106,-154,56,-84,72,46 } },
                { name = "Snow Gigas", level = "40-43", pts = { -31,-223,-106,-154,56,-84,72,46 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Gigas Braver", level = "41-44", pts = { 463,165,247,188,230,304,78,-54 } },
                { name = "Gigas Catapulter", level = "41-44", pts = { 247,188,230,304,69,-113,-55,18 } },
                { name = "Gigas Martialist", level = "41-44", pts = { 463,165,261,179,78,-54,-55,18 } },
                { name = "Gigas Warwolf", level = "41-44", pts = { 247,188,230,304,78,-54,-55,18 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Blizzard Gigas", level = "45-48", pts = { 400,5,436,76,523,19,523,197 } },
                { name = "Frost Gigas", level = "45-48", pts = { 400,5,436,76,523,19,523,197 } },
                { name = "Graupel Gigas", level = "45-48", pts = { 400,5,436,76,523,19,523,197 } },
                { name = "Hail Gigas", level = "45-48", pts = { 400,5,436,76,523,19,523,197 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Gigas Deckhand", level = "78-82", pts = { 349,426,357,368,318,284,81,-52 } },
                { name = "Gigas Helmsman", level = "78-82", pts = { 403,428,304,326,35,-104,-598,-549 } },
                { name = "Gigas Jack", level = "78-82", pts = { 361,394,392,360,318,284,71,-78 } },
                { name = "Gigas Marine", level = "78-82", pts = { 322,390,337,368,116,-40,81,-52 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Gigas Cleaver", level = "80-82", pts = { 88,60,112,1,-30,-206,-193,-220 } },
                { name = "Gigas Flesher", level = "80-82", pts = { 108,-239,5,-278,140,-135,233,-114 } },
                { name = "Gigas Pelter", level = "80-82", pts = { 108,-239,5,-278,-131,-343,-101,-321 } },
                { name = "Gigas Pounder", level = "80-82", pts = { 88,60,112,1,130,-72,-30,-206 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Gigas Flogger", level = "80-81", pts = { 345,-227,264,-242,249,-202,335,-124 } },
                { name = "Gigas Hurler", level = "80-81", pts = { 304,-266,264,-242,268,-146,249,-202 } },
                { name = "Gigas Lopper", level = "80-81", pts = { 399,-167,345,-227,268,-146,347,-70 } },
                { name = "Gigas Slugger", level = "80-81", pts = { 399,-167,337,-160,345,-227,268,-146 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Bathyal Gigas", level = "81-82", pts = { -734,558,-646,415,-702,338,-795,482 } },
                { name = "Demersal Gigas", level = "81-82", pts = { -481,-42,-377,-172,-423,-252,-539,-116 } },
                { name = "Hadal Gigas", level = "81-82", pts = { -285,216,-265,106,-398,192,-355,341 } },
            } },
        },
    },
    [623] = {
        name = "Head Butt", level = 12, element = 15, skill = 10,
        family = "Quadav", stats = "DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Berserker", "Bozzetto Defiler", "Bozzetto Devout", "Bozzetto Disruptor", "Bozzetto Elementalist", "Bozzetto High Vicar", },
        zones = {
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Amber Quadav", level = "3-8", pts = { 190,266,33,413,-77,286,-180,204 } },
                { name = "Amethyst Quadav", level = "3-8", pts = { -60,258,-77,286,-180,204,139,695 } },
                { name = "Young Quadav", level = "3-8", pts = { 181,257,190,266,-13,135,33,413 } },
            } },
            { id = 143, zone = "Palborough Mines", kind = nil, more = 3, mobs = {
                { name = "Amber Quadav", level = "3-10", pts = { 67,61,64,103,60,135,87,169 } },
                { name = "Amethyst Quadav", level = "3-10", pts = { 67,61,64,103,60,135,87,169 } },
                { name = "Young Quadav", level = "3-10", pts = { 67,61,64,103,30,118,87,169 } },
                { name = "Greater Quadav", level = "11-18", pts = { 279,215,296,179,270,119,260,61 } },
                { name = "Onyx Quadav", level = "11-18", pts = { 279,215,296,179,270,119,260,61 } },
                { name = "Veteran Quadav", level = "11-18", pts = { 279,215,296,179,270,119,260,61 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Amber Quadav", level = "3-8", pts = { 40,-246,421,-515,355,-623,-86,-209 } },
                { name = "Amethyst Quadav", level = "3-8", pts = { 40,-246,355,-623,-86,-209,-138,-313 } },
                { name = "Young Quadav", level = "3-8", pts = { 11,-104,40,-246,421,-515,355,-623 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Amber Quadav", level = "9-10", pts = { 433,-424,448,121,369,456,381,540 } },
                { name = "Amethyst Quadav", level = "9-15", pts = { 433,-424,448,121,369,456,4,188 } },
                { name = "Young Quadav", level = "9-10", pts = { 433,-424,448,121,4,188 } },
                { name = "Greater Quadav", level = "13-15", pts = { 448,121,369,456,4,188,-141,508 } },
                { name = "Onyx Quadav", level = "13-15", pts = { 433,-424,448,121,369,456,4,188 } },
                { name = "Veteran Quadav", level = "13-15", pts = { 448,121,365,296,381,540,4,188 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Greater Quadav", level = "17-18", pts = { -382,-391,14,-234,368,-93,496,-262 } },
                { name = "Onyx Quadav", level = "17-18", pts = { -382,-391,14,-234,368,-93,496,-262 } },
                { name = "Veteran Quadav", level = "17-18", pts = { 14,-234,368,-93,496,-262,537,-285 } },
                { name = "Copper Quadav", level = "22-23", pts = { -382,-391,14,-234,368,-93,496,-262 } },
            } },
            { id = 147, zone = "Beadeaux", kind = nil, more = 13, mobs = {
                { name = "Brass Quadav", level = "22-28", pts = { -156,58,-168,135,-127,118,-100,85 } },
                { name = "Copper Quadav", level = "22-27", pts = { -204,86,-168,135,-127,118,-67,122 } },
                { name = "Old Quadav", level = "22-26", pts = { -204,86,-156,58,-168,135,-127,118 } },
                { name = "Bronze Quadav", level = "32-36", pts = { -42,159,-82,-78,-43,-118,-94,-172 } },
                { name = "Silver Quadav", level = "33-37", pts = { -237,42,-82,-78,-43,-118,-94,-172 } },
                { name = "Zircon Quadav", level = "34-38", pts = { -158,82,-82,-78,-43,-118,-94,-172 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, more = 1, mobs = {
                { name = "Brass Quadav", level = "27-28", pts = { -80,-631,-164,-318,-338,-26,-177,250 } },
                { name = "Copper Quadav", level = "27-28", pts = { -80,-631,-164,-318,-338,-26,-177,250 } },
                { name = "Old Quadav", level = "27-28", pts = { -80,-631,-164,-318,-338,-26,64,219 } },
                { name = "Bronze Quadav", level = "32-33", pts = { -80,-631,-164,-318,-338,-26,-177,250 } },
                { name = "Garnet Quadav", level = "32-33", pts = { -80,-631,-164,-318,-338,-26,-177,250 } },
                { name = "Silver Quadav", level = "32-33", pts = { -80,-631,-164,-318,-338,-26,-177,250 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Elder Quadav", level = "47-49", pts = { -80,100,-125,123,-138,67 } },
                { name = "Emerald Quadav", level = "47-49", pts = { -80,100,-125,123,-138,67,-124,143 } },
                { name = "Iron Quadav", level = "47-49", pts = { -80,100,-125,123,-138,67 } },
                { name = "Spinel Quadav", level = "47-49", pts = { -80,100,-125,123,-138,67 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, more = 2, mobs = {
                { name = "Elder Quadav", level = "47-49", pts = { -51,110,-70,101,-50,90,-67,60 } },
                { name = "Emerald Quadav", level = "47-49", pts = { -51,110,-70,101,-50,90,-67,60 } },
                { name = "Iron Quadav", level = "47-49", pts = { -51,110,-70,101,-50,90,-67,60 } },
                { name = "Spinel Quadav", level = "47-49", pts = { -51,110,-70,101,-50,90,-67,60 } },
                { name = "Gold Quadav", level = "50-52", pts = { -100,51,-111,72,-91,71 } },
                { name = "Mythril Quadav", level = "50-52", pts = { -100,51,-111,72,-91,71 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, more = 1, mobs = {
                { name = "Amber Quadav", level = "59-63", pts = { -90,472,-412,375 } },
                { name = "Amethyst Quadav", level = "59-63", pts = { -90,472,-350,354 } },
                { name = "Copper Quadav", level = "59-64", pts = { -350,354 } },
                { name = "Greater Quadav", level = "59-64", pts = { 368,1107 } },
                { name = "Onyx Quadav", level = "59-63", pts = { 368,1107 } },
                { name = "Veteran Quadav", level = "59-63", pts = { 368,1107 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, more = 6, mobs = {
                { name = "Amethyst Quadav", level = "61-63", pts = { 423,278 } },
                { name = "Brass Quadav", level = "61-69", pts = { 353,660,217,605 } },
                { name = "Bronze Quadav", level = "61-69", pts = { 474,728 } },
                { name = "Copper Quadav", level = "61-63", pts = { 423,278,504,492 } },
                { name = "Greater Quadav", level = "61-69", pts = { 489,567,465,623 } },
                { name = "Heliodor Quadav", level = "61-69", pts = { 538,689,296,638,199,552 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, more = 1, mobs = {
                { name = "Brass Quadav", level = "65-69", pts = { -201,-634,-379,-575,-314,-654,-430,-469 } },
                { name = "Bronze Quadav", level = "65-68", pts = { -282,-476,-332,-486,-314,-654,-268,-600 } },
                { name = "Emerald Quadav", level = "65-68", pts = { -205,-569,-201,-634,-476,-491,-430,-469 } },
                { name = "Heliodor Quadav", level = "65-69", pts = { -116,-642,-379,-575,-314,-654,-430,-469 } },
                { name = "Old Quadav", level = "65-69", pts = { -116,-642,-332,-486,-476,-491,-268,-600 } },
                { name = "Sapphirine Quadav", level = "65-68", pts = { -282,-476,-476,-491 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, more = 1, mobs = {
                { name = "Brass Quadav", level = "66-69", pts = { -16,284,-95,246 } },
                { name = "Bronze Quadav", level = "66-69", pts = { 8,271,-95,246 } },
                { name = "Emerald Quadav", level = "66-69", pts = { 39,210,-136,371 } },
                { name = "Heliodor Quadav", level = "66-69", pts = { 34,185,-136,371 } },
                { name = "Old Quadav", level = "66-69", pts = { 34,185,-71,227,-152,358 } },
                { name = "Sapphirine Quadav", level = "66-69", pts = { -16,284,-71,227,-137,349 } },
            } },
            { id = 148, zone = "Qulun Dome", kind = nil, mobs = {
                { name = "Ancient Quadav", level = "69-72", pts = { 266,85,298,24 } },
                { name = "Darksteel Quadav", level = "69-72", pts = { 298,24,291,80 } },
                { name = "Platinum Quadav", level = "69-72", pts = { 298,24,280,72 } },
                { name = "Sapphire Quadav", level = "69-72", pts = { 298,24,291,80 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, more = 4, mobs = {
                { name = "Elder Quadav", level = "71-74", pts = { 260,-192,343,3,63,214,-194,404 } },
                { name = "Garnet Quadav", level = "71-74", pts = { 260,-192,256,-29,279,371,500,564 } },
                { name = "Mythril Quadav", level = "71-74", pts = { 343,3,99,69,279,371,395,429 } },
                { name = "Nickel Quadav", level = "71-74", pts = { 427,-78,179,71,24,353,-194,404 } },
                { name = "Ruby Quadav", level = "71-74", pts = { 382,-154,99,69,24,353,163,367 } },
                { name = "Silver Quadav", level = "71-74", pts = { 289,-160,256,-29,-82,369,163,367 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, more = 8, mobs = {
                { name = "Ancient Quadav", level = "76-79", pts = { -194,85,-161,144,-163,-137,-239,-199 } },
                { name = "Gold Quadav", level = "76-79", pts = { -118,123,-65,134,-203,-123,-259,-162 } },
                { name = "Iron Quadav", level = "76-79", pts = { -59,102,-151,-82,-203,-123,-259,-162 } },
                { name = "Magnes Quadav", level = "76-79", pts = { -118,123,-65,134,-163,-137,-239,-199 } },
                { name = "Star Ruby Quadav", level = "76-79", pts = { -194,85,-151,-82,-239,-199,-164,-105 } },
                { name = "Vajra Quadav", level = "76-79", pts = { -194,85,-180,135,-163,-165,-49,159 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, more = 1, mobs = {
                { name = "Adaman Quadav", level = "77-79", pts = { -80,99,-118,121,-141,55 } },
                { name = "Ancient Quadav", level = "77-79", pts = { -141,69,-124,138,-91,82 } },
                { name = "Gold Quadav", level = "77-79", pts = { -96,103,-118,121 } },
                { name = "Iron Quadav", level = "77-79", pts = { -118,121,-143,71,-91,82 } },
                { name = "Magnes Quadav", level = "77-79", pts = { -80,99,-124,138 } },
                { name = "Star Ruby Quadav", level = "77-79", pts = { -66,103,-124,138,-91,82 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, more = 1, mobs = {
                { name = "Chatoyant Quadav", level = "80-82", pts = { -105,49,-89,65 } },
                { name = "Doyen Quadav", level = "80-82", pts = { -50,107,-71,99 } },
                { name = "Ferroalloy Quadav", level = "80-82", pts = { -105,49,-113,71,-93,92 } },
                { name = "Platinum Quadav", level = "80-82", pts = { -66,63,-105,49 } },
                { name = "Baetyl Quadav", level = "81-82", pts = { -71,99 } },
                { name = "Meteor Quadav", level = "81-82", pts = { -46,110,-71,99 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Appetent Umbril", level = "100-101", tags = { "Night only" }, pts = { 198,-119,199,-200,126,-260,80,-162 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Umbril", level = "100-101", tags = { "Night only" }, pts = { 420,357,408,333,360,397,240,392 } },
            } },
        },
    },
    [626] = {
        name = "Bomb Toss", level = 28, element = 0, skill = 58,
        family = "Goblin", stats = "STR+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Deathbringer", "Bozzetto Don", "Bozzetto Incanter", "Bozzetto Ravager", "Gloom Phantom TVR", },
        zones = {
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, more = 3, mobs = {
                { name = "Goblin Thug", level = "1-6", pts = { 379,91,379,27,409,58,419,-21 } },
                { name = "Goblin Weaver", level = "3-6", pts = { 419,-21,300,21,300,100 } },
                { name = "Goblin Gambler", level = "20-23", pts = { -221,-112,-219,-168,-254,-141,-260,-219 } },
                { name = "Goblin Leecher", level = "20-23", pts = { -221,-112,-219,-168,-254,-141,-260,-219 } },
                { name = "Goblin Mugger", level = "20-23", pts = { -221,-112,-219,-168,-254,-141,-260,-219 } },
                { name = "Goblin Flesher", level = "80-82", pts = { 241,84,19,-120,-95,-142 } },
            } },
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Goblin Fisher", level = "3-6", pts = { 378,26,474,-376 } },
                { name = "Goblin Thug", level = "3-8", pts = { 329,415,509,370,636,330,624,254 } },
                { name = "Goblin Weaver", level = "4-8", pts = { 509,370,636,330,624,254,755,537 } },
                { name = "Goblin Digger", level = "7-8", pts = { 358,-412 } },
            } },
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Goblin Thug", level = "3-6", pts = { 233,-410,217,-458,315,-388,307,21 } },
                { name = "Goblin Weaver", level = "3-6", pts = { 233,-410,217,-458,315,-388,307,21 } },
                { name = "Goblin Fisher", level = "4-6", pts = { -170,276,-69,127,280,276,-153,482 } },
                { name = "Goblin Digger", level = "6-7", pts = { 113,-40 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, more = 2, mobs = {
                { name = "Goblin Thug", level = "3-8", pts = { -149,195,-175,112,-195,21,-154,23 } },
                { name = "Goblin Weaver", level = "4-8", pts = { -175,112,-195,21,-154,23,-110,22 } },
                { name = "Goblin Ambusher", level = "12-16", pts = { 40,19,103,22,140,74,168,79 } },
                { name = "Goblin Butcher", level = "12-16", pts = { 40,19,103,22,140,74,168,79 } },
                { name = "Goblin Tinkerer", level = "12-16", pts = { 40,19,103,22,140,74,168,79 } },
                { name = "Goblin Gambler", level = "21-23", pts = { 217,173,220,105 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Goblin Fisher", level = "3-5", pts = { 564,-537,580,-648 } },
                { name = "Goblin Thug", level = "3-8", pts = { 236,-317,127,-484,341,-417,112,-338 } },
                { name = "Goblin Weaver", level = "4-8", pts = { 112,-338,263,-525,157,-384,185,-482 } },
                { name = "Goblin Digger", level = "7-8", pts = { 296,-516 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Goblin Fisher", level = "3-4", pts = { -326,-405 } },
                { name = "Goblin Thug", level = "3-5", pts = { -144,-384,50,-170,159,8,319,140 } },
                { name = "Goblin Weaver", level = "3-5", pts = { 50,-170,159,8,319,140,-326,-405 } },
                { name = "Goblin Digger", level = "5-6", pts = { 238,204 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, more = 1, mobs = {
                { name = "Goblin Fisher", level = "4-5", pts = { -28,500 } },
                { name = "Goblin Thug", level = "4-8", pts = { 381,640,245,662,130,518,202,378 } },
                { name = "Goblin Weaver", level = "4-8", pts = { 245,662,202,378,307,379,269,460 } },
                { name = "Goblin Digger", level = "6-7", pts = { 197,502 } },
                { name = "Goblin Gambler", level = "21-22", pts = { -470,384 } },
                { name = "Goblin Leecher", level = "21-22", pts = { -470,384 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Goblin Thug", level = "4-7", pts = { 503,-618,492,-700,539,-659,463,-624 } },
                { name = "Goblin Weaver", level = "4-7", pts = { 503,-618,492,-700,539,-659,463,-624 } },
                { name = "Goblin Ambusher", level = "10-14", pts = { -317,773,-309,740,-379,739 } },
                { name = "Goblin Butcher", level = "10-14", pts = { -317,773,-309,740,-379,739 } },
                { name = "Goblin Tinkerer", level = "10-14", pts = { -317,773,-309,740,-379,739 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, more = 3, mobs = {
                { name = "Goblin Thug", level = "4-8", pts = { -153,-227,-179,-180 } },
                { name = "Goblin Weaver", level = "4-8", pts = { -153,-227,-179,-180 } },
                { name = "Goblin Gambler", level = "26-30", pts = { -197,-138,-298,-162,57,-123 } },
                { name = "Goblin Leecher", level = "26-30", pts = { -197,-138,-298,-162,-260,-179,57,-123 } },
                { name = "Goblin Mugger", level = "26-30", pts = { -197,-138,-298,-162,-260,-179,57,-123 } },
                { name = "Goblin Artificer", level = "88-90", pts = { 14,100,-201,95,2,161 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Goblin Thug", level = "4-8", pts = { -318,-78,-178,-136,-470,-148,-310,-228 } },
                { name = "Goblin Weaver", level = "4-8", pts = { -318,-78,-178,-136,-470,-148,-310,-228 } },
                { name = "Goblin Fisher", level = "6-7", pts = { -369,-438 } },
                { name = "Goblin Digger", level = "7-8", pts = { -443,-92 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, more = 6, mobs = {
                { name = "Goblin Fisher", level = "5-8", pts = { -42,-232,-82,-225,-172,-141,-227,-139 } },
                { name = "Goblin Thug", level = "5-8", pts = { -74,-79,-116,113,-197,84,-42,-232 } },
                { name = "Goblin Weaver", level = "5-8", pts = { -74,-79,-116,113,-197,84,-42,-232 } },
                { name = "Goblin Ambusher", level = "12-16", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
                { name = "Goblin Butcher", level = "12-16", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
                { name = "Goblin Tinkerer", level = "12-16", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Goblin Butcher", level = "8-14", pts = { -100,-662,-281,-205,-404,-37,-418,-140 } },
                { name = "Goblin Thug", level = "8-13", pts = { -126,-690,-281,-205,-404,-37,-458,20 } },
                { name = "Goblin Tinkerer", level = "9-14", pts = { -281,-205,-404,-37,-418,-140,-113,272 } },
                { name = "Goblin Weaver", level = "9-13", pts = { -126,-690,-281,-205,-404,-37,-418,-140 } },
                { name = "Goblin Ambusher", level = "12-16", pts = { -126,-690,-281,-205,-404,-37,-458,20 } },
                { name = "Goblin Digger", level = "13-14", pts = { -82,676 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, more = 1, mobs = {
                { name = "Goblin Thug", level = "8-10", pts = { -718,443,-463,-138,-321,245,31,186 } },
                { name = "Goblin Weaver", level = "8-10", pts = { -718,443,-463,-138,-321,245,31,186 } },
                { name = "Goblin Fisher", level = "9-10", pts = { -13,110,579,-419,423,-541 } },
                { name = "Goblin Digger", level = "11-12", pts = { -578,50 } },
                { name = "Goblin Ambusher", level = "12-13", pts = { -463,-138,-321,245,31,186,461,314 } },
                { name = "Goblin Butcher", level = "12-13", pts = { -463,-138,-321,245,31,186,461,314 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Goblin Thug", level = "8-9", pts = { 52,-179,-229,-12,248,314 } },
                { name = "Goblin Weaver", level = "8-9", pts = { 52,-179,-229,-12,248,314 } },
                { name = "Goblin Ambusher", level = "12-14", pts = { 52,-179,-229,-12,-456,-140,-324,239 } },
                { name = "Goblin Butcher", level = "12-14", pts = { 52,-179,-229,-12,-456,-140,-324,239 } },
                { name = "Goblin Digger", level = "12-13", pts = { -45,242 } },
                { name = "Goblin Tinkerer", level = "12-14", pts = { 52,-179,-229,-12,-456,-140,-324,239 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Goblin Bounty Hunter", level = "10", pts = { -48,106,-246,72,-180,109,-388,59 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Goblin Bounty Hunter", level = "10-36", pts = { 91,-66,44,-105,-30,-70,-225,-4 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, more = 1, mobs = {
                { name = "Goblin Ambusher", level = "16-17", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Butcher", level = "16-17", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Tinkerer", level = "16-17", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Digger", level = "18-19", pts = { 19,160 } },
                { name = "Goblin Gambler", level = "21-22", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Leecher", level = "21-22", pts = { -120,82,314,186,312,420 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, more = 4, mobs = {
                { name = "Goblin Ambusher", level = "16-18", pts = { -256,-104,-178,4,-102,-45,-51,-7 } },
                { name = "Goblin Butcher", level = "16-18", pts = { -256,-104,-178,4,-102,-45,-51,-7 } },
                { name = "Goblin Tinkerer", level = "16-18", pts = { -256,-104,-178,4,-102,-45,-51,-7 } },
                { name = "Goblin Gambler", level = "22-26", pts = { -145,134,-49,-45,24,-78,124,-102 } },
                { name = "Goblin Leecher", level = "22-26", pts = { -145,134,-49,-45,24,-78,124,-102 } },
                { name = "Goblin Mugger", level = "22-26", pts = { -145,134,-49,-45,24,-78,124,-102 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, more = 1, mobs = {
                { name = "Goblin Ambusher", level = "16-17", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Butcher", level = "16-17", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Gambler", level = "16-25", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Tinkerer", level = "16-17", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Digger", level = "18-19", pts = { 291,233 } },
                { name = "Goblin Leecher", level = "21-22", pts = { -81,-50,636,-362,-133,132,-19,444 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, more = 1, mobs = {
                { name = "Goblin Ambusher", level = "16-17", pts = { 183,40,-67,345,-178,150,357,439 } },
                { name = "Goblin Butcher", level = "16-17", pts = { 183,40,-67,345,-172,-75,-178,150 } },
                { name = "Goblin Tinkerer", level = "16-17", pts = { 183,40,-67,345,-178,150,357,439 } },
                { name = "Goblin Digger", level = "18-19", pts = { 108,44 } },
                { name = "Goblin Gambler", level = "21-22", pts = { 183,40,-67,345,-172,-75,-178,150 } },
                { name = "Goblin Leecher", level = "21-22", pts = { 183,40,-67,345,-178,150,357,439 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, more = 2, mobs = {
                { name = "Goblin Ambusher", level = "17-20", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
                { name = "Goblin Bounty Hunter", level = "17-20", pts = { 356,328,431,251,463,242,450,155 } },
                { name = "Goblin Butcher", level = "17-20", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
                { name = "Goblin Tinkerer", level = "17-20", pts = { -475,48,-313,33,-427,-206,-219,-79 } },
                { name = "Goblin Digger", level = "20-21", pts = { 221,103 } },
                { name = "Goblin Gambler", level = "22-25", pts = { -73,-158,23,-262,-5,35,94,-101 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, more = 4, mobs = {
                { name = "Goblin Ambusher", level = "17-20", pts = { 39,477,60,441,-205,569,-170,509 } },
                { name = "Goblin Butcher", level = "17-20", pts = { 57,504,39,477,-205,569,-170,509 } },
                { name = "Goblin Tinkerer", level = "17-20", pts = { 57,504,39,477,-205,569,-170,509 } },
                { name = "Goblin Gambler", level = "22-26", pts = { -136,238,-160,174 } },
                { name = "Goblin Leecher", level = "22-26", pts = { -136,238,-160,174 } },
                { name = "Goblin Mugger", level = "22-26", pts = { -136,238,-160,174,-192,108,46,100 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Goblin Ambusher", level = "17-20", pts = { 811,308,631,217,525,329,400,53 } },
                { name = "Goblin Bounty Hunter", level = "17-20", pts = { 373,-212,345,-160,239,-171,332,-160 } },
                { name = "Goblin Butcher", level = "17-20", pts = { 811,308,631,217,525,329,400,53 } },
                { name = "Goblin Tinkerer", level = "17-20", pts = { 631,217,400,53,650,-183,887,-237 } },
                { name = "Goblin Digger", level = "19-20", pts = { -251,-92 } },
                { name = "Goblin Mugger", level = "22-25", pts = { 442,202,500,258,400,53,521,-28 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, more = 1, mobs = {
                { name = "Goblin Gambler", level = "25-29", pts = { -327,-408,-196,-372,-135,-292,-40,-391 } },
                { name = "Goblin Leecher", level = "25-29", pts = { 141,-409,62,-333,214,-350,289,-263 } },
                { name = "Goblin Mugger", level = "25-29", pts = { -327,-408,-196,-372,-135,-292,-120,-453 } },
                { name = "Goblin Furrier", level = "31-34", pts = { 443,-237,595,-170 } },
                { name = "Goblin Smithy", level = "31-34", pts = { 289,-263,406,-298,443,-237,595,-170 } },
                { name = "Goblin Robber", level = "42-46", pts = { -102,-222,259,-180,-81,-136,1,-113 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, more = 3, mobs = {
                { name = "Goblin Gambler", level = "26-27", pts = { -317,-14,-566,52,-358,244,-50,-77 } },
                { name = "Goblin Leecher", level = "26-27", pts = { -317,-14,-566,52,-358,244,-50,-77 } },
                { name = "Goblin Mugger", level = "26-27", pts = { -317,-14,-566,52,-358,244,-50,-77 } },
                { name = "Goblin Digger", level = "28-29", pts = { -28,355 } },
                { name = "Goblin Bounty Hunter", level = "30-36", pts = { 352,128,337,135,288,209,253,230 } },
                { name = "Goblin Furrier", level = "30-31", pts = { -317,-14,-566,52,-459,-97,-358,244 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, more = 2, mobs = {
                { name = "Goblin Gambler", level = "26-27", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Leecher", level = "26-27", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Mugger", level = "26-27", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Digger", level = "28-29", pts = { -125,-218 } },
                { name = "Goblin Furrier", level = "31-32", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Pathfinder", level = "31-32", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, more = 3, mobs = {
                { name = "Goblin Furrier", level = "26-32", pts = { 528,139,536,-65,304,343,132,-33 } },
                { name = "Goblin Gambler", level = "26-27", pts = { 536,24,304,343,132,-33,300,-96 } },
                { name = "Goblin Leecher", level = "26-27", pts = { 536,24,304,343,132,-33,-286,335 } },
                { name = "Goblin Mugger", level = "26-27", pts = { 536,24,304,343,132,-33,300,-96 } },
                { name = "Goblin Pathfinder", level = "26-32", pts = { 528,139,536,-65,304,343,132,-33 } },
                { name = "Goblin Shaman", level = "26-32", pts = { 502,136,536,-65,304,343,132,-33 } },
            } },
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Goblin Gambler", level = "27-30", pts = { 521,-79,558,-36,397,88,451,26 } },
                { name = "Goblin Leecher", level = "27-30", pts = { 521,-79,558,-36,397,88,451,26 } },
                { name = "Goblin Mugger", level = "27-30", pts = { 521,-79,558,-36,397,88,451,26 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Goblin Furrier", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
                { name = "Goblin Pathfinder", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
                { name = "Goblin Shaman", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
                { name = "Goblin Smithy", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Goblin Furrier", level = "32-37", pts = { -137,224,-234,-111,-290,-139,-180,-161 } },
                { name = "Goblin Smithy", level = "32-37", pts = { -212,473,-221,405,-218,352,-154,356 } },
                { name = "Goblin Digger", level = "36-38", pts = { -460,-69 } },
                { name = "Goblin Poacher", level = "42-47", pts = { -624,15,-620,-32,-571,-103,-528,-96 } },
                { name = "Goblin Reaper", level = "42-47", pts = { 379,328,378,276,334,280,345,244 } },
                { name = "Goblin Robber", level = "42-47", pts = { -579,113,-624,15,-582,-48,-528,-96 } },
            } },
            { id = 11, zone = "Oldton Movalpolos", kind = nil, more = 3, mobs = {
                { name = "Goblin Craftsman", level = "33-36", pts = { -345,379,-284,184,-259,99,-234,-18 } },
                { name = "Goblin Gutterman", level = "33-36", pts = { -345,379,-301,218,-218,2,-92,91 } },
                { name = "Goblin Hammerman", level = "33-36", pts = { -304,287,-219,32,-125,60,-92,91 } },
                { name = "Goblin Leadman", level = "33-36", pts = { -334,311,-259,99,-217,22,-265,-22 } },
                { name = "Goblin Doorman", level = "42-44", pts = { -6,69,26,68,16,-43,165,-86 } },
                { name = "Goblin Oilman", level = "42-44", pts = { -6,69,17,49,36,-113,174,-75 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Goblin Pathfinder", level = "34-36", pts = { 431,825 } },
                { name = "Goblin Shaman", level = "34-36", pts = { 522,765 } },
                { name = "Hobgoblin Animalier", level = "72-74", pts = { 335,865,186,790,117,686 } },
                { name = "Hobgoblin Fascinator", level = "72-74", pts = { 281,804,154,799,155,724 } },
                { name = "Hobgoblin Martialist", level = "72-74", pts = { 361,880,209,802,127,696 } },
                { name = "Hobgoblin Venerer", level = "72-74", pts = { 318,824,209,802,117,686 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, more = 2, mobs = {
                { name = "Goblin Furrier", level = "35-37", pts = { 140,-25,137,73,288,216,340,205 } },
                { name = "Goblin Shaman", level = "35-39", pts = { 110,-133,140,-25,340,205,391,-118 } },
                { name = "Goblin Pathfinder", level = "36-39", pts = { 137,73,542,57,256,-240 } },
                { name = "Goblin Smithy", level = "36-39", pts = { 110,-133,288,216,424,183,380,81 } },
                { name = "Goblin Poacher", level = "42-44", pts = { 280,-198,357,-212 } },
                { name = "Goblin Reaper", level = "42-44", pts = { 277,-153,314,-166 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, more = 2, mobs = {
                { name = "Goblin Furrier", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Pathfinder", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Shaman", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Smithy", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Poacher", level = "40-43", pts = { -339,126,96,-196,-6,-278,-109,-327 } },
                { name = "Goblin Reaper", level = "40-43", pts = { -339,126,96,-196,-6,-278,-109,-327 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, more = 4, mobs = {
                { name = "Goblin Pathfinder", level = "35-39", pts = { -223,13,-214,174,6,-129 } },
                { name = "Goblin Shaman", level = "35-39", pts = { -181,87,-168,36,-134,39,-60,18 } },
                { name = "Goblin Smithy", level = "35-39", pts = { -299,69,-254,59,-323,17,-374,29 } },
                { name = "Goblin Digger", level = "41-44", pts = { -69,-179 } },
                { name = "Goblin Reaper", level = "41-45", pts = { -46,-72,-2,-99,-20,-162,-420,-226 } },
                { name = "Goblin Poacher", level = "45-49", pts = { -456,-139,-502,-128,-461,-174,-466,-218 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Goblin Digger", level = "45-49", pts = { -211,-136 } },
                { name = "Goblin Poacher", level = "45-49", pts = { -85,-200,-162,-130,-210,-228,-202,-193 } },
                { name = "Goblin Reaper", level = "45-49", pts = { -265,130,-318,49,-259,-46,-202,-193 } },
                { name = "Goblin Robber", level = "45-49", pts = { -41,-329,-85,-200,-162,-130,-210,-228 } },
                { name = "Goblin Trader", level = "45-49", pts = { -265,130,-189,64,-318,49,-162,-130 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Goblin Poacher", level = "46-49", pts = { -128,-186,-30,-162,118,-40,257,-5 } },
                { name = "Goblin Reaper", level = "46-49", pts = { 95,-58,118,-40,158,-76,225,-23 } },
                { name = "Goblin Robber", level = "46-49", pts = { -84,-176,-6,-134,153,-42,118,-40 } },
                { name = "Goblin Alchemist", level = "65-68", pts = { -78,-50,-138,-17,-42,-20 } },
                { name = "Goblin Mercenary", level = "65-68", pts = { -78,-50,-138,-17 } },
                { name = "Goblin Shepherd", level = "65-68", pts = { -78,-50,-138,-17,-42,-20 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, more = 6, mobs = {
                { name = "Goblin Poacher", level = "46-49", pts = { -20,-260,-2,-157 } },
                { name = "Goblin Reaper", level = "46-49", pts = { -20,-260,-1,-131 } },
                { name = "Goblin Robber", level = "46-49", pts = { -20,-260,-1,-131 } },
                { name = "Goblin Trader", level = "46-49", pts = { -1,-131 } },
                { name = "Goblin Bouncer", level = "51-58", pts = { 120,-109,42,-78,59,-4,42,26 } },
                { name = "Goblin Enchanter", level = "51-58", pts = { 118,-87,55,-59,59,-4,42,26 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Goblin Poacher", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
                { name = "Goblin Reaper", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
                { name = "Goblin Robber", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
                { name = "Goblin Trader", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, more = 1, mobs = {
                { name = "Goblin Poacher", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Reaper", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Robber", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Trader", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Bouncer", level = "50-52", pts = { -105,101,-90,90,-13,101,-31,109 } },
                { name = "Goblin Enchanter", level = "50-52", pts = { -105,101,-90,90,-13,101,-31,109 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Goblin Bouncer", level = "51-55", pts = { -633,-303 } },
                { name = "Goblin Digger", level = "51-54", pts = { -407,-540 } },
                { name = "Goblin Enchanter", level = "51-55", pts = { -633,-303,-650,-294 } },
                { name = "Goblin Hunter", level = "51-55", pts = { -636,-335 } },
                { name = "Goblin Welldigger", level = "51-55", pts = { -633,-303 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { 512,408,646,376,698,415,790,482 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { 513,473,528,327,624,323,732,411 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { 460,414,550,277,759,543 } },
                { name = "Goblin Skirmisher", level = "56-59", pts = { 709,446,622,283,498,322 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, more = 1, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { -237,231,369,654,392,418 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { -237,231,158,578,219,361 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { 113,477,178,492 } },
                { name = "Goblin Skirmisher", level = "56-59", pts = { 289,1025,-417,-40,-462,455 } },
                { name = "Goblin Aidman", level = "71-74", pts = { 328,759,268,786,282,899,281,848 } },
                { name = "Goblin Chapman", level = "71-74", pts = { 328,759,268,786,282,899,281,848 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, more = 2, mobs = {
                { name = "Goblin Bouncer", level = "56-58", pts = { 168,-332 } },
                { name = "Goblin Enchanter", level = "56-58", pts = { 214,-326 } },
                { name = "Goblin Hunter", level = "56-58", pts = { 214,-326 } },
                { name = "Goblin Jeweler", level = "56-58", pts = { 191,-352 } },
                { name = "Goblin Alchemist", level = "62-68", pts = { 136,-330,146,-349,150,-303 } },
                { name = "Goblin Bandit", level = "62-67", pts = { 136,-330,146,-349,130,-391,150,-303 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { 268,-228,205,-271,-716,-391 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { 352,-147,275,-287,253,-345 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { 352,-147,253,-345,-725,-459 } },
                { name = "Goblin Skirmisher", level = "58-63", pts = { -301,92,-447,-59,-192,-311,-69,-576 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { -36,45,339,378,-126,-202 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { 316,270,339,378,-126,-202 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { -36,45,316,270,339,378,-126,-202 } },
                { name = "Goblin Skirmisher", level = "56-59", pts = { 233,364,-83,-314 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Goblin Freesword", level = "61-64", pts = { -91,-341,122,-408 } },
                { name = "Goblin Blastmaster", level = "62-64", pts = { 122,-408,125,-327,121,-248 } },
                { name = "Goblin Corpsman", level = "62-64", pts = { -91,-341,125,-327,121,-248 } },
                { name = "Goblin Pioneer", level = "62-64", pts = { -359,-726,408,617 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Goblin Blastmaster", level = "62-64", pts = { 111,93,24,156,-47,74,-130,152 } },
                { name = "Goblin Corpsman", level = "62-64", pts = { 111,93,134,132,-19,136,-132,100 } },
                { name = "Goblin Freesword", level = "62-64", pts = { 134,132,64,97,15,87,-104,81 } },
                { name = "Goblin Pioneer", level = "62-64", pts = { -6,130,-154,180,-183,396 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Goblin Pioneer", level = "62-64", pts = { 217,-88,-262,308,-237,609 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Goblin Blastmaster", level = "62-64", pts = { 149,282,253,300 } },
                { name = "Goblin Corpsman", level = "62-64", pts = { 167,286,264,300 } },
                { name = "Goblin Freesword", level = "62-64", pts = { 150,271,253,300,264,300 } },
                { name = "Goblin Pioneer", level = "62-64", pts = { 218,308 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Goblin Alchemist", level = "65-68", pts = { -225,-37,-59,-52,-9,139,0,258 } },
                { name = "Goblin Bandit", level = "65-68", pts = { -168,-100,-150,8,-59,-52,-54,20 } },
                { name = "Goblin Mercenary", level = "65-68", pts = { -169,-256,-96,-92,-138,-53,-150,8 } },
                { name = "Goblin Shepherd", level = "65-68", pts = { -178,-158,-168,-100,-138,-53,-110,13 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Goblin Alchemist", level = "66-69", pts = { -21,-176,-252,-142,-270,-112,-268,-72 } },
                { name = "Goblin Bandit", level = "66-69", pts = { -21,-210,-252,-142,-270,-112,-109,170 } },
                { name = "Goblin Mercenary", level = "66-69", pts = { -21,-176,-270,-112,-268,-72,-72,167 } },
                { name = "Goblin Shepherd", level = "66-69", pts = { -21,-210,-252,-142,-270,-112,-268,-72 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Goblin Alchemist", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
                { name = "Goblin Bandit", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
                { name = "Goblin Mercenary", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
                { name = "Goblin Tamer", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
            } },
            { id = 12, zone = "Newton Movalpolos", kind = nil, more = 3, mobs = {
                { name = "Goblin Fireman", level = "66-69", pts = { -296,-192,-228,-179,-186,122,-164,136 } },
                { name = "Goblin Foreman", level = "66-69", pts = { -283,-180,-186,122,-98,217,127,138 } },
                { name = "Goblin Lengthman", level = "66-69", pts = { -296,-192,-228,-179,-222,137,-98,217 } },
                { name = "Goblin Packman", level = "66-69", pts = { -296,-150,-228,-179,-193,143,18,217 } },
                { name = "Goblin Hangman", level = "75-79", pts = { -6,-14,86,-20,145,-8,174,51 } },
                { name = "Goblin Headman", level = "75-79", pts = { 99,-141,-61,-17,91,24,167,18 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Goblin Flagman", level = "66-69", pts = { -185,-255,-184,-193,-41,-202,34,-276 } },
                { name = "Goblin Grenadier", level = "66-69", pts = { -246,-286,-184,-193,-41,-202 } },
                { name = "Goblin Guerrilla", level = "66-69", pts = { -280,-358,34,-276 } },
                { name = "Goblin Toxophilite", level = "66-69", pts = { -59,367,180,87 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Goblin Flagman", level = "66-69", pts = { 273,147,347,270,354,217,456,316 } },
                { name = "Goblin Grenadier", level = "66-69", pts = { 273,147,347,270,354,217,456,316 } },
                { name = "Goblin Guerrilla", level = "66-69", pts = { 273,147,307,119,244,-219,171,-165 } },
                { name = "Goblin Toxophilite", level = "66-69", pts = { 313,313,269,84 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Goblin Flagman", level = "66-69", pts = { -160,24,-164,110,-194,32 } },
                { name = "Goblin Grenadier", level = "66-69", pts = { -170,-23,-168,81,-187,72,-210,1 } },
                { name = "Goblin Guerrilla", level = "66-69", pts = { -205,-37,-187,72,-234,-30 } },
                { name = "Goblin Toxophilite", level = "66-69", pts = { -194,45,-177,-2 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Goblin Bombardier", level = "71-74", pts = { -359,-241,-478,-365,-362,-371 } },
                { name = "Goblin Field Doctor", level = "71-74", pts = { -369,-300,-536,-436 } },
                { name = "Goblin Paratrooper", level = "71-74", pts = { -396,-394,-294,-281,-416,-469 } },
                { name = "Goblin Picket", level = "71-74", pts = { -347,-319,-446,-408 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Goblin Bombardier", level = "71-73", pts = { -59,357,666,-413,-149,95 } },
                { name = "Goblin Field Doctor", level = "71-74", pts = { 30,349,666,-413,-149,95 } },
                { name = "Goblin Paratrooper", level = "71-73", pts = { -59,357,30,349,666,-413,-149,95 } },
                { name = "Goblin Picket", level = "71-74", pts = { 212,-436,-324,-130,624,491 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Goblin Plunderer", level = "81-82", pts = { 365,-426,446,-406,524,-410,477,-466 } },
                { name = "Goblin Meatgrinder", level = "82-83", pts = { 412,-323,483,-308,501,-267 } },
            } },
        },
    },
    [628] = {
        name = "Frypan", level = 63, element = 15, skill = 188,
        family = "Goblin", stats = "DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Deathbringer", "Bozzetto Don", "Bozzetto Incanter", "Bozzetto Ravager", },
        zones = {
            { id = 11, zone = "Oldton Movalpolos", kind = nil, more = 5, mobs = {
                { name = "Moblin Chapman", level = "33-36", pts = { -284,184,-149,215,-219,32,-265,-22 } },
                { name = "Moblin Pickman", level = "33-36", pts = { -342,380,-251,210,-125,60,-85,65 } },
                { name = "Moblin Ragman", level = "33-36", pts = { -301,218,-255,173,-259,22,-216,-26 } },
                { name = "Moblin Witchman", level = "33-36", pts = { -334,311,-304,287,-255,173,-259,99 } },
                { name = "Moblin Rodman", level = "41-43", pts = { -83,-78 } },
                { name = "Moblin Coalman", level = "42-44", pts = { -17,112,36,-60,24,-94,160,-57 } },
            } },
            { id = 12, zone = "Newton Movalpolos", kind = nil, more = 1, mobs = {
                { name = "Moblin Draftsman", level = "66-69", pts = { -164,136,94,137,143,104,-115,98 } },
                { name = "Moblin Tankman", level = "66-68", pts = { -186,122,104,148,-115,98,-63,82 } },
                { name = "Moblin Workman", level = "66-68", pts = { -180,153,-186,184,-26,220,127,138 } },
                { name = "Moblin Yardman", level = "66-68", pts = { -26,220,104,148,143,104,-142,-128 } },
                { name = "Moblin Roadman", level = "75-79", pts = { -7,11,91,24,192,19,281,-55 } },
                { name = "Moblin Groundman", level = "77", pts = { 101,39,94,-21 } },
            } },
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Moblin Billionaire", level = "74-77", pts = { -287,35,-320,-2,-221,215 } },
                { name = "Moblin Millionaire", level = "74-77", pts = { -178,20,78,200,-102,260 } },
            } },
        },
    },
    [629] = {
        name = "Flying Hip Press", level = 58, element = 2, skill = 164,
        family = "Bugbear", stats = "AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 11, zone = "Oldton Movalpolos", kind = nil, mobs = {
                { name = "Bugbear Bondman", level = "42-45", pts = { -17,112,19,63,-38,102,-39,98 } },
                { name = "Bugbear Servingman", level = "32-35", tags = { "Scripted spawn" }, pts = { -251,210,-259,22,-220,-24,-129,111 } },
                { name = "Bugallug", level = "45-50", nm = true, tags = { "NM (pop/scripted)" }, pts = { 162,-42 } },
                { name = "Bugbear Porterman", level = "45-50", nm = true, tags = { "NM (pop/scripted)" }, pts = { -140,155,-140,153 } },
                { name = "Bugbear Strongman", level = "50", nm = true, tags = { "NM" }, pts = { -1,-98,62,-122 } },
            } },
            { id = 12, zone = "Newton Movalpolos", kind = nil, mobs = {
                { name = "Bugbear Trashman", level = "65-67", pts = { -296,-150,-296,-192,-222,137,-186,184 } },
                { name = "Bugbear Watchman", level = "71-76", pts = { -178,-162,-182,-162,-222,164,-218,163 } },
                { name = "Bugbear Deathsman", level = "74-75", pts = { 141,-63,-48,4,104,60,143,-23 } },
                { name = "Bugbear Matman", level = "78", nm = true, tags = { "NM (pop/scripted)" }, pts = { 124,-61 } },
            } },
            { id = 13, zone = "Mine Shaft 2716", kind = "Battlefield", mobs = {
                { name = "Bugboy", level = "80", tags = { "Scripted spawn" }, pts = { -460,20,20,17,500,16 } },
            } },
        },
    },
    [631] = {
        name = "Hydro Shot", level = 63, element = 15, skill = 188,
        family = "Sahagin", stats = "MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "River Sahagin", level = "34-38", pts = { -338,-368,-412,-315,-378,-528 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, more = 7, mobs = {
                { name = "Lake Sahagin", level = "36-39", pts = { 96,254,84,122,36,69 } },
                { name = "Pond Sahagin", level = "36-39", pts = { 96,254,136,212,119,118,84,122 } },
                { name = "Spring Sahagin", level = "36-39", pts = { 175,248,136,212,16,112,119,118 } },
                { name = "Brook Sahagin", level = "41-48", pts = { 124,11,83,-2,129,-33,80,-46 } },
                { name = "Rivulet Sahagin", level = "41-48", pts = { 124,11,83,-2,129,-33,80,-46 } },
                { name = "Riparian Sahagin", level = "44-48", pts = { 185,38,380,-109,343,-91,405,-60 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Mamool Ja Diver", level = "75-76", pts = { -137,-32,-91,-65 } },
                { name = "Mamool Ja Frogman", level = "75-76", pts = { -65,-78,-106,-48 } },
            } },
        },
    },
    [632] = {
        name = "Diamondhide", level = 67, element = 15, skill = 207,
        family = "Troll", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Troll Gemologist", level = "71-75", pts = { -44,-377,-219,-116,-186,-53,-38,-102 } },
                { name = "Troll Ironworker", level = "71-75", pts = { -99,-211,-219,-116,-202,-18,-55,-76 } },
                { name = "Troll Lapidarist", level = "71-75", pts = { -94,-330,-177,-144,-185,-18,-127,-104 } },
                { name = "Troll Scrimer", level = "78-83", pts = { -147,260,-394,331,-321,196,-211,363 } },
                { name = "Troll Targeteer", level = "78-83", pts = { -58,228,-176,220,-539,339,-399,358 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Troll Shieldbearer", level = "72-73", pts = { 14,297 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Woodtroll Dark Knight", level = "72-73", pts = { -811,124 } },
                { name = "Woodtroll Warrior", level = "72-73", pts = { -751,196 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Hilltroll Dark Knight", level = "79-83", pts = { 131,19,45,24,305,40,366,54 } },
                { name = "Hilltroll Paladin", level = "79-83", pts = { 67,43,12,96,116,-48,336,37 } },
                { name = "Hilltroll Warrior", level = "79-83", pts = { 155,-6,-15,116,101,42,353,62 } },
            } },
        },
    },
    [633] = {
        name = "Enervation", level = 67, element = 7, skill = 207,
        family = "Troll", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Bruiser", "Bozzetto Justiciar", "Bozzetto Sharpshooter", },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, more = 3, mobs = {
                { name = "Troll Cameist", level = "71-75", pts = { -62,-203,-214,-72,-22,-166,-38,-102 } },
                { name = "Troll Engraver", level = "71-75", pts = { -117,-223,-193,-108,5,-58,-40,-281 } },
                { name = "Troll Smelter", level = "71-75", pts = { -94,-330,-181,-182,-214,-72,-20,-63 } },
                { name = "Troll Stoneworker", level = "71-75", pts = { -65,-346,-117,-223,-62,-203,-20,-136 } },
                { name = "Troll Artilleryman", level = "78-83", pts = { -91,230,-182,188,-372,362,-324,206 } },
                { name = "Troll Combatant", level = "78-83", pts = { -28,230,-355,362,-321,196,654,110 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Troll Sabreur", level = "72-73", pts = { 31,291 } },
                { name = "Troll Surveillant", level = "72-73", pts = { 14,297,31,291 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Woodtroll Monk", level = "72-73", pts = { -812,105 } },
                { name = "Woodtroll Ranger", level = "72-73", pts = { -811,124 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Hilltroll Monk", level = "79-83", pts = { 100,20,67,43,78,72,305,40 } },
                { name = "Hilltroll Puppetmaster", level = "79-83", pts = { 163,2,26,113,251,103 } },
                { name = "Hilltroll Red Mage", level = "79-83", pts = { 108,-14,26,46,53,92,238,62 } },
                { name = "Hilltroll Ranger", level = "81-83", pts = { 305,40,334,-14,368,102,248,65 } },
            } },
        },
    },
    [634] = {
        name = "Light of Penance", level = 58, element = 6, skill = 164,
        family = "Tonberry", stats = "HP +15, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 159, zone = "Temple of Uggalepih", kind = nil, more = 1, mobs = {
                { name = "Tonberry Cutter", level = "51-59", pts = { 202,-19,161,-62,140,-106,103,16 } },
                { name = "Tonberry Harrier", level = "51-59", pts = { 202,-19,161,-62,140,-17,61,-140 } },
                { name = "Tonberry Stalker", level = "51-59", pts = { 202,-19,161,-62,107,-141,95,53 } },
                { name = "Tonberry Dismayer", level = "61-69", pts = { -218,13,-218,26,17,-99,-47,-142 } },
                { name = "Tonberry Maledictor", level = "61-69", pts = { -218,13,17,-99,-47,-142,-97,-109 } },
                { name = "Tonberry Pursuer", level = "61-69", pts = { -218,13,17,-99,-47,-142,-97,-109 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Cryptonberry Cutter", level = "53-58", pts = { 291,-90,309,-31,337,-70,264,308 } },
                { name = "Cryptonberry Harrier", level = "53-60", pts = { 290,-9,308,-8,337,-70,231,287 } },
                { name = "Cryptonberry Plaguer", level = "53-60", pts = { 310,-91,292,-31,264,308,313,311 } },
                { name = "Cryptonberry Stalker", level = "53-60", pts = { 290,-9,308,-8,337,-70,211,308 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Tonberry Chopper", level = "61-63", pts = { 2,-434,28,-454,274,-162,306,-210 } },
                { name = "Tonberry Jinxer", level = "61-63", pts = { 17,-434,274,-178,296,-204 } },
                { name = "Tonberry Shadower", level = "61-63", pts = { 1,-375,50,-466,20,-422,18,-435 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Tonberry Imprecator", level = "62-64", pts = { 36,-43,103,-43,180,-80,41,-112 } },
                { name = "Tonberry Trailer", level = "62-65", pts = { -1,-40,20,-40,21,-99,103,-43 } },
                { name = "Tonberry Beleaguerer", level = "66-72", pts = { -61,-83,417,301,83,-161,74,-126 } },
                { name = "Tonberry Slasher", level = "67-71", pts = { -57,-79,417,301,403,360,74,-126 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Tonberry Bedeviler", level = "81-82", pts = { 393,615,433,619,468,617 } },
                { name = "Cryptonberry Occultist", level = "83-84", pts = { 428,661,493,658,538,646 } },
            } },
        },
    },
    [636] = {
        name = "Warm-Up", level = 68, element = 15, skill = 212,
        family = "Mamool Ja", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Mamool Ja Bounder", level = "72-73", pts = { -658,-66,-743,-521,-505,-773 } },
                { name = "Mamool Ja Mimicker", level = "72-73", pts = { -66,-267,-653,-92,-505,-773 } },
                { name = "Mamool Ja Zenist", level = "72-73", pts = { -701,-495 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, more = 4, mobs = {
                { name = "Mamool Ja Bounder", level = "73-75", pts = { 336,-182,137,-336,222,-236,227,-409 } },
                { name = "Mamool Ja Mimicker", level = "73-75", pts = { 369,-260,342,-218,177,-186,97,-64 } },
                { name = "Mamool Ja Spearman", level = "73-75", pts = { 161,-314,143,-299,42,-162,21,-180 } },
                { name = "Mamool Ja Strapper", level = "73-75", pts = { 333,-223,85,-48,-101,-96,-241,-82 } },
                { name = "Mamool Ja Zenist", level = "73-75", pts = { 334,-263,223,-148,245,-206,176,-346 } },
                { name = "Mamool Ja Infiltrator", level = "81-83", pts = { 179,-436,160,-498,80,-501,16,-341 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Mamool Ja Infiltrator", level = "81-83", pts = { -122,-618,-197,-560,-475,-60 } },
                { name = "Mamool Ja Lurker", level = "81-83", pts = { -197,-560,-467,-94 } },
                { name = "Mamool Ja Mimer", level = "81-83", pts = { -122,-618,-416,-98 } },
                { name = "Mamool Ja Pikeman", level = "81-83", pts = { -142,-616,-199,-541,-475,-60 } },
                { name = "Mamool Ja Stabler", level = "81-83", pts = { -124,-637,-184,-574,-467,-94 } },
            } },
        },
    },
    [637] = {
        name = "Firespit", level = 68, element = 0, skill = 212,
        family = "Mamool Ja", stats = "STR+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Mamool Ja Bounder", level = "72-73", pts = { -658,-66,-743,-521,-505,-773 } },
                { name = "Mamool Ja Mimicker", level = "72-73", pts = { -66,-267,-653,-92,-505,-773 } },
                { name = "Mamool Ja Zenist", level = "72-73", pts = { -701,-495 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, more = 4, mobs = {
                { name = "Mamool Ja Bounder", level = "73-75", pts = { 336,-182,137,-336,222,-236,227,-409 } },
                { name = "Mamool Ja Mimicker", level = "73-75", pts = { 369,-260,342,-218,177,-186,97,-64 } },
                { name = "Mamool Ja Spearman", level = "73-75", pts = { 161,-314,143,-299,42,-162,21,-180 } },
                { name = "Mamool Ja Strapper", level = "73-75", pts = { 333,-223,85,-48,-101,-96,-241,-82 } },
                { name = "Mamool Ja Zenist", level = "73-75", pts = { 334,-263,223,-148,245,-206,176,-346 } },
                { name = "Mamool Ja Infiltrator", level = "81-83", pts = { 179,-436,160,-498,80,-501,16,-341 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Mamool Ja Infiltrator", level = "81-83", pts = { -122,-618,-197,-560,-475,-60 } },
                { name = "Mamool Ja Lurker", level = "81-83", pts = { -197,-560,-467,-94 } },
                { name = "Mamool Ja Mimer", level = "81-83", pts = { -122,-618,-416,-98 } },
                { name = "Mamool Ja Pikeman", level = "81-83", pts = { -142,-616,-199,-541,-475,-60 } },
                { name = "Mamool Ja Stabler", level = "81-83", pts = { -124,-637,-184,-574,-467,-94 } },
            } },
        },
    },
    [638] = {
        name = "Feather Storm", level = 12, element = 15, skill = 10,
        family = "Yagudo", stats = "CHR+2, HP+5,", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Brawler", "Bozzetto Conjurer", "Bozzetto Lyricist", "Bozzetto Shinobi", "Bozzetto Stormbringer", "Bozzetto Swordsman", "Tzee Xicu the Manifest", },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Yagudo Acolyte", level = "3-6", pts = { 140,-245,345,-180,-76,-104,-249,-162 } },
                { name = "Yagudo Initiate", level = "3-6", pts = { 27,-388,-88,-315,140,-245,345,-180 } },
                { name = "Yagudo Scribe", level = "3-6", pts = { 140,-245,345,-180,-76,-104,-249,-162 } },
            } },
            { id = 145, zone = "Giddeus", kind = nil, more = 3, mobs = {
                { name = "Yagudo Acolyte", level = "3-10", pts = { -161,320,-41,319,-66,269,-152,247 } },
                { name = "Yagudo Initiate", level = "3-10", pts = { -161,320,-41,319,-66,269,-152,247 } },
                { name = "Yagudo Scribe", level = "3-10", pts = { -161,320,-41,319,-66,269,18,226 } },
                { name = "Yagudo Mendicant", level = "11-18", pts = { 108,-123,120,-201,123,-237,200,-202 } },
                { name = "Yagudo Persecutor", level = "11-18", pts = { 108,-123,120,-201,123,-237,200,-202 } },
                { name = "Yagudo Piper", level = "11-18", pts = { 108,-123,120,-201,123,-237,200,-202 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Yagudo Acolyte", level = "4-6", pts = { 51,107,-66,292,181,249,224,184 } },
                { name = "Yagudo Initiate", level = "4-6", pts = { 51,107,-66,292,181,249,224,184 } },
                { name = "Yagudo Scribe", level = "4-6", pts = { 51,107,-66,292,181,249,224,184 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Yagudo Acolyte", level = "8-9", pts = { 135,-45,-65,156,91,348 } },
                { name = "Yagudo Initiate", level = "8-9", pts = { 135,-45,-65,156,86,452 } },
                { name = "Yagudo Scribe", level = "8-9", pts = { 135,-45,-85,152,91,348 } },
                { name = "Yagudo Mendicant", level = "13-15", pts = { 135,-45,-85,152,91,348,-217,363 } },
                { name = "Yagudo Persecutor", level = "13-15", pts = { 135,-45,-85,152,91,348,-217,363 } },
                { name = "Yagudo Piper", level = "13-15", pts = { 135,-45,-65,156,91,348,-217,363 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Yagudo Mendicant", level = "17-18", pts = { 245,-373,310,-183,199,47,310,171 } },
                { name = "Yagudo Persecutor", level = "17-18", pts = { 245,-373,310,-183,199,47,310,171 } },
                { name = "Yagudo Piper", level = "17-18", pts = { 245,-373,310,-183,199,47,310,171 } },
            } },
            { id = 151, zone = "Castle Oztroja", kind = nil, more = 13, mobs = {
                { name = "Yagudo Priest", level = "22-28", pts = { -154,64,-159,-97,-122,3,-125,-43 } },
                { name = "Yagudo Theologist", level = "22-27", pts = { -154,64,-159,-97,-122,3,-125,-43 } },
                { name = "Yagudo Votary", level = "22-26", pts = { -176,25,-183,-62,-122,3,-125,-43 } },
                { name = "Yagudo Herald", level = "32-36", pts = { -190,113,-252,106,-246,167,30,-170 } },
                { name = "Yagudo Drummer", level = "33-37", pts = { -190,166,-252,106,-246,167,30,-170 } },
                { name = "Yagudo Oracle", level = "34-38", pts = { -190,113,-190,166,-252,106,30,-170 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, more = 1, mobs = {
                { name = "Yagudo Priest", level = "27-28", pts = { 455,-135,390,116,186,255,-7,184 } },
                { name = "Yagudo Theologist", level = "27-28", pts = { 455,-135,390,116,186,255,-7,184 } },
                { name = "Yagudo Votary", level = "27-28", pts = { 455,-135,390,116,186,255,-7,184 } },
                { name = "Yagudo Drummer", level = "32-33", pts = { 455,-135,390,116,186,255,-7,184 } },
                { name = "Yagudo Herald", level = "32-33", pts = { 455,-135,390,116,186,255,-7,184 } },
                { name = "Yagudo Interrogator", level = "32-33", pts = { 455,-135,390,116,186,255,-7,184 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Yagudo Conquistador", level = "47-49", pts = { -80,-61,-117,-92,-138,-24,-88,-44 } },
                { name = "Yagudo Lutenist", level = "47-49", pts = { -80,-61,-117,-92,-138,-24,-88,-44 } },
                { name = "Yagudo Prior", level = "47-49", pts = { -80,-61,-117,-92,-138,-24,-88,-44 } },
                { name = "Yagudo Zealot", level = "47-49", pts = { -80,-61,-117,-92,-138,-24,-88,-44 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, more = 2, mobs = {
                { name = "Yagudo Conquistador", level = "47-49", pts = { -50,-153,-60,-132,-70,-150,-69,-110 } },
                { name = "Yagudo Lutenist", level = "47-49", pts = { -50,-153,-60,-132,-70,-150,-69,-110 } },
                { name = "Yagudo Prior", level = "47-49", pts = { -50,-153,-60,-132,-70,-150,-69,-110 } },
                { name = "Yagudo Zealot", level = "47-49", pts = { -50,-153,-60,-132,-70,-150,-69,-110 } },
                { name = "Yagudo Abbot", level = "50-52", pts = { -101,-95,-90,-109,-98,-142 } },
                { name = "Yagudo Chanter", level = "50-52", pts = { -101,-95,-90,-109,-98,-142 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, more = 1, mobs = {
                { name = "Yagudo Acolyte", level = "61-64", pts = { -338,246,-356,322,-321,381 } },
                { name = "Yagudo Condottiere", level = "61-64", pts = { 320,633,407,112 } },
                { name = "Yagudo Initiate", level = "61-64", pts = { -301,265,-343,286,-323,370 } },
                { name = "Yagudo Mendicant", level = "61-64", pts = { -325,206,-301,265,-282,332,-321,381 } },
                { name = "Yagudo Persecutor", level = "61-64", pts = { 312,661,320,633,407,112 } },
                { name = "Yagudo Piper", level = "61-64", pts = { -325,206,-343,286,-356,322 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Yagudo Drummer", level = "66-69", pts = { -8,678,694,13 } },
                { name = "Yagudo Herald", level = "66-69", pts = { 6,483,38,525,-174,620,725,51 } },
                { name = "Yagudo Interrogator", level = "66-69", pts = { -8,678,725,51 } },
                { name = "Yagudo Priest", level = "66-69", pts = { -69,757,694,13 } },
                { name = "Yagudo Theologist", level = "66-69", pts = { -69,757,694,13 } },
                { name = "Yagudo Votary", level = "66-69", pts = { -69,757,725,51,694,13 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, more = 1, mobs = {
                { name = "Yagudo Lutenist", level = "71-74", pts = { -26,-134,226,-182 } },
                { name = "Yagudo Missionary", level = "71-74", pts = { -22,-142,226,-182 } },
                { name = "Yagudo Prior", level = "71-74", pts = { 10,-132,259,-219 } },
                { name = "Yagudo Pythoness", level = "71-74", pts = { -22,-142,216,-134 } },
                { name = "Yagudo S (any)", level = "71-74", pts = { -48,-152,259,-219 } },
                { name = "Yagudo Templar", level = "71-74", pts = { -22,-142,260,-195 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, more = 1, mobs = {
                { name = "Yagudo Inquisitor", level = "71-74", pts = { 554,-47,377,144 } },
                { name = "Yagudo Lutenist", level = "71-74", pts = { 554,-47,377,144,145,186 } },
                { name = "Yagudo Missionary", level = "71-74", pts = { 556,-43,504,-177,377,144 } },
                { name = "Yagudo Prior", level = "71-74", pts = { 532,-106,504,-177,-143,183 } },
                { name = "Yagudo Pythoness", level = "71-74", pts = { 554,-47,377,144,145,186 } },
                { name = "Yagudo S (any)", level = "71-74", pts = { 556,-43,504,-177,-143,183 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, more = 7, mobs = {
                { name = "Yagudo Chanter", level = "76-79", pts = { -166,-100,-110,-42,-99,-14,-63,82 } },
                { name = "Yagudo Eradicator", level = "76-79", pts = { -156,64,-128,0,-77,-4,-63,82 } },
                { name = "Yagudo High Priest", level = "76-79", pts = { -182,-66,-110,-42,-77,-4,-28,16 } },
                { name = "Yagudo Prelate", level = "76-79", pts = { -182,-66,-110,-42,-77,-4,4,-18 } },
                { name = "Yagudo Prioress", level = "76-79", pts = { -166,-100,-110,-42,4,-18,-20,-62 } },
                { name = "Yagudo Sentinel", level = "76-79", pts = { -177,24,-156,64,-128,0,-77,-4 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Yagudo Chanter", level = "76-79", pts = { 715,-40,671,46,-113,-244 } },
                { name = "Yagudo Eradicator", level = "76-79", pts = { 701,-26,527,133,378,-322,154,-90 } },
                { name = "Yagudo High Priest", level = "76-79", pts = { 703,42,398,-130,118,-68,-6,-95 } },
                { name = "Yagudo Prelate", level = "76-79", pts = { 696,-48,430,-140,85,-201 } },
                { name = "Yagudo Prioress", level = "76-79", pts = { 715,-40,670,21 } },
                { name = "Yagudo Sentinel", level = "76-79", pts = { 718,15,215,273,-136,-277,25,29 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Yagudo Chanter", level = "77-79", pts = { -82,-62,-120,-75,-126,-106 } },
                { name = "Yagudo Eradicator", level = "77-79", pts = { -82,-62,-143,-38,-126,-106,-92,-37 } },
                { name = "Yagudo High Priest", level = "77-79", pts = { -140,-27,-126,-106,-92,-37 } },
                { name = "Yagudo Prelate", level = "77-79", pts = { -137,-51,-120,-75,-92,-37 } },
                { name = "Yagudo Sentinel", level = "77-79", pts = { -120,-75,-143,-38,-126,-106,-91,-42 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Yagudo Conductor", level = "81-83", pts = { -60,-131,-57,-96,-105,-97,-108,-138 } },
                { name = "Yagudo Flagellant", level = "81-83", pts = { -105,-97,-94,-110,-108,-138 } },
                { name = "Yagudo Hierogrammat", level = "81-83", pts = { -57,-185,-60,-131,-57,-96 } },
                { name = "Yagudo Nokizaru", level = "81-83", pts = { -48,-153,-60,-131,-57,-96 } },
                { name = "Yagudo S (any)", level = "81-83", pts = { -105,-97,-91,-113,-108,-138 } },
                { name = "Yagudo Yojimbo", level = "81-83", pts = { -60,-131,-57,-96,-105,-97,-108,-138 } },
            } },
        },
    },
    [640] = {
        name = "Tail Slap", level = 69, element = 15, skill = 217,
        family = "Lamiae", stats = "MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 54, zone = "Arrapago Reef", kind = nil, more = 7, mobs = {
                { name = "Merrow Chantress", level = "73-75", pts = { 464,72,457,110,-7,316,-156,406 } },
                { name = "Merrow Icedancer", level = "73-75", pts = { 534,306,-58,342,-96,350,-520,136 } },
                { name = "Merrow Shadowdancer", level = "73-75", pts = { 470,262,23,301,-98,416,-448,18 } },
                { name = "Merrow Bladedancer", level = "81-83", pts = { 199,285,-345,342 } },
                { name = "Merrow Songstress", level = "81-83", pts = { 183,294,388,420,-470,214 } },
                { name = "Merrow Typhoondancer", level = "81-83", pts = { -471,200,-301,302,-364,373 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Merrow Shadowdancer", level = "73-75", tags = { "Scripted spawn" }, pts = { -699,180 } },
                { name = "Merrow Typhoondancer", level = "73-75", tags = { "Scripted spawn" }, pts = { -702,147 } },
            } },
            { id = 48, zone = "Al Zahbi", kind = nil, mobs = {
                { name = "Merrow Cantatrice", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow No11", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow No12", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow Seafarer", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow Shiranuhi", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Merrow Cantatrice", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow No11", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow No12", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow Seafarer", level = "119", tags = { "Scripted spawn" } },
                { name = "Merrow Shiranuhi", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 74, zone = "Arrapago Remnants", kind = "Instance", mobs = {
                { name = "Merrow Chantress", level = "75-76", tags = { "Scripted spawn" }, pts = { 383,-372,387,-303,447,-385,452,185 } },
                { name = "Merrow Icedancer", level = "75-76", tags = { "Scripted spawn" }, pts = { 418,-541,374,552,388,568 } },
                { name = "Merrow Kabukidancer", level = "75-76", tags = { "Scripted spawn" }, pts = { 470,-472,445,28,446,455 } },
                { name = "Merrow Shadowdancer", level = "75-76", tags = { "Scripted spawn" }, pts = { 379,-469,372,-537,437,-7,423,409 } },
            } },
            { id = 55, zone = "Ilrusi Atoll", kind = "Instance", mobs = {
                { name = "D5J2-MERROW", level = "75-77", tags = { "Scripted spawn" }, pts = { 108,-420,379,-489 } },
                { name = "D5R3-MERROW", level = "75-77", tags = { "Scripted spawn" }, pts = { 262,-558 } },
            } },
            { id = 56, zone = "Periqia", kind = "Instance", mobs = {
                { name = "Merrow No16", level = "75", tags = { "Scripted spawn" } },
                { name = "Merrow Shadowdancer", level = "75", tags = { "Scripted spawn" } },
            } },
        },
    },
    [641] = {
        name = "Hysteric Barrage", level = 69, element = 15, skill = 217,
        family = "Lamiae", stats = "DEX+2, AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used while the monster is in a particular stance.", },
        extra_lists = { },
        zones = {
            { id = 54, zone = "Arrapago Reef", kind = nil, more = 16, mobs = {
                { name = "Lamia Dancer", level = "73-75", pts = { 580,219,-122,144 } },
                { name = "Lamia Dartist", level = "73-75", pts = { 580,219,104,160 } },
                { name = "Lamia Fatedealer", level = "73-75", pts = { 306,118,-98,36 } },
                { name = "Lamia Graverobber", level = "73-75", pts = { 574,95,338,59,179,124 } },
                { name = "Lamia Bellydancer", level = "81-83", pts = { -18,422 } },
                { name = "Lamia Deathdancer", level = "81-83", pts = { 134,462 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, more = 1, mobs = {
                { name = "Lamia Fatedealer", level = "74-75", pts = { 230,-96,182,-62 } },
                { name = "Lamia Chaukidar", level = "82-83", pts = { -597,-106,-715,377 } },
                { name = "Lamia Necromancer", level = "82-83", pts = { -550,54 } },
                { name = "Lamia Toxophilite", level = "82-83", pts = { -412,-71,-755,311 } },
                { name = "Lamia Deathdancer", level = "73-75", tags = { "Scripted spawn" } },
                { name = "Lamia No27", level = "79-81", nm = true, tags = { "NM (pop/scripted)" }, pts = { 455,-271 } },
            } },
            { id = 48, zone = "Al Zahbi", kind = nil, more = 6, mobs = {
                { name = "Lamia Commandress", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia Freebooter", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia Immolator", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia Jaeger", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia No15", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia No2", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, more = 4, mobs = {
                { name = "Lamia Commandress", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia Immolator", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia Jaeger", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia No15", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia No2", level = "119", tags = { "Scripted spawn" } },
                { name = "Lamia No21", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 74, zone = "Arrapago Remnants", kind = "Instance", mobs = {
                { name = "Lamia Dancer", level = "75-76", tags = { "Scripted spawn" }, pts = { 300,-510,233,-536,238,23,302,347 } },
                { name = "Lamia Dartist", level = "75-76", tags = { "Scripted spawn" }, pts = { 207,-303,293,-294,232,173,272,511 } },
                { name = "Lamia Fatedealer", level = "75-76", tags = { "Scripted spawn" }, pts = { 298,-530,232,-458,276,-4,225,472 } },
                { name = "Lamia Graverobber", level = "75-76", tags = { "Scripted spawn" }, pts = { 262,-378,225,-377,283,193,290,347 } },
            } },
            { id = 55, zone = "Ilrusi Atoll", kind = "Instance", mobs = {
                { name = "K22B6-LAMIA", level = "75-77", tags = { "Scripted spawn" }, pts = { -68,-421,27,-536 } },
                { name = "K22H3-LAMIA", level = "75-77", tags = { "Scripted spawn" }, pts = { 59,-530,-18,-457 } },
                { name = "K22P2-LAMIA", level = "75-77", tags = { "Scripted spawn" }, pts = { 59,-542,26,-427 } },
                { name = "Lamia No13", level = "77-78", tags = { "Scripted spawn" }, pts = { 24,-209 } },
            } },
            { id = 69, zone = "Leujaoam Sanctum", kind = "Instance", mobs = {
                { name = "Lamia Bowyer", level = "75", tags = { "Scripted spawn" } },
                { name = "Lamia Prosector", level = "75", tags = { "Scripted spawn" } },
                { name = "Lamia Sharper", level = "75", tags = { "Scripted spawn" } },
            } },
            { id = 56, zone = "Periqia", kind = "Instance", mobs = {
                { name = "Lamia No14", level = "75", tags = { "Scripted spawn" } },
                { name = "Lamia No17", level = "75", tags = { "Scripted spawn" } },
                { name = "Chigoe Breeder", level = "78-79", tags = { "Scripted spawn" }, pts = { -228,-13,-219,-109 } },
            } },
            { id = 57, zone = "Talacca Cove", kind = "Battlefield", mobs = {
                { name = "Lamia Exon", level = "85", tags = { "Scripted spawn" }, pts = { -177,182,-183,182,23,182,17,182 } },
            } },
        },
    },
    [642] = {
        name = "Amplification", level = 70, element = 15, skill = 222,
        family = "Flan", stats = "HP-5, MP+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Black Pudding", level = "72-74", pts = { -181,-182,-177,-144,-193,-108,-264,-169 } },
                { name = "Ebony Pudding", level = "77-79", pts = { -542,205,-538,238,-500,264,-499,179 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Licorice", level = "78-88", pts = { -228,679,-205,641,-272,651,-183,709 } },
                { name = "Guimauve", level = "85", pts = { -141,651 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Pitchy Pudding", level = "78-80", pts = { -150,62,-100,66,86,-6,86,48 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Ebony Pudding", level = "79-80", pts = { 169,156,188,168,225,180,231,155 } },
            } },
        },
    },
    [643] = {
        name = "Cannonball", level = 70, element = 15, skill = 222,
        family = "Wamouracampa", stats = "STR+1, DEX+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Wamouracampa only use this while curled up.", },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Wamouracampa", level = "72-76", pts = { -290,-188,-264,-169,254,253,277,227 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Wamoura Prince", level = "79-81", pts = { 20,202,81,202,44,240,368,119 } },
                { name = "Brass Borer", level = "83", nm = true, tags = { "NM (pop/scripted)" }, pts = { 399,120 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Granite Borer", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 401,-282 } },
            } },
            { id = 63, zone = "Lebros Cavern", kind = "Instance", mobs = {
                { name = "Ranch Wamouracampa", level = "75", tags = { "Scripted spawn" }, pts = { 496,261,463,257,469,177,448,120 } },
            } },
        },
    },
    [644] = {
        name = "Mind Blast", level = 73, element = 4, skill = 237,
        family = "Soulflayer", stats = "MP+5, MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Soulflayer", level = "82-83", pts = { 15,460,20,501,51,528,99,496 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Soulflayer", level = "82-83", pts = { 663,310,602,315,611,355,710,352 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Pneumaflayer", level = "83-84", pts = { -434,-351,-436,-335,-472,-351,-472,-302 } },
            } },
        },
    },
    [645] = {
        name = "Exuviation", level = 75, element = 0, skill = 247,
        family = "Wamoura", stats = "HP+5, MP+5, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Wamoura", level = "80-82", pts = { -28,362,-28,329,-3,340,35,339 } },
                { name = "Achamoth Nympha", level = "73-75", tags = { "Scripted spawn" }, pts = { -17,340,-35,336 } },
                { name = "Achamoth", level = "86-88", nm = true, tags = { "NM (pop/scripted)" }, pts = { -13,340 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Wamoura", level = "80-82", tags = { "Scripted spawn" }, pts = { -563,268,20,202,401,147,413,137 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Itzpapalotl", level = "90-93", nm = true, tags = { "NM (pop/scripted)" }, pts = { 436,-184,440,-179 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Taxet", level = "107-109", nm = true, tags = { "NM (pop/scripted)" }, pts = { -280,-290 } },
            } },
            { id = 48, zone = "Al Zahbi", kind = nil, mobs = {
                { name = "War Wamoura", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "War Wamoura", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Wamoura", level = "66-68", tags = { "Scripted spawn" } },
            } },
            { id = 63, zone = "Lebros Cavern", kind = "Instance", mobs = {
                { name = "Ranch Wamoura", level = "78", tags = { "Scripted spawn" } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Infected Wamoura", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [646] = {
        name = "Magic Hammer", level = 74, element = 6, skill = 242,
        family = "Frog", stats = "MP-5, MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Poroggo Gent", level = "56-67", tags = { "Fog" }, pts = { 93,-196,-331,-365,-343,-400,-274,668 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Poroggo", level = "75-77", pts = { -59,-65,-60,-100,-139,-101,-142,-62 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Poroggo Seducteur", level = "79-80", pts = { 433,-479,432,-539 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Poroggo Excavator", level = "98-99", pts = { 263,-157,296,-185,159,-211,183,-264 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Wetscale Toad", level = "125-126", pts = { -433,-556,-420,-526,-422,-536,-406,-477 } },
            } },
        },
    },
    [647] = {
        name = "Zephyr Mantle", level = 65, element = 2, skill = 198,
        family = "Puk", stats = "AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Puk", level = "68-70", pts = { -18,-328,-42,-320,-84,-563,-79,-599 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Puk M", level = "70-72", pts = { 119,-79,73,-37,58,-57,124,-153 } },
                { name = "Sea Puk M", level = "76-78", pts = { 43,-399,0,-446,-8,-409,-105,-360 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Sea Puk", level = "77-78", pts = { -106,-623,-122,-618,-142,-616,-199,-541 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Crepuscule Puk", level = "79-80", pts = { 236,-460,246,-502,273,-512,313,-474 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Peapuk", level = "81-82", pts = { -189,-672,-227,-677,-259,-711 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Desert Puk", level = "84-85", pts = { -359,-377,-355,-439,-300,-473,-246,-493 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Putrid Peapuk", level = "84-85", pts = { 348,66,308,102,324,92 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Snaggletooth Peapuk", level = "102-104", pts = { -200,-237,-209,-276,-199,-327,-242,-276 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Puk", level = "107-109", pts = { -285,503,-349,425,-311,429,-301,487 } },
            } },
        },
    },
    [648] = {
        name = "Regurgitation", level = 69, element = 5, skill = 217,
        family = "Peiste", stats = "MP+3, INT+1, MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Peiste", level = "66-70", pts = { 538,689,474,728,436,690,353,660 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Peiste", level = "73-76", pts = { -246,-286,-185,-255,-184,-193,-41,-202 } },
                { name = "Virulent Peiste", level = "78-81", pts = { -458,-470,-402,-330 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Virulent Peiste", level = "79-81", pts = { 96,4,98,41,83,74,-56,21 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Maritime Peiste", level = "84-85", pts = { 408,-375,418,-338,429,-346,430,-333 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Hinterland Peiste", level = "101-103", pts = { -403,242,-362,245,-419,356,-413,323 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Mountain Peiste", level = "102-104", pts = { -166,-116,-127,-332,-487,-184,-356,-250 } },
            } },
        },
    },
    [650] = {
        name = "Seedspray", level = 61, element = 3, skill = 178,
        family = "Rafflesia", stats = "VIT+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Rafflesia", level = "49-52", pts = { 55,406,259,380,227,318,202,328 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Rafflesia", level = "59-62", pts = { 175,-174,203,4,186,-199,258,43 } },
                { name = "Jumbo Rafflesia", level = "65-69", pts = { -165,613,-57,732,-98,696,-57,656 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Jumbo Rafflesia", level = "68-72", pts = { 78,194,13,173,147,182,-81,138 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Blooming Rafflesia", level = "71-73", pts = { -191,116,-260,104,-191,167,-248,163 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Highland Rafflesia", level = "78-88", pts = { -276,207,-295,251,-298,303,-247,310 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Corpse Flower", level = "107-109", pts = { 379,268,281,299,324,374,390,439 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Snippy Rafflesia", level = "125-126", pts = { -538,-539,-555,-529,-568,-543,-364,-461 } },
            } },
        },
    },
    [651] = {
        name = "Corrosive Ooze", level = 66, element = 5, skill = 203,
        family = "Slug", stats = "HP-10, MP+10", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Scabrous Slug", level = "56-62", pts = { 268,-228,275,-287,205,-271,189,-192 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Lou Carcolh", level = "69-73", pts = { 86,93,131,50,63,214,24,353 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Edible Slug", level = "72-76", pts = { -194,85,-118,123,-163,-165 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Treacle Slug", level = "79-80", pts = { -227,-16,-226,-41,-264,-33 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Gunge Slug", level = "79-80", pts = { -273,369,-222,378,-259,409,-265,454 } },
            } },
            { id = 258, zone = "Rala Waterways", kind = nil, mobs = {
                { name = "Plantpassage Slug", level = "99-107", pts = { 219,-139,165,-159,238,-197,140,-222 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Scummy Slug", level = "102-104", pts = { -197,525,-169,531,-167,552,-161,442 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Slinking Slug", level = "121-123", pts = { 273,-249,246,-338,247,-347,254,-258 } },
                { name = "Spumous Slug", level = "121-123", pts = { -37,314,23,485 } },
            } },
        },
    },
    [652] = {
        name = "Spiral Spin", level = 60, element = 15, skill = 174,
        family = "Ladybug", stats = "HP+5, STR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Ladybug", level = "44-47", pts = { 214,-257,223,-299,217,-365,378,-390 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Biddybug", level = "62-64", pts = { 99,334,-162,244,-147,314,274,555 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Mariehene", level = "71-74", pts = { 218,-77,159,-84,154,-121,206,-111 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Coccinelle", level = "80-81", pts = { 119,-489,151,-503,132,-519 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Nannakola", level = "81-82", pts = { 77,258,59,193,-11,130 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Resplendent Luckybug", level = "99-107", pts = { -443,36,-441,1,-428,-58,-414,-55 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Luckybug Hoarder", level = "100-101", pts = { -237,123,-400,82,-402,46,-240,-81 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Luckybug", level = "107-109", pts = { -37,-140,-135,-86 } },
            } },
        },
    },
    [653] = {
        name = "Asuran Claws", level = 70, element = 15, skill = 222,
        family = "Gnole", stats = "AGI+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Gnoles only use this while standing upright.", },
        extra_lists = { },
        zones = {
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Gnole", level = "65-67", pts = { -566,114,-633,173,-658,187,-564,-120 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Gnole", level = "66-68", pts = { -519,165,-490,164,-404,200,-492,215 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Decrepit Gnole", level = "73-75", pts = { 344,8,-276,13,-241,-50,-196,-113 } },
                { name = "Lobison", level = "81-82", pts = { -541,342,-342,194,-361,229,-367,272 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Lobison", level = "80-82", pts = { 56,-204,57,-247,85,-261,103,-262 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Fusty Gnole", level = "80-82", pts = { 269,149,168,63 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Luison", level = "81-82", pts = { -83,-506,37,-405,71,-574 } },
            } },
        },
    },
    [654] = {
        name = "Sub-zero Smash", level = 72, element = 15, skill = 232,
        family = "Ruszor", stats = "HP+10, VIT+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Ruszor", level = "78-82", pts = { -121,-387,180,-183,338,-239,386,-185 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Savage Ruszor", level = "79-82", pts = { 446,50,431,98,328,106,300,129 } },
            } },
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Slobbering Ruszor", level = "111-113", pts = { 246,159,285,162 } },
            } },
        },
    },
    [655] = {
        name = "Triumphant Roar", level = 71, element = 0, skill = 227,
        family = "Gargouille", stats = "STR+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used while the monster is in a particular form.", },
        extra_lists = { },
        zones = {
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Dire Gargouille", level = "78-82", pts = { 400,-208,337,-160,284,-268,-117,-14 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Dire Gargouille", level = "80-82", pts = { 23,137,19,142,-3,79,4,124 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Gnarled Gargouille", level = "80-82", pts = { -20,63,-64,55,-91,61,-102,104 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Gargouille", level = "81-82", pts = { -121,147,-48,134,-60,79,-18,42 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Benumbed Vodoriga", level = "82-83", pts = { -569,-104,-546,-30,-618,-6 } },
            } },
        },
    },
    [656] = {
        name = "Acrid Stream", level = 77, element = 5, skill = 257,
        family = "Clionidae", stats = "DEX+2, MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Ephemeral Clionid", level = "74-82", pts = { -223,279,-264,593,286,193,548,435 } },
                { name = "Ley Clionid", level = "74-80", pts = { 378,-453,466,-443,-380,362,-415,303 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Veld Clionid", level = "74-80", pts = { -628,559,-564,460,-586,507,-174,-463 } },
                { name = "Ephemeral Clionid", level = "79-83", pts = { -8,-168,-148,-420,588,-425,662,136 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Gully Clionid", level = "74-80", pts = { 167,-659,165,-662,185,-656,-233,-542 } },
                { name = "Ephemeral Clionid", level = "78-82", pts = { 113,-454,237,276,366,-370,-235,66 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Desert Clionid", level = "84-85", pts = { 628,-89,587,-52,507,3,613,57 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Knoll Clionid", level = "84-87", pts = { 0,202,-20,260,37,276,14,320 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Range Clionid", level = "84-85", pts = { -376,-43,-334,-44,-268,-28,-266,-106 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Clionid", level = "115-119", pts = { 556,-20,562,-82,561,-159 } },
            } },
        },
    },
    [657] = {
        name = "Blazing Bound", level = 80, element = 0, skill = 272,
        family = "Limule", stats = "AGI+1, VIT+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Ephemeral Limule", level = "74-83", pts = { -121,-677,361,421,-264,-104,-431,22 } },
                { name = "Sods Limule", level = "74-80", pts = { 480,-400,402,-363,-520,25,-454,25 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Gigadaphnia", level = "74-80", pts = { -446,384,-448,319,-427,346,309,328 } },
                { name = "Ephemeral Limule", level = "79-82", pts = { -427,346,662,136,431,419,45,71 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Gulch Limule", level = "74-80", pts = { -70,-374,-59,-401,-60,-359,117,-453 } },
                { name = "Ephemeral Limule", level = "78-82", pts = { -213,-317,207,-159,178,-675,-222,550 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Arid Limule", level = "83-85", pts = { 199,28,184,-29,109,24,11,27 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Stream Limule", level = "84-85", pts = { -407,-618,-369,-546,-317,-524,-260,-482 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Crag Limule", level = "84-85", pts = { -302,16,-267,-18,-191,-66,-179,-118 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Limule", level = "115-119", pts = { -469,-308,-505,-265,-546,-207 } },
            } },
        },
    },
    [658] = {
        name = "Plenilune Embrace", level = 76, element = 6, skill = 252,
        family = "Gnole", stats = "HP+5, STR+2", stats_verified = true,
        status = "unavailable", unbridled = false,
        notes = { "Not currently learnable on VanaDreams: the enemy move has no action script on the server, so monsters cannot use it.", },
        extra_lists = { },
        zones = {
        },
    },
    [659] = {
        name = "Demoralizing Roar", level = 80, element = 5, skill = 272,
        family = "Wivre", stats = "STR-2, VIT+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "The monster only uses this when you are beside it.", },
        extra_lists = { },
        zones = {
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Lesser Wivre", level = "45-48", pts = { -260,300,-297,374,-350,354,-412,375 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Wivre", level = "68-74", pts = { 197,-626,297,-463,544,-436,447,-352 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Mesa Wivre", level = "78-88", pts = { -85,338,-78,350,-47,329,-131,422 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Glade Wivre", level = "85-86", pts = { 329,186,358,225,420,264,415,249 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Volcanic Wivre", level = "102-105", pts = { 34,-166,98,-170,55,-227,129,-461 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Locus Wivre", level = "135-137", pts = { -550,-67,-606,-30,-597,1 } },
            } },
        },
    },
    [660] = {
        name = "Cimicine Discharge", level = 78, element = 3, skill = 262,
        family = "Gnat", stats = "DEX+1, AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Gnat", level = "75-78", pts = { -15,94,13,140 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Gnat", level = "78-82", pts = { -204,117,-262,140,-315,116,666,-392 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Nematocera", level = "79-80", pts = { -112,420,-121,451 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Gnat", level = "79-83", pts = { -117,27,-121,-62,-91,-26,-63,-141 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Chasm Gnat", level = "81-82", pts = { -526,208,-515,234,-487,245 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Vorst Gnat", level = "102-104", pts = { 206,-362,232,-358,222,-304,222,-184 } },
            } },
        },
    },
    [661] = {
        name = "Animating Wail", level = 79, element = 2, skill = 267,
        family = "Qutrub", stats = "HP+20", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Bog Body", level = "79-80", pts = { 352,481,400,496,322,486 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Lamia Idolater", level = "79-81", pts = { -473,-211,-416,-196,-436,-162,-367,-168 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Lamia Idolater", level = "80-82", pts = { 456,441,468,395,506,379,540,422 } },
            } },
        },
    },
    [662] = {
        name = "Battery Charge", level = 79, element = 6, skill = 267,
        family = "Magic Pot", stats = "MP+10, MND+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Magic Pot", level = "28-29", pts = { 460,-60,460,-57 } },
                { name = "Magic Urn", level = "34-35", pts = { 641,121,420,-17 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Magic Pot", level = "28-29", pts = { 91,62,80,17,82,-36 } },
                { name = "Magic Jar", level = "31-32", pts = { -419,-49,-480,-40,-458,99 } },
            } },
            { id = 158, zone = "Upper Delkfutts Tower", kind = nil, mobs = {
                { name = "Magic Urn", level = "34-35", pts = { -239,82 } },
                { name = "Magic Pot", level = "68-70", pts = { -295,20,-274,69 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Clockwork Pod", level = "41-43", pts = { -19,56,40,-47,41,139,63,121 } },
                { name = "Droma", level = "54-56", pts = { 0,39,3,229,-162,240,-171,9 } },
                { name = "Sentient Carafe", level = "98-99", pts = { 124,46,111,64 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Clockwork Pod", level = "44-45", pts = { -288,250 } },
                { name = "Droma", level = "52-54", pts = { 13,190,-52,227,-130,324,-191,326 } },
                { name = "Magic Jug", level = "62-64", pts = { -174,251,-167,187,-109,253,-107,188 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, mobs = {
                { name = "Magic Millstone", level = "54-58", pts = { 251,-68,274,-47,191,-332,-378,-265 } },
                { name = "Maledict Millstone", level = "64-68", pts = { 113,-350,92,-329,142,-338,257,302 } },
                { name = "Demonic Millstone", level = "72-75", pts = { -369,393,-391,393 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Magic Flagon", level = "64-69", pts = { -158,-89,160,-89,-68,16,60,18 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Hover Tank", level = "64-68", pts = { 17,-99,16,-137,-98,-131,-9,-150 } },
            } },
            { id = 130, zone = "Ru'Aun Gardens", kind = nil, mobs = {
                { name = "Sprinkler", level = "73-76", pts = { 2,-432,-26,-384,25,-386,0,-383 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Aura Pot", level = "75-80", pts = { 879,478,901,506,898,537,883,563 } },
            } },
            { id = 177, zone = "VeLugannon Palace", kind = nil, mobs = {
                { name = "Dustbuster", level = "75-78", pts = { 404,-41,401,-96,365,42,398,41 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Sinister Seidel", level = "87-88", pts = { 493,621,536,686,471,695,445,700 } },
            } },
        },
    },
    [663] = {
        name = "Leafstorm", level = 77, element = 2, skill = 257,
        family = "Treant", stats = "MP+3, MND+1, CHR+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Walking Tree", level = "27-28", pts = { -251,-142,306,-396,260,241 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Treant", level = "36-37", pts = { -159,426,-637,347 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Walking Tree", level = "48-49", pts = { 305,284,-299,195,348,-333,-314,-127 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Leshy", level = "52-54", pts = { -234,257,-180,251,-210,270,-175,287 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Walking Tree", level = "53-54", pts = { 143,-477,144,-521,280,-482,298,-519 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Knotty Treant", level = "62-65", pts = { -91,-341,-83,-269,122,-408,125,-327 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Mature Treant", level = "70-72", pts = { 157,-422,148,-310,160,-209,168,-134 } },
                { name = "Elder Treant", level = "80-82", pts = { 530,-18,522,-46,475,25,486,90 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Defoliate Treant", level = "71-74", pts = { -243,355,-237,388,-291,506,-316,589 } },
                { name = "Colorful Treant", level = "74-75", pts = { -414,278,-522,-79 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Olden Treant", level = "72-74", pts = { 326,387,230,485,191,510,37,554 } },
                { name = "Colorful Treant", level = "74-75", pts = { 230,485,37,554,81,636,-37,466 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Treant", level = "73-76", pts = { -409,-370,-449,-290,-475,-360,-474,-324 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Highland Treant", level = "78-88", pts = { 229,78,288,95,345,90,282,12 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Barrens Treant", level = "83-84", pts = { -437,-554,-509,-499,-537,-439 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Rift Treant", level = "83-84", pts = { 562,14,536,48,527,-18 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Knobby Treant", level = "100-102", pts = { -442,278,-562,-154 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Verdant Treant", level = "100-102", pts = { -400,82,-402,46,-445,-164,-473,-188 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Droughted Treant", level = "107-109", pts = { 282,-181,409,-227,396,-371,222,-271 } },
            } },
        },
    },
    [664] = {
        name = "Regeneration", level = 78, element = 6, skill = 262,
        family = "Sea Monk", stats = "MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Sea Monk", level = "32-35", pts = { -62,40,89,17,-57,-41,-20,192 } },
            } },
            { id = 176, zone = "Sea Serpent Grotto", kind = nil, mobs = {
                { name = "Sea Bonze", level = "47-50", pts = { 253,151,309,26,299,205 } },
                { name = "Devil Manta", level = "66-69", pts = { -218,-245,-187,-214,-229,-214,-298,-273 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, mobs = {
                { name = "Flying Manta", level = "55-59", pts = { 59,-36,120,-20,-43,-60,-100,-19 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Jasconius", level = "79-80", pts = { 139,273,189,266,192,242,143,208 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Nostokulshedra", level = "88-89", pts = { 253,383,339,308,344,355 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Lyngbakr", level = "119-122", pts = { 420,254,368,227 } },
            } },
        },
    },
    [665] = {
        name = "Final Sting", level = 81, element = 15, skill = 278,
        family = "Bee", stats = "HP-20, AGI+5", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Bees only use Final Sting at 50% HP or lower.", },
        extra_lists = { },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Bumblebee", level = "1", pts = { -84,-638,-64,-451 } },
                { name = "Giant Bee", level = "7-8", pts = { 52,-68,88,119,363,-102,307,21 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, mobs = {
                { name = "Huge Hornet", level = "1", pts = { 694,420,550,435,386,310 } },
                { name = "Maneating Hornet", level = "3-6", pts = { 381,640,245,662,130,518,202,378 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Huge Hornet", level = "1", pts = { 596,-354,526,-446,295,-265,185,-211 } },
                { name = "Maneating Hornet", level = "3-6", pts = { 236,-317,127,-484,341,-417,112,-338 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Bumblebee", level = "1", pts = { 51,-315,328,48,74,-428 } },
                { name = "Giant Bee", level = "7-8", pts = { 181,249,79,368,233,384,-100,40 } },
            } },
            { id = 145, zone = "Giddeus", kind = nil, mobs = {
                { name = "Giddeus Bee", level = "2-5", pts = { -161,320,-41,319,-66,269,-152,247 } },
                { name = "Digger Wasp", level = "11-13", pts = { 99,-156,164,-151,120,-201,123,-237 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Huge Wasp", level = "9-12", pts = { 303,32,391,148,607,179,365,296 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Huge Wasp", level = "10-12", pts = { -718,443,-463,-138,-321,245,51,222 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Killer Bee", level = "10-12", pts = { 136,-180,-45,-158,197,-27,94,-36 } },
            } },
            { id = 2, zone = "Carpenters Landing", kind = nil, mobs = {
                { name = "Digger Wasp", level = "14-17", pts = { -415,526 } },
                { name = "Spider Wasp", level = "19-22", pts = { -333,-164,-308,-229,-307,-266,-287,-373 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Bumblebee", level = "15-17", pts = { 55,406,259,380,227,318,202,328 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, mobs = {
                { name = "Water Wasp", level = "17-18", pts = { 174,-243,383,-20,-163,130,-288,481 } },
            } },
            { id = 149, zone = "Davoi", kind = nil, mobs = {
                { name = "Davoi Hornet", level = "20-23", pts = { 225,-77,220,-120,157,-104,268,-60 } },
                { name = "Davoi Wasp", level = "30-33", pts = { -112,87,-114,24,-151,-2,-115,-30 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Death Wasp", level = "25-26", pts = { 10,-737,-96,-608,-132,-519,-214,-404 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Miner Bee", level = "31-34", pts = { -293,-251,-201,-201,-161,-180,12,-133 } },
                { name = "Death Jacket", level = "37-40", pts = { -516,-18,-441,13,-424,65 } },
            } },
            { id = 25, zone = "Misareaux Coast", kind = nil, mobs = {
                { name = "Miner Bee", level = "31-34", pts = { 516,-287,530,-377,475,-417,383,-444 } },
                { name = "Death Jacket", level = "37-40", pts = { 360,187,161,141,118,340,-105,89 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Death Jacket", level = "33-37", pts = { 63,-320,175,-174,203,4,258,43 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Death Jacket", level = "34-37", pts = { -494,183,-539,175,-498,226,-466,272 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Yhoator Wasp", level = "37-40", pts = { -214,174,-181,87,-168,36,-134,39 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Huge Hornet", level = "38-39", pts = { 222,642,286,689,369,654,158,578 } },
                { name = "Maneating Hornet", level = "40-42", pts = { 297,516 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Death Jacket", level = "38-48", pts = { -108,321,-174,244,-274,176,-318,20 } },
                { name = "Death Wasp", level = "38-42", pts = { 167,405,189,326,60,373,81,502 } },
            } },
            { id = 197, zone = "Crawlers' Nest", kind = nil, mobs = {
                { name = "Death Jacket", level = "40-42", pts = { 261,-40,168,-22,184,-79 } },
                { name = "Soul Stinger", level = "48-50", pts = { 90,230,54,305 } },
                { name = "Wespe", level = "55-57", pts = { -83,181,-85,304 } },
                { name = "Vespo", level = "92-93", pts = { 82,-245,125,-293,115,-371,72,-405 } },
            } },
            { id = 159, zone = "Temple of Uggalepih", kind = nil, mobs = {
                { name = "Wespe", level = "52-55", pts = { 209,18,221,5,103,16,58,-104 } },
                { name = "Temple Bee", level = "60-63", pts = { 219,226,219,208,255,260,264,292 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Volcano Wasp", level = "61-64", pts = { 258,-73,220,-1,216,-128,128,-84 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Worker Pephredo", level = "62-64", pts = { 166,298,243,93,2,-297,-205,-415 } },
                { name = "Soldier Pephredo", level = "64-66", pts = { 161,297,239,92,8,-296,-199,-414 } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Wespe", level = "64-66", pts = { -92,172,-61,202,-98,267,-101,317 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Great Wasp", level = "79-80", pts = { -247,-75,-198,-103 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Wasp", level = "80-89", pts = { -120,-308,-174,-345,-225,-381,-190,-434 } },
                { name = "Eschan Mosquito", level = "119", pts = { -285,503,327,-282,612,-173,468,-441 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Javelin Wasp", level = "99-107", pts = { -162,-162,-178,-22 } },
                { name = "Flitting Bee", level = "119-122", pts = { 283,480,271,518,184,413,175,390 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Belaboring Wasp", level = "100-101", pts = { -120,120,-165,202,-41,277,40,242 } },
                { name = "Undergrowth Hornet", level = "100-101", pts = { 3,360,23,347,37,337,40,242 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Fiery Wasp", level = "100-101", pts = { -207,-202,-237,-211,-57,-324,-79,-321 } },
                { name = "Nettled Wasp", level = "100-101", pts = { 178,198,178,163,284,81,317,84 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Grove Wasp", level = "107-109", pts = { 19,95,-16,-47,-118,-2,-135,-86 } },
            } },
        },
    },
    [666] = {
        name = "Goblin Rush", level = 81, element = 15, skill = 278,
        family = "Goblin", stats = "HP+10, DEX+2, MND-3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Bozzetto Deathbringer", "Bozzetto Don", "Bozzetto Incanter", "Bozzetto Ravager", },
        zones = {
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, more = 3, mobs = {
                { name = "Goblin Thug", level = "1-6", pts = { 379,91,379,27,409,58,419,-21 } },
                { name = "Goblin Weaver", level = "3-6", pts = { 419,-21,300,21,300,100 } },
                { name = "Goblin Gambler", level = "20-23", pts = { -221,-112,-219,-168,-254,-141,-260,-219 } },
                { name = "Goblin Leecher", level = "20-23", pts = { -221,-112,-219,-168,-254,-141,-260,-219 } },
                { name = "Goblin Mugger", level = "20-23", pts = { -221,-112,-219,-168,-254,-141,-260,-219 } },
                { name = "Goblin Flesher", level = "80-82", pts = { 241,84,19,-120,-95,-142 } },
            } },
            { id = 101, zone = "East Ronfaure", kind = nil, mobs = {
                { name = "Goblin Fisher", level = "3-6", pts = { 378,26,474,-376 } },
                { name = "Goblin Thug", level = "3-8", pts = { 329,415,509,370,636,330,624,254 } },
                { name = "Goblin Weaver", level = "4-8", pts = { 509,370,636,330,624,254,755,537 } },
                { name = "Goblin Digger", level = "7-8", pts = { 358,-412 } },
            } },
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Goblin Thug", level = "3-6", pts = { 233,-410,217,-458,315,-388,307,21 } },
                { name = "Goblin Weaver", level = "3-6", pts = { 233,-410,217,-458,315,-388,307,21 } },
                { name = "Goblin Fisher", level = "4-6", pts = { -170,276,-69,127,280,276,-153,482 } },
                { name = "Goblin Digger", level = "6-7", pts = { 113,-40 } },
            } },
            { id = 190, zone = "King Ranperres Tomb", kind = nil, more = 2, mobs = {
                { name = "Goblin Thug", level = "3-8", pts = { -149,195,-175,112,-195,21,-154,23 } },
                { name = "Goblin Weaver", level = "4-8", pts = { -175,112,-195,21,-154,23,-110,22 } },
                { name = "Goblin Ambusher", level = "12-16", pts = { 40,19,103,22,140,74,168,79 } },
                { name = "Goblin Butcher", level = "12-16", pts = { 40,19,103,22,140,74,168,79 } },
                { name = "Goblin Tinkerer", level = "12-16", pts = { 40,19,103,22,140,74,168,79 } },
                { name = "Goblin Gambler", level = "21-23", pts = { 217,173,220,105 } },
            } },
            { id = 107, zone = "South Gustaberg", kind = nil, mobs = {
                { name = "Goblin Fisher", level = "3-5", pts = { 564,-537,580,-648 } },
                { name = "Goblin Thug", level = "3-8", pts = { 236,-317,127,-484,341,-417,112,-338 } },
                { name = "Goblin Weaver", level = "4-8", pts = { 112,-338,263,-525,157,-384,185,-482 } },
                { name = "Goblin Digger", level = "7-8", pts = { 296,-516 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Goblin Fisher", level = "3-4", pts = { -326,-405 } },
                { name = "Goblin Thug", level = "3-5", pts = { -144,-384,50,-170,159,8,319,140 } },
                { name = "Goblin Weaver", level = "3-5", pts = { 50,-170,159,8,319,140,-326,-405 } },
                { name = "Goblin Digger", level = "5-6", pts = { 238,204 } },
            } },
            { id = 106, zone = "North Gustaberg", kind = nil, more = 1, mobs = {
                { name = "Goblin Fisher", level = "4-5", pts = { -28,500 } },
                { name = "Goblin Thug", level = "4-8", pts = { 381,640,245,662,130,518,202,378 } },
                { name = "Goblin Weaver", level = "4-8", pts = { 245,662,202,378,307,379,269,460 } },
                { name = "Goblin Digger", level = "6-7", pts = { 197,502 } },
                { name = "Goblin Gambler", level = "21-22", pts = { -470,384 } },
                { name = "Goblin Leecher", level = "21-22", pts = { -470,384 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Goblin Thug", level = "4-7", pts = { 503,-618,492,-700,539,-659,463,-624 } },
                { name = "Goblin Weaver", level = "4-7", pts = { 503,-618,492,-700,539,-659,463,-624 } },
                { name = "Goblin Ambusher", level = "10-14", pts = { -317,773,-309,740,-379,739 } },
                { name = "Goblin Butcher", level = "10-14", pts = { -317,773,-309,740,-379,739 } },
                { name = "Goblin Tinkerer", level = "10-14", pts = { -317,773,-309,740,-379,739 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, more = 3, mobs = {
                { name = "Goblin Thug", level = "4-8", pts = { -153,-227,-179,-180 } },
                { name = "Goblin Weaver", level = "4-8", pts = { -153,-227,-179,-180 } },
                { name = "Goblin Gambler", level = "26-30", pts = { -197,-138,-298,-162,57,-123 } },
                { name = "Goblin Leecher", level = "26-30", pts = { -197,-138,-298,-162,-260,-179,57,-123 } },
                { name = "Goblin Mugger", level = "26-30", pts = { -197,-138,-298,-162,-260,-179,57,-123 } },
                { name = "Goblin Artificer", level = "88-90", pts = { 14,100,-201,95,2,161 } },
            } },
            { id = 100, zone = "West Ronfaure", kind = nil, mobs = {
                { name = "Goblin Thug", level = "4-8", pts = { -318,-78,-178,-136,-470,-148,-310,-228 } },
                { name = "Goblin Weaver", level = "4-8", pts = { -318,-78,-178,-136,-470,-148,-310,-228 } },
                { name = "Goblin Fisher", level = "6-7", pts = { -369,-438 } },
                { name = "Goblin Digger", level = "7-8", pts = { -443,-92 } },
            } },
            { id = 191, zone = "Dangruf Wadi", kind = nil, more = 6, mobs = {
                { name = "Goblin Fisher", level = "5-8", pts = { -42,-232,-82,-225,-172,-141,-227,-139 } },
                { name = "Goblin Thug", level = "5-8", pts = { -74,-79,-116,113,-197,84,-42,-232 } },
                { name = "Goblin Weaver", level = "5-8", pts = { -74,-79,-116,113,-197,84,-42,-232 } },
                { name = "Goblin Ambusher", level = "12-16", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
                { name = "Goblin Butcher", level = "12-16", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
                { name = "Goblin Tinkerer", level = "12-16", pts = { -252,25,-318,26,-300,-83,-359,-90 } },
            } },
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Goblin Butcher", level = "8-14", pts = { -100,-662,-281,-205,-404,-37,-418,-140 } },
                { name = "Goblin Thug", level = "8-13", pts = { -126,-690,-281,-205,-404,-37,-458,20 } },
                { name = "Goblin Tinkerer", level = "9-14", pts = { -281,-205,-404,-37,-418,-140,-113,272 } },
                { name = "Goblin Weaver", level = "9-13", pts = { -126,-690,-281,-205,-404,-37,-418,-140 } },
                { name = "Goblin Ambusher", level = "12-16", pts = { -126,-690,-281,-205,-404,-37,-458,20 } },
                { name = "Goblin Digger", level = "13-14", pts = { -82,676 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, more = 1, mobs = {
                { name = "Goblin Thug", level = "8-10", pts = { -718,443,-463,-138,-321,245,31,186 } },
                { name = "Goblin Weaver", level = "8-10", pts = { -718,443,-463,-138,-321,245,31,186 } },
                { name = "Goblin Fisher", level = "9-10", pts = { -13,110,579,-419,423,-541 } },
                { name = "Goblin Digger", level = "11-12", pts = { -578,50 } },
                { name = "Goblin Ambusher", level = "12-13", pts = { -463,-138,-321,245,31,186,461,314 } },
                { name = "Goblin Butcher", level = "12-13", pts = { -463,-138,-321,245,31,186,461,314 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Goblin Thug", level = "8-9", pts = { 52,-179,-229,-12,248,314 } },
                { name = "Goblin Weaver", level = "8-9", pts = { 52,-179,-229,-12,248,314 } },
                { name = "Goblin Ambusher", level = "12-14", pts = { 52,-179,-229,-12,-456,-140,-324,239 } },
                { name = "Goblin Butcher", level = "12-14", pts = { 52,-179,-229,-12,-456,-140,-324,239 } },
                { name = "Goblin Digger", level = "12-13", pts = { -45,242 } },
                { name = "Goblin Tinkerer", level = "12-14", pts = { 52,-179,-229,-12,-456,-140,-324,239 } },
            } },
            { id = 173, zone = "Korroloka Tunnel", kind = nil, mobs = {
                { name = "Goblin Bounty Hunter", level = "10", pts = { -48,106,-246,72,-180,109,-388,59 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Goblin Bounty Hunter", level = "10-36", pts = { 91,-66,44,-105,-30,-70,-225,-4 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, more = 1, mobs = {
                { name = "Goblin Ambusher", level = "16-17", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Butcher", level = "16-17", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Tinkerer", level = "16-17", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Digger", level = "18-19", pts = { 19,160 } },
                { name = "Goblin Gambler", level = "21-22", pts = { -120,82,314,186,312,420 } },
                { name = "Goblin Leecher", level = "21-22", pts = { -120,82,314,186,312,420 } },
            } },
            { id = 198, zone = "Maze of Shakhrami", kind = nil, more = 4, mobs = {
                { name = "Goblin Ambusher", level = "16-18", pts = { -256,-104,-178,4,-102,-45,-51,-7 } },
                { name = "Goblin Butcher", level = "16-18", pts = { -256,-104,-178,4,-102,-45,-51,-7 } },
                { name = "Goblin Tinkerer", level = "16-18", pts = { -256,-104,-178,4,-102,-45,-51,-7 } },
                { name = "Goblin Gambler", level = "22-26", pts = { -145,134,-49,-45,24,-78,124,-102 } },
                { name = "Goblin Leecher", level = "22-26", pts = { -145,134,-49,-45,24,-78,124,-102 } },
                { name = "Goblin Mugger", level = "22-26", pts = { -145,134,-49,-45,24,-78,124,-102 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, more = 1, mobs = {
                { name = "Goblin Ambusher", level = "16-17", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Butcher", level = "16-17", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Gambler", level = "16-25", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Tinkerer", level = "16-17", pts = { -81,-50,636,-362,-133,132,-19,444 } },
                { name = "Goblin Digger", level = "18-19", pts = { 291,233 } },
                { name = "Goblin Leecher", level = "21-22", pts = { -81,-50,636,-362,-133,132,-19,444 } },
            } },
            { id = 109, zone = "Pashhow Marshlands", kind = nil, more = 1, mobs = {
                { name = "Goblin Ambusher", level = "16-17", pts = { 183,40,-67,345,-178,150,357,439 } },
                { name = "Goblin Butcher", level = "16-17", pts = { 183,40,-67,345,-172,-75,-178,150 } },
                { name = "Goblin Tinkerer", level = "16-17", pts = { 183,40,-67,345,-178,150,357,439 } },
                { name = "Goblin Digger", level = "18-19", pts = { 108,44 } },
                { name = "Goblin Gambler", level = "21-22", pts = { 183,40,-67,345,-172,-75,-178,150 } },
                { name = "Goblin Leecher", level = "21-22", pts = { 183,40,-67,345,-178,150,357,439 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, more = 2, mobs = {
                { name = "Goblin Ambusher", level = "17-20", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
                { name = "Goblin Bounty Hunter", level = "17-20", pts = { 356,328,431,251,463,242,450,155 } },
                { name = "Goblin Butcher", level = "17-20", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
                { name = "Goblin Tinkerer", level = "17-20", pts = { -475,48,-313,33,-427,-206,-219,-79 } },
                { name = "Goblin Digger", level = "20-21", pts = { 221,103 } },
                { name = "Goblin Gambler", level = "22-25", pts = { -73,-158,23,-262,-5,35,94,-101 } },
            } },
            { id = 193, zone = "Ordelles Caves", kind = nil, more = 4, mobs = {
                { name = "Goblin Ambusher", level = "17-20", pts = { 39,477,60,441,-205,569,-170,509 } },
                { name = "Goblin Butcher", level = "17-20", pts = { 57,504,39,477,-205,569,-170,509 } },
                { name = "Goblin Tinkerer", level = "17-20", pts = { 57,504,39,477,-205,569,-170,509 } },
                { name = "Goblin Gambler", level = "22-26", pts = { -136,238,-160,174 } },
                { name = "Goblin Leecher", level = "22-26", pts = { -136,238,-160,174 } },
                { name = "Goblin Mugger", level = "22-26", pts = { -136,238,-160,174,-192,108,46,100 } },
            } },
            { id = 103, zone = "Valkurm Dunes", kind = nil, mobs = {
                { name = "Goblin Ambusher", level = "17-20", pts = { 811,308,631,217,525,329,400,53 } },
                { name = "Goblin Bounty Hunter", level = "17-20", pts = { 373,-212,345,-160,239,-171,332,-160 } },
                { name = "Goblin Butcher", level = "17-20", pts = { 811,308,631,217,525,329,400,53 } },
                { name = "Goblin Tinkerer", level = "17-20", pts = { 631,217,400,53,650,-183,887,-237 } },
                { name = "Goblin Digger", level = "19-20", pts = { -251,-92 } },
                { name = "Goblin Mugger", level = "22-25", pts = { 442,202,500,258,400,53,521,-28 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, more = 1, mobs = {
                { name = "Goblin Gambler", level = "25-29", pts = { -327,-408,-196,-372,-135,-292,-40,-391 } },
                { name = "Goblin Leecher", level = "25-29", pts = { 141,-409,62,-333,214,-350,289,-263 } },
                { name = "Goblin Mugger", level = "25-29", pts = { -327,-408,-196,-372,-135,-292,-120,-453 } },
                { name = "Goblin Furrier", level = "31-34", pts = { 443,-237,595,-170 } },
                { name = "Goblin Smithy", level = "31-34", pts = { 289,-263,406,-298,443,-237,595,-170 } },
                { name = "Goblin Robber", level = "42-46", pts = { -102,-222,259,-180,-81,-136,1,-113 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, more = 3, mobs = {
                { name = "Goblin Gambler", level = "26-27", pts = { -317,-14,-566,52,-358,244,-50,-77 } },
                { name = "Goblin Leecher", level = "26-27", pts = { -317,-14,-566,52,-358,244,-50,-77 } },
                { name = "Goblin Mugger", level = "26-27", pts = { -317,-14,-566,52,-358,244,-50,-77 } },
                { name = "Goblin Digger", level = "28-29", pts = { -28,355 } },
                { name = "Goblin Bounty Hunter", level = "30-36", pts = { 352,128,337,135,288,209,253,230 } },
                { name = "Goblin Furrier", level = "30-31", pts = { -317,-14,-566,52,-459,-97,-358,244 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, more = 2, mobs = {
                { name = "Goblin Gambler", level = "26-27", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Leecher", level = "26-27", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Mugger", level = "26-27", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Digger", level = "28-29", pts = { -125,-218 } },
                { name = "Goblin Furrier", level = "31-32", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
                { name = "Goblin Pathfinder", level = "31-32", pts = { -364,-538,-43,-190,112,-233,-422,-26 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, more = 3, mobs = {
                { name = "Goblin Furrier", level = "26-32", pts = { 528,139,536,-65,304,343,132,-33 } },
                { name = "Goblin Gambler", level = "26-27", pts = { 536,24,304,343,132,-33,300,-96 } },
                { name = "Goblin Leecher", level = "26-27", pts = { 536,24,304,343,132,-33,-286,335 } },
                { name = "Goblin Mugger", level = "26-27", pts = { 536,24,304,343,132,-33,300,-96 } },
                { name = "Goblin Pathfinder", level = "26-32", pts = { 528,139,536,-65,304,343,132,-33 } },
                { name = "Goblin Shaman", level = "26-32", pts = { 502,136,536,-65,304,343,132,-33 } },
            } },
            { id = 184, zone = "Lower Delkfutts Tower", kind = nil, mobs = {
                { name = "Goblin Gambler", level = "27-30", pts = { 521,-79,558,-36,397,88,451,26 } },
                { name = "Goblin Leecher", level = "27-30", pts = { 521,-79,558,-36,397,88,451,26 } },
                { name = "Goblin Mugger", level = "27-30", pts = { 521,-79,558,-36,397,88,451,26 } },
            } },
            { id = 157, zone = "Middle Delkfutts Tower", kind = nil, mobs = {
                { name = "Goblin Furrier", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
                { name = "Goblin Pathfinder", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
                { name = "Goblin Shaman", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
                { name = "Goblin Smithy", level = "30-34", pts = { 19,-59,93,-28,20,-29,20,67 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Goblin Furrier", level = "32-37", pts = { -137,224,-234,-111,-290,-139,-180,-161 } },
                { name = "Goblin Smithy", level = "32-37", pts = { -212,473,-221,405,-218,352,-154,356 } },
                { name = "Goblin Digger", level = "36-38", pts = { -460,-69 } },
                { name = "Goblin Poacher", level = "42-47", pts = { -624,15,-620,-32,-571,-103,-528,-96 } },
                { name = "Goblin Reaper", level = "42-47", pts = { 379,328,378,276,334,280,345,244 } },
                { name = "Goblin Robber", level = "42-47", pts = { -579,113,-624,15,-582,-48,-528,-96 } },
            } },
            { id = 11, zone = "Oldton Movalpolos", kind = nil, more = 3, mobs = {
                { name = "Goblin Craftsman", level = "33-36", pts = { -345,379,-284,184,-259,99,-234,-18 } },
                { name = "Goblin Gutterman", level = "33-36", pts = { -345,379,-301,218,-218,2,-92,91 } },
                { name = "Goblin Hammerman", level = "33-36", pts = { -304,287,-219,32,-125,60,-92,91 } },
                { name = "Goblin Leadman", level = "33-36", pts = { -334,311,-259,99,-217,22,-265,-22 } },
                { name = "Goblin Doorman", level = "42-44", pts = { -6,69,26,68,16,-43,165,-86 } },
                { name = "Goblin Oilman", level = "42-44", pts = { -6,69,17,49,36,-113,174,-75 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Goblin Pathfinder", level = "34-36", pts = { 431,825 } },
                { name = "Goblin Shaman", level = "34-36", pts = { 522,765 } },
                { name = "Hobgoblin Animalier", level = "72-74", pts = { 335,865,186,790,117,686 } },
                { name = "Hobgoblin Fascinator", level = "72-74", pts = { 281,804,154,799,155,724 } },
                { name = "Hobgoblin Martialist", level = "72-74", pts = { 361,880,209,802,127,696 } },
                { name = "Hobgoblin Venerer", level = "72-74", pts = { 318,824,209,802,117,686 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, more = 2, mobs = {
                { name = "Goblin Furrier", level = "35-37", pts = { 140,-25,137,73,288,216,340,205 } },
                { name = "Goblin Shaman", level = "35-39", pts = { 110,-133,140,-25,340,205,391,-118 } },
                { name = "Goblin Pathfinder", level = "36-39", pts = { 137,73,542,57,256,-240 } },
                { name = "Goblin Smithy", level = "36-39", pts = { 110,-133,288,216,424,183,380,81 } },
                { name = "Goblin Poacher", level = "42-44", pts = { 280,-198,357,-212 } },
                { name = "Goblin Reaper", level = "42-44", pts = { 277,-153,314,-166 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, more = 2, mobs = {
                { name = "Goblin Furrier", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Pathfinder", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Shaman", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Smithy", level = "35-38", pts = { -274,-317,-221,-200,56,-84,144,137 } },
                { name = "Goblin Poacher", level = "40-43", pts = { -339,126,96,-196,-6,-278,-109,-327 } },
                { name = "Goblin Reaper", level = "40-43", pts = { -339,126,96,-196,-6,-278,-109,-327 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, more = 4, mobs = {
                { name = "Goblin Pathfinder", level = "35-39", pts = { -223,13,-214,174,6,-129 } },
                { name = "Goblin Shaman", level = "35-39", pts = { -181,87,-168,36,-134,39,-60,18 } },
                { name = "Goblin Smithy", level = "35-39", pts = { -299,69,-254,59,-323,17,-374,29 } },
                { name = "Goblin Digger", level = "41-44", pts = { -69,-179 } },
                { name = "Goblin Reaper", level = "41-45", pts = { -46,-72,-2,-99,-20,-162,-420,-226 } },
                { name = "Goblin Poacher", level = "45-49", pts = { -456,-139,-502,-128,-461,-174,-466,-218 } },
            } },
            { id = 114, zone = "Eastern Altepa Desert", kind = nil, mobs = {
                { name = "Goblin Digger", level = "45-49", pts = { -211,-136 } },
                { name = "Goblin Poacher", level = "45-49", pts = { -85,-200,-162,-130,-210,-228,-202,-193 } },
                { name = "Goblin Reaper", level = "45-49", pts = { -265,130,-318,49,-259,-46,-202,-193 } },
                { name = "Goblin Robber", level = "45-49", pts = { -41,-329,-85,-200,-162,-130,-210,-228 } },
                { name = "Goblin Trader", level = "45-49", pts = { -265,130,-189,64,-318,49,-162,-130 } },
            } },
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Goblin Poacher", level = "46-49", pts = { -128,-186,-30,-162,118,-40,257,-5 } },
                { name = "Goblin Reaper", level = "46-49", pts = { 95,-58,118,-40,158,-76,225,-23 } },
                { name = "Goblin Robber", level = "46-49", pts = { -84,-176,-6,-134,153,-42,118,-40 } },
                { name = "Goblin Alchemist", level = "65-68", pts = { -78,-50,-138,-17,-42,-20 } },
                { name = "Goblin Mercenary", level = "65-68", pts = { -78,-50,-138,-17 } },
                { name = "Goblin Shepherd", level = "65-68", pts = { -78,-50,-138,-17,-42,-20 } },
            } },
            { id = 213, zone = "Labyrinth of Onzozo", kind = nil, more = 6, mobs = {
                { name = "Goblin Poacher", level = "46-49", pts = { -20,-260,-2,-157 } },
                { name = "Goblin Reaper", level = "46-49", pts = { -20,-260,-1,-131 } },
                { name = "Goblin Robber", level = "46-49", pts = { -20,-260,-1,-131 } },
                { name = "Goblin Trader", level = "46-49", pts = { -1,-131 } },
                { name = "Goblin Bouncer", level = "51-58", pts = { 120,-109,42,-78,59,-4,42,26 } },
                { name = "Goblin Enchanter", level = "51-58", pts = { 118,-87,55,-59,59,-4,42,26 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Goblin Poacher", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
                { name = "Goblin Reaper", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
                { name = "Goblin Robber", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
                { name = "Goblin Trader", level = "47-49", pts = { 16,122,-10,80,22,79,-40,102 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, more = 1, mobs = {
                { name = "Goblin Poacher", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Reaper", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Robber", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Trader", level = "47-49", pts = { -14,58,-61,54,-50,69,-103,60 } },
                { name = "Goblin Bouncer", level = "50-52", pts = { -105,101,-90,90,-13,101,-31,109 } },
                { name = "Goblin Enchanter", level = "50-52", pts = { -105,101,-90,90,-13,101,-31,109 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Goblin Bouncer", level = "51-55", pts = { -633,-303 } },
                { name = "Goblin Digger", level = "51-54", pts = { -407,-540 } },
                { name = "Goblin Enchanter", level = "51-55", pts = { -633,-303,-650,-294 } },
                { name = "Goblin Hunter", level = "51-55", pts = { -636,-335 } },
                { name = "Goblin Welldigger", level = "51-55", pts = { -633,-303 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { 512,408,646,376,698,415,790,482 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { 513,473,528,327,624,323,732,411 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { 460,414,550,277,759,543 } },
                { name = "Goblin Skirmisher", level = "56-59", pts = { 709,446,622,283,498,322 } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, more = 1, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { -237,231,369,654,392,418 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { -237,231,158,578,219,361 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { 113,477,178,492 } },
                { name = "Goblin Skirmisher", level = "56-59", pts = { 289,1025,-417,-40,-462,455 } },
                { name = "Goblin Aidman", level = "71-74", pts = { 328,759,268,786,282,899,281,848 } },
                { name = "Goblin Chapman", level = "71-74", pts = { 328,759,268,786,282,899,281,848 } },
            } },
            { id = 9, zone = "PsoXja", kind = nil, more = 2, mobs = {
                { name = "Goblin Bouncer", level = "56-58", pts = { 168,-332 } },
                { name = "Goblin Enchanter", level = "56-58", pts = { 214,-326 } },
                { name = "Goblin Hunter", level = "56-58", pts = { 214,-326 } },
                { name = "Goblin Jeweler", level = "56-58", pts = { 191,-352 } },
                { name = "Goblin Alchemist", level = "62-68", pts = { 136,-330,146,-349,150,-303 } },
                { name = "Goblin Bandit", level = "62-67", pts = { 136,-330,146,-349,130,-391,150,-303 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { 268,-228,205,-271,-716,-391 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { 352,-147,275,-287,253,-345 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { 352,-147,253,-345,-725,-459 } },
                { name = "Goblin Skirmisher", level = "58-63", pts = { -301,92,-447,-59,-192,-311,-69,-576 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Goblin Draftee", level = "56-59", pts = { -36,45,339,378,-126,-202 } },
                { name = "Goblin Franctireur", level = "56-59", pts = { 316,270,339,378,-126,-202 } },
                { name = "Goblin Patrolman", level = "56-59", pts = { -36,45,316,270,339,378,-126,-202 } },
                { name = "Goblin Skirmisher", level = "56-59", pts = { 233,364,-83,-314 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Goblin Freesword", level = "61-64", pts = { -91,-341,122,-408 } },
                { name = "Goblin Blastmaster", level = "62-64", pts = { 122,-408,125,-327,121,-248 } },
                { name = "Goblin Corpsman", level = "62-64", pts = { -91,-341,125,-327,121,-248 } },
                { name = "Goblin Pioneer", level = "62-64", pts = { -359,-726,408,617 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Goblin Blastmaster", level = "62-64", pts = { 111,93,24,156,-47,74,-130,152 } },
                { name = "Goblin Corpsman", level = "62-64", pts = { 111,93,134,132,-19,136,-132,100 } },
                { name = "Goblin Freesword", level = "62-64", pts = { 134,132,64,97,15,87,-104,81 } },
                { name = "Goblin Pioneer", level = "62-64", pts = { -6,130,-154,180,-183,396 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Goblin Pioneer", level = "62-64", pts = { 217,-88,-262,308,-237,609 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Goblin Blastmaster", level = "62-64", pts = { 149,282,253,300 } },
                { name = "Goblin Corpsman", level = "62-64", pts = { 167,286,264,300 } },
                { name = "Goblin Freesword", level = "62-64", pts = { 150,271,253,300,264,300 } },
                { name = "Goblin Pioneer", level = "62-64", pts = { 218,308 } },
            } },
            { id = 113, zone = "Cape Teriggan", kind = nil, mobs = {
                { name = "Goblin Alchemist", level = "65-68", pts = { -225,-37,-59,-52,-9,139,0,258 } },
                { name = "Goblin Bandit", level = "65-68", pts = { -168,-100,-150,8,-59,-52,-54,20 } },
                { name = "Goblin Mercenary", level = "65-68", pts = { -169,-256,-96,-92,-138,-53,-150,8 } },
                { name = "Goblin Shepherd", level = "65-68", pts = { -178,-158,-168,-100,-138,-53,-110,13 } },
            } },
            { id = 205, zone = "Ifrit's Cauldron", kind = nil, mobs = {
                { name = "Goblin Alchemist", level = "66-69", pts = { -21,-176,-252,-142,-270,-112,-268,-72 } },
                { name = "Goblin Bandit", level = "66-69", pts = { -21,-210,-252,-142,-270,-112,-109,170 } },
                { name = "Goblin Mercenary", level = "66-69", pts = { -21,-176,-270,-112,-268,-72,-72,167 } },
                { name = "Goblin Shepherd", level = "66-69", pts = { -21,-210,-252,-142,-270,-112,-268,-72 } },
            } },
            { id = 174, zone = "Kuftal Tunnel", kind = nil, mobs = {
                { name = "Goblin Alchemist", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
                { name = "Goblin Bandit", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
                { name = "Goblin Mercenary", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
                { name = "Goblin Tamer", level = "66-69", pts = { 244,56,263,44,186,63,128,19 } },
            } },
            { id = 12, zone = "Newton Movalpolos", kind = nil, more = 3, mobs = {
                { name = "Goblin Fireman", level = "66-69", pts = { -296,-192,-228,-179,-186,122,-164,136 } },
                { name = "Goblin Foreman", level = "66-69", pts = { -283,-180,-186,122,-98,217,127,138 } },
                { name = "Goblin Lengthman", level = "66-69", pts = { -296,-192,-228,-179,-222,137,-98,217 } },
                { name = "Goblin Packman", level = "66-69", pts = { -296,-150,-228,-179,-193,143,18,217 } },
                { name = "Goblin Hangman", level = "75-79", pts = { -6,-14,86,-20,145,-8,174,51 } },
                { name = "Goblin Headman", level = "75-79", pts = { 99,-141,-61,-17,91,24,167,18 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Goblin Flagman", level = "66-69", pts = { -185,-255,-184,-193,-41,-202,34,-276 } },
                { name = "Goblin Grenadier", level = "66-69", pts = { -246,-286,-184,-193,-41,-202 } },
                { name = "Goblin Guerrilla", level = "66-69", pts = { -280,-358,34,-276 } },
                { name = "Goblin Toxophilite", level = "66-69", pts = { -59,367,180,87 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Goblin Flagman", level = "66-69", pts = { 273,147,347,270,354,217,456,316 } },
                { name = "Goblin Grenadier", level = "66-69", pts = { 273,147,347,270,354,217,456,316 } },
                { name = "Goblin Guerrilla", level = "66-69", pts = { 273,147,307,119,244,-219,171,-165 } },
                { name = "Goblin Toxophilite", level = "66-69", pts = { 313,313,269,84 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Goblin Flagman", level = "66-69", pts = { -160,24,-164,110,-194,32 } },
                { name = "Goblin Grenadier", level = "66-69", pts = { -170,-23,-168,81,-187,72,-210,1 } },
                { name = "Goblin Guerrilla", level = "66-69", pts = { -205,-37,-187,72,-234,-30 } },
                { name = "Goblin Toxophilite", level = "66-69", pts = { -194,45,-177,-2 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Goblin Bombardier", level = "71-74", pts = { -359,-241,-478,-365,-362,-371 } },
                { name = "Goblin Field Doctor", level = "71-74", pts = { -369,-300,-536,-436 } },
                { name = "Goblin Paratrooper", level = "71-74", pts = { -396,-394,-294,-281,-416,-469 } },
                { name = "Goblin Picket", level = "71-74", pts = { -347,-319,-446,-408 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Goblin Bombardier", level = "71-73", pts = { -59,357,666,-413,-149,95 } },
                { name = "Goblin Field Doctor", level = "71-74", pts = { 30,349,666,-413,-149,95 } },
                { name = "Goblin Paratrooper", level = "71-73", pts = { -59,357,30,349,666,-413,-149,95 } },
                { name = "Goblin Picket", level = "71-74", pts = { 212,-436,-324,-130,624,491 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Goblin Plunderer", level = "81-82", pts = { 365,-426,446,-406,524,-410,477,-466 } },
                { name = "Goblin Meatgrinder", level = "82-83", pts = { 412,-323,483,-308,501,-267 } },
            } },
        },
    },
    [667] = {
        name = "Vanity Dive", level = 82, element = 15, skill = 284,
        family = "Wanderer", stats = "AGI+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 18, zone = "Promyvion-Dem", kind = nil, mobs = {
                { name = "Wanderer", level = "22-33", pts = { 119,-119,171,-189,197,-190,181,-258 } },
                { name = "Apex Idle Drifter", level = "139-142", pts = { 235,-197,-70,227,-50,207,-42,158 } },
            } },
            { id = 16, zone = "Promyvion-Holla", kind = nil, mobs = {
                { name = "Wanderer", level = "22-33", pts = { 1,84,-42,72,-73,124,-137,-9 } },
                { name = "Apex Idle Drifter", level = "139-142", pts = { 3,155,34,158,42,119,-205,-75 } },
            } },
            { id = 20, zone = "Promyvion-Mea", kind = nil, mobs = {
                { name = "Wanderer", level = "22-33", pts = { -112,246,-189,258,-210,270,-132,-266 } },
                { name = "Apex Idle Drifter", level = "139-142", pts = { -162,316,42,-309,40,-357,-226,-194 } },
            } },
            { id = 22, zone = "Promyvion-Vahzl", kind = nil, mobs = {
                { name = "Wanderer", level = "46-52", pts = { 29,-99,40,-156,33,-202,42,-275 } },
                { name = "Apex Idle Drifter", level = "139-142", pts = { 85,-215,117,-205,121,-249,120,-298 } },
            } },
        },
    },
    [668] = {
        name = "Magic Barrier", level = 82, element = 7, skill = 284,
        family = "Ahriman", stats = "MP+7, INT+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Bat Eye", level = "40-42", pts = { -31,-223,-106,-154,56,-84,15,52 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Bat Eye", level = "42-44", pts = { 137,-62 } },
                { name = "Hovering Oculus", level = "90-92", pts = { -78,22,-120,214,-57,202,92,114 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Evil Eye", level = "45-48", pts = { 317,-194,368,-89,183,-145,65,-18 } },
            } },
            { id = 161, zone = "Castle Zvahl Baileys", kind = nil, mobs = {
                { name = "Evil Eye", level = "46-48", pts = { 327,-19,262,63,212,36,179,19 } },
                { name = "Morbid Eye", level = "52-55", pts = { -138,33,-140,9,-70,22,-60,156 } },
                { name = "Ahriman", level = "63-65", pts = { 33,141,38,-98,-157,141,-150,-99 } },
            } },
            { id = 162, zone = "Castle Zvahl Keep", kind = nil, mobs = {
                { name = "Evil Eye", level = "46-48", pts = { -38,-19,-58,-21,-82,-21,-61,143 } },
                { name = "Morbid Eye", level = "52-53", pts = { -274,-23,-301,10 } },
                { name = "Deadly Iris", level = "55-56", pts = { -378,41,-500,89,-500,44 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Fachan", level = "73-75", pts = { 452,193 } },
                { name = "Smolenkos", level = "80-82", pts = { 251,472,136,493,74,427,-286,367 } },
                { name = "Scowlenkos", level = "86-87", pts = { -227,240,-176,240,-220,293,-282,320 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Deep Eye", level = "79-80", pts = { 311,306,379,306,413,292 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Gawper", level = "80-82", pts = { 88,60,112,1,130,-72,51,-133 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Ogler", level = "80-82", pts = { -29,-25,-59,-19,-60,-46,-87,-17 } },
                { name = "Doom Lens", level = "82-83", pts = { -86,8,-81,-52,-381,44 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Ogler", level = "81-82", pts = { -141,32,-137,10,-78,46,-60,145 } },
                { name = "Doom Lens", level = "84-85", pts = { -57,35,-61,52,-22,20,14,-34 } },
            } },
        },
    },
    [669] = {
        name = "Whirl of Rage", level = 83, element = 15, skill = 290,
        family = "Evil Weapon", stats = "STR+2, DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 108, zone = "Konschtat Highlands", kind = nil, mobs = {
                { name = "Poltergeist", level = "18-19", pts = { 550,416,464,249 } },
            } },
            { id = 102, zone = "La Theine Plateau", kind = nil, mobs = {
                { name = "Poltergeist", level = "18-19", pts = { 654,-100 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Poltergeist", level = "18-19", pts = { 177,486 } },
            } },
            { id = 192, zone = "Inner Horutoto Ruins", kind = nil, mobs = {
                { name = "Boggart", level = "22-26", pts = { -301,-99,-284,-43,-239,-41,-279,40 } },
            } },
            { id = 104, zone = "Jugner Forest", kind = nil, mobs = {
                { name = "Boggart", level = "25-26", pts = { 279,-331,337,-222,572,191 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Boggart", level = "26-27", pts = { -251,94,402,3,495,38,617,-5 } },
            } },
            { id = 194, zone = "Outer Horutoto Ruins", kind = nil, mobs = {
                { name = "Dancing Weapon", level = "28-30", pts = { -360,-630,-362,-661 } },
            } },
            { id = 126, zone = "Qufim Island", kind = nil, mobs = {
                { name = "Dancing Weapon", level = "28-29", pts = { 152,-374,179,-204,118,57,-142,234 } },
            } },
            { id = 166, zone = "Ranguemont Pass", kind = nil, mobs = {
                { name = "Evil Weapon", level = "35-37", pts = { -278,200 } },
            } },
            { id = 105, zone = "Batallia Downs", kind = nil, mobs = {
                { name = "Evil Weapon", level = "37-38", pts = { 158,-328 } },
            } },
            { id = 110, zone = "Rolanberry Fields", kind = nil, mobs = {
                { name = "Evil Weapon", level = "37-38", pts = { 318,-320,441,-61,387,-155,325,234 } },
            } },
            { id = 120, zone = "Sauromugue Champaign", kind = nil, mobs = {
                { name = "Evil Weapon", level = "37-38", pts = { 81,-209,-206,189,-106,73 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Cursed Weapon", level = "43-45", pts = { 392,-150,241,-99,61,-22 } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Demonic Weapon", level = "45-46", pts = { 192,-84,-5,-16 } },
            } },
            { id = 200, zone = "Garlaige Citadel", kind = nil, mobs = {
                { name = "Demonic Weapon", level = "47-49", pts = { -167,248,-126,217,-112,249 } },
                { name = "Over Weapon", level = "59-62", pts = { 27,132,130,48,152,75,-288,179 } },
                { name = "Vault Weapon", level = "60-62", pts = { 27,132,130,48,152,75,-288,179 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Killing Weapon", level = "59-61", pts = { 72,234,-141,180,-90,72,-109,71 } },
                { name = "Hellish Weapon", level = "61-63", pts = { 72,234,-141,180,-90,72,-109,71 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Weapon", level = "60-69", pts = { -458,109,-520,170,-470,242,-403,282 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Killing Weapon", level = "60-64", pts = { 1,-126,-30,-109,-42,-94,43,-100 } },
                { name = "Ominous Weapon", level = "61-65", pts = { 1,-126,-42,-94,43,-100,-83,-96 } },
                { name = "Apocalyptic Weapon", level = "78-80", pts = { -117,50,-143,28,-146,5,-193,-40 } },
                { name = "Infernal Weapon", level = "79-81", pts = { -117,50,-164,20,-193,-40,-186,-9 } },
            } },
            { id = 177, zone = "VeLugannon Palace", kind = nil, mobs = {
                { name = "Mystic Weapon", level = "74-77", pts = { -38,-397,-125,-397,-125,-359,3,-305 } },
                { name = "Ornamental Weapon", level = "74-76", pts = { 38,-399,125,-395,122,-363,-1,-323 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Decorative Weapon", level = "79-81", pts = { -43,86,-70,71,-87,48,-20,28 } },
                { name = "Aura Weapon", level = "80-82", pts = { 881,722,900,698,879,642,859,621 } },
            } },
        },
    },
    [670] = {
        name = "Benthic Typhoon", level = 83, element = 15, skill = 290,
        family = "Murex", stats = "STR+2, VIT+2, DEX-1, AGI-1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Escarp Murex", level = "77-80", pts = { 435,252,477,255,465,294,498,324 } },
                { name = "Ephemeral Murex", level = "79-88", pts = { 467,284,222,205,263,380,-2,298 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "River Murex", level = "77-78", pts = { -442,527,-407,528,-412,548,-76,540 } },
                { name = "Ephemeral Murex", level = "79-88", pts = { -430,530,-65,502,168,239,40,56 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Sand Murex", level = "79-88", pts = { -204,-657,-249,-667,-257,-616 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Ephemeral Murex", level = "79-88", pts = { -14,-206,80,-140,191,-244,152,-40 } },
                { name = "Rock Murex", level = "79-88", pts = { -18,-124,0,-179,-16,-222,57,-148 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Hillock Murex", level = "84-85", pts = { 129,-625,192,-634,233,-627,286,-590 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Iceberg Murex", level = "84-85", pts = { -244,-367,-211,-345,-144,-332 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Murex", level = "115-119", pts = { -436,353,-409,401,-368,454 } },
            } },
        },
    },
    [671] = {
        name = "Auroral Drape", level = 84, element = 2, skill = 296,
        family = "Weeper", stats = "INT+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 18, zone = "Promyvion-Dem", kind = nil, mobs = {
                { name = "Weeper", level = "24-35", pts = { 183,-266,149,-294,206,-228,-235,-36 } },
                { name = "Apex Woeful Lamenter", level = "139-142", pts = { -50,207,16,181 } },
            } },
            { id = 16, zone = "Promyvion-Holla", kind = nil, mobs = {
                { name = "Weeper", level = "24-35", pts = { 1,81,-50,116,-73,124,-41,144 } },
                { name = "Apex Woeful Lamenter", level = "139-142", pts = { -205,-75,-201,-107 } },
            } },
            { id = 20, zone = "Promyvion-Mea", kind = nil, mobs = {
                { name = "Weeper", level = "24-35", pts = { -189,258,-192,294,-85,-276,30,-210 } },
                { name = "Apex Woeful Lamenter", level = "139-142", pts = { -112,134,-86,97,228,-210,277,-195 } },
            } },
            { id = 22, zone = "Promyvion-Vahzl", kind = nil, mobs = {
                { name = "Weeper", level = "48-54", pts = { 41,-74,33,-292,-11,-244,-22,-299 } },
                { name = "Apex Woeful Lamenter", level = "139-142", pts = { 266,223,323,225,374,242,-351,74 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Lamenter", level = "78-82", pts = { -227,-333 } },
            } },
        },
    },
    [672] = {
        name = "Osmosis", level = 84, element = 7, skill = 296,
        family = "Amoeban", stats = "MND+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Crevice Amoeban", level = "77-80", pts = { -93,-99,-138,-104,-174,-115,-262,-97 } },
                { name = "Ephemeral Amoeban", level = "79-80", pts = { -146,-114,-115,-4,-179,217,58,-16 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Protoamoeban", level = "77-80", pts = { 513,255,493,200,444,195,457,147 } },
                { name = "Ephemeral Amoeban", level = "79-80", pts = { 476,194,456,75,217,300,22,333 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Stream Amoeban", level = "77-78", pts = { -459,627,-456,592,-409,593,-397,624 } },
                { name = "Ephemeral Amoeban", level = "79-80", pts = { -436,607,-267,537,-11,270,342,407 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Oasis Amoeban", level = "80-89", pts = { 572,158,516,182,496,216,555,269 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Pond Amoeban", level = "83-85", pts = { -259,-731,-261,-697,-184,-676,-182,-649 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Floe Amoeban", level = "84-85", pts = { -227,-276,-183,-274,-247,-238 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Amoeban", level = "115-119", pts = { 194,521,248,515,317,488 } },
            } },
        },
    },
    [673] = {
        name = "Quad. Continuum", level = 85, element = 15, skill = 302,
        family = "Gorger", stats = "DEX+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 18, zone = "Promyvion-Dem", kind = nil, mobs = {
                { name = "Gorger", level = "28-39", pts = { 188,-237,-199,50,-237,-137,-144,-11 } },
                { name = "Satiator", level = "38", nm = true, tags = { "NM" }, pts = { -234,310 } },
            } },
            { id = 22, zone = "Promyvion-Vahzl", kind = nil, mobs = {
                { name = "Gorger", level = "52-58", pts = { 66,-266,50,-119,63,183,-101,166 } },
                { name = "Offspring", level = "47-48", tags = { "Scripted spawn" }, pts = { 188,-60 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Hadal Mirror", level = "83-85", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Depths Digester", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Warder of Loyalty", level = "124", nm = true, tags = { "NM (pop/scripted)" }, pts = { 462,-96 } },
            } },
            { id = 19, zone = "Spire of Dem", kind = "Battlefield", mobs = {
                { name = "Offspring", level = "27-28", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
                { name = "Neogorger", level = "30", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
                { name = "Neoingester", level = "30", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
                { name = "Neosatiator", level = "30", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
            } },
            { id = 23, zone = "Spire of Vahzl", kind = "Battlefield", mobs = {
                { name = "Offspring", level = "47-48", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
                { name = "Ingurgitator", level = "50", tags = { "Scripted spawn" }, pts = { -240,-8,240,-8 } },
                { name = "Neoingurgitator", level = "50", nm = true, tags = { "NM (pop/scripted)" }, pts = { -239,-6,-240,30,0,30,241,-6 } },
            } },
        },
    },
    [674] = {
        name = "Fantod", level = 85, element = 0, skill = 302,
        family = "Hippogryph", stats = "HP-10, DEX+2, AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Hippogryph", level = "40-42", pts = { 690,-539,715,-678,738,-859,569,-790 } },
                { name = "Cloud Hippogryph", level = "45-47", pts = { 70,380,-602,-569,-723,-335 } },
            } },
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Nimbus Hippogryph", level = "49-52", pts = { 612,-501,510,-651,661,-701,474,-542 } },
                { name = "Strato Hippogryph", level = "55-57", pts = { 261,-508,167,-530,73,-517,-242,727 } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Grauberg Hippogryph", level = "73-75", pts = { 10,216,24,316,14,379,-40,309 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Nesting Hippogryph", level = "125", pts = { -238,-339,-181,-355,-313,-421,-204,-470 } },
            } },
        },
    },
    [675] = {
        name = "Thermal Pulse", level = 86, element = 0, skill = 308,
        family = "Wamouracampa", stats = "VIT+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Wamouracampa only use this while stretched out (not curled).", },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Wamouracampa", level = "72-76", pts = { -290,-188,-264,-169,254,253,277,227 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Wamoura Prince", level = "79-81", pts = { 20,202,81,202,44,240,368,119 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Gullycampa", level = "83-84", pts = { 413,-244,399,-213,428,-192,407,-167 } },
            } },
        },
    },
    [677] = {
        name = "Empty Thrash", level = 87, element = 15, skill = 314,
        family = "Craver", stats = "STR+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 20, zone = "Promyvion-Mea", kind = nil, mobs = {
                { name = "Craver", level = "28-39", pts = { -203,278,-31,-240,-192,-171,-214,-287 } },
            } },
            { id = 22, zone = "Promyvion-Vahzl", kind = nil, mobs = {
                { name = "Craver", level = "52-58", pts = { 66,-266,50,-119,63,183,-101,166 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Warder of Mercy", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { -442,337 } },
            } },
        },
    },
    [678] = {
        name = "Dream Flower", level = 87, element = 7, skill = 314,
        family = "Mandragora", stats = "HP+5, MP+5, CHR+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Magh Bihu TVR", },
        zones = {
            { id = 116, zone = "East Sarutabaruta", kind = nil, mobs = {
                { name = "Tiny Mandragora", level = "1", pts = { -84,-638,-64,-451 } },
                { name = "Mandragora", level = "4-6", pts = { 52,-68,88,119,363,-102,-170,276 } },
            } },
            { id = 115, zone = "West Sarutabaruta", kind = nil, mobs = {
                { name = "Tiny Mandragora", level = "1", pts = { 51,-315,328,48,74,-428 } },
                { name = "Mandragora", level = "4-5", pts = { 51,107,-66,292,314,333,181,249 } },
            } },
            { id = 117, zone = "Tahrongi Canyon", kind = nil, mobs = {
                { name = "Pygmaioi", level = "8-11", pts = { 128,-626,115,-577,329,-488,-75,-369 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Tiny Lycopodium", level = "10-12", pts = { 329,-9,373,21,338,100,302,48 } },
            } },
            { id = 118, zone = "Buburimu Peninsula", kind = nil, mobs = {
                { name = "Sylvestre", level = "15-19", pts = { -475,48,-313,33,-340,-102,-427,-206 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "22-25", pts = { -436,-653,-510,-574,-454,-540,-492,-445 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "28-32", pts = { 392,-86,296,-103,200,-38,131,16 } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "28-32", pts = { 167,405,189,326,60,373,81,502 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "28-32", pts = { -316,341,-316,280,-304,446,-251,338 } },
            } },
            { id = 123, zone = "Yuhtunga Jungle", kind = nil, mobs = {
                { name = "Yuhtunga Mandragora", level = "30-33", pts = { -212,473,-221,405,-218,352,-154,356 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Lycopodium", level = "31-34", pts = { -364,434,-311,409,-541,296,-496,-358 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Yhoator Mandragora", level = "35-37", pts = { -262,157,-264,105,-299,69,-254,59 } },
            } },
            { id = 4, zone = "Bibiki Bay", kind = nil, mobs = {
                { name = "Alraune", level = "38-40", pts = { -327,-481,-443,-521,-473,-522,-553,-765 } },
            } },
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Mourioche", level = "62-68", pts = { 180,-86,205,-58,215,-62,162,-16 } },
                { name = "Korrigan", level = "72-75", pts = { -37,-92,-15,-123,-124,-34,-166,-45 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Puck", level = "74-77", pts = { 434,299,400,238,461,317,460,326 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Pachypodium", level = "78-82", pts = { 107,-12,129,-27,82,6,161,-45 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Fear Dearg", level = "82-83", pts = { -617,-300,-618,-341,-663,-340,-663,-283 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Hannequet", level = "82-95", pts = { 424,26,428,76,465,-30,438,-53 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Orapodium", level = "84-85", pts = { 655,-496,700,-466,706,-476,706,-443 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Blanched Mandragora", level = "100-101", pts = { 320,113,323,84,324,53,282,-5 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Pinetorum", level = "100-101", pts = { 237,-82,282,-279,364,151,365,129 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Nachtschatten", level = "101-110", pts = { 113,-257,100,-278,59,-323 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Bonaria", level = "101-103", pts = { -103,-133,-100,-120 } },
                { name = "Apex Mandragora", level = "125-127", pts = { 85,-179,18,-267,23,-284 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Fuliginous Mandragora", level = "102-106", pts = { 412,361,458,356,366,196,227,269 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Maca Maca", level = "102-105", pts = { 259,-263,279,-370,307,-441,301,333 } },
            } },
        },
    },
    [679] = {
        name = "Occultation", level = 88, element = 2, skill = 320,
        family = "Seether", stats = "VIT+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 18, zone = "Promyvion-Dem", kind = nil, mobs = {
                { name = "Seether Prom", level = "30-37", pts = { -201,-141,-244,-161,-280,-120,-218,79 } },
                { name = "Apex Livid Rager", level = "139-142", pts = { 258,207,277,203,276,-16,314,-40 } },
            } },
            { id = 16, zone = "Promyvion-Holla", kind = nil, mobs = {
                { name = "Seether Prom", level = "30-37", pts = { -108,-94,-76,-82,-71,-50,-50,-30 } },
                { name = "Apex Livid Rager", level = "139-142", pts = { 3,-198,-7,-171,1,-115 } },
            } },
            { id = 20, zone = "Promyvion-Mea", kind = nil, mobs = {
                { name = "Seether Prom", level = "30-37", pts = { -178,-172,-225,-244,-198,-362,-295,-293 } },
                { name = "Apex Livid Rager", level = "139-142", pts = { -49,234,-8,197 } },
            } },
            { id = 22, zone = "Promyvion-Vahzl", kind = nil, mobs = {
                { name = "Seether", level = "50-56", pts = { 36,244,-159,173,-113,161,380,-172 } },
                { name = "Apex Livid Rager", level = "139-142", pts = { 77,161,40,152,-430,76,-438,111 } },
            } },
        },
    },
    [680] = {
        name = "Charged Whisker", level = 88, element = 4, skill = 320,
        family = "Coeurl", stats = "HP-10, DEX+2, INT+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Attohwa Coeurl", level = "37-39", pts = { 212,160,479,120,502,49,481,0 } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Lynx", level = "47-50", pts = { 495,236,484,164,582,184,476,110 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Lynx", level = "49-51", pts = { -259,586,-200,560,-84,511,17,485 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "War Lynx", level = "71-73", pts = { 37,-173,73,-175,32,-118,87,-117 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Caracal", level = "80-82", pts = { 45,121,-9,90 } },
            } },
        },
    },
    [681] = {
        name = "Winds of Promy.", level = 89, element = 6, skill = 326,
        family = "Thinker", stats = "MND+3, CHR-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 16, zone = "Promyvion-Holla", kind = nil, mobs = {
                { name = "Thinker", level = "28-39", pts = { -1,126,-166,-35,-75,-51,-218,-96 } },
                { name = "Cerebrator", level = "38", nm = true, tags = { "NM" }, pts = { -266,150 } },
            } },
            { id = 22, zone = "Promyvion-Vahzl", kind = nil, mobs = {
                { name = "Thinker", level = "54-58", pts = { 66,-266,50,-119,63,183,-101,166 } },
                { name = "Ponderer", level = "56-58", nm = true, tags = { "NM (pop/scripted)" }, pts = { -335,140 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Brooder", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -381,87 } },
                { name = "Ruminator", level = "90", nm = true, tags = { "NM (pop/scripted)" }, pts = { 512,-184 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Warder of Dignity", level = "124", nm = true, tags = { "NM (pop/scripted)" }, pts = { -549,-206 } },
            } },
            { id = 17, zone = "Spire of Holla", kind = "Battlefield", mobs = {
                { name = "Cogitator", level = "34", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
                { name = "Wreaker", level = "37-38", tags = { "Scripted spawn" }, pts = { -240,0,240,0 } },
            } },
            { id = 23, zone = "Spire of Vahzl", kind = "Battlefield", mobs = {
                { name = "Contemplator", level = "50", tags = { "Scripted spawn" }, pts = { -243,-4,-3,-4,240,2 } },
                { name = "Agonizer", level = "54-55", nm = true, tags = { "NM (pop/scripted)" }, pts = { -245,0,-5,0,235,0 } },
            } },
        },
    },
    [682] = {
        name = "Delta Thrust", level = 89, element = 15, skill = 326,
        family = "Peiste", stats = "HP+15, MP-5, INT-1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Peiste", level = "66-70", pts = { 538,689,474,728,436,690,353,660 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Peiste", level = "73-76", pts = { -246,-286,-185,-255,-184,-193,-41,-202 } },
                { name = "Virulent Peiste", level = "78-81", pts = { -458,-470,-402,-330 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Virulent Peiste", level = "79-81", pts = { 96,4,98,41,83,74,-56,21 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Maritime Peiste", level = "84-85", pts = { 408,-375,418,-338,429,-346,430,-333 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Hinterland Peiste", level = "101-103", pts = { -403,242,-362,245,-419,356,-413,323 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Mountain Peiste", level = "102-104", pts = { -166,-116,-127,-332,-487,-184,-356,-250 } },
            } },
        },
    },
    [683] = {
        name = "Evryone. Grudge", level = 90, element = 7, skill = 332,
        family = "Tonberry", stats = "INT+2, MND+2, STR-1, VIT-1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Not used by Tonberry NMs.", },
        extra_lists = { },
        zones = {
            { id = 159, zone = "Temple of Uggalepih", kind = nil, more = 1, mobs = {
                { name = "Tonberry Cutter", level = "51-59", pts = { 202,-19,161,-62,140,-106,103,16 } },
                { name = "Tonberry Harrier", level = "51-59", pts = { 202,-19,161,-62,140,-17,61,-140 } },
                { name = "Tonberry Stalker", level = "51-59", pts = { 202,-19,161,-62,107,-141,95,53 } },
                { name = "Tonberry Dismayer", level = "61-69", pts = { -218,13,-218,26,17,-99,-47,-142 } },
                { name = "Tonberry Maledictor", level = "61-69", pts = { -218,13,17,-99,-47,-142,-97,-109 } },
                { name = "Tonberry Pursuer", level = "61-69", pts = { -218,13,17,-99,-47,-142,-97,-109 } },
            } },
            { id = 124, zone = "Yhoator Jungle", kind = nil, mobs = {
                { name = "Tonberry Chopper", level = "61-63", pts = { 2,-434,28,-454,274,-162,306,-210 } },
                { name = "Tonberry Jinxer", level = "61-63", pts = { 17,-434,274,-178,296,-204 } },
                { name = "Tonberry Shadower", level = "61-63", pts = { 1,-375,50,-466,20,-422,18,-435 } },
            } },
            { id = 160, zone = "Den of Rancor", kind = nil, mobs = {
                { name = "Tonberry Imprecator", level = "62-64", pts = { 36,-43,103,-43,180,-80,41,-112 } },
                { name = "Tonberry Trailer", level = "62-65", pts = { -1,-40,20,-40,21,-99,103,-43 } },
                { name = "Tonberry Beleaguerer", level = "66-72", pts = { -61,-83,417,301,83,-161,74,-126 } },
                { name = "Tonberry Slasher", level = "67-71", pts = { -57,-79,417,301,403,360,74,-126 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Tonberry Bedeviler", level = "81-82", pts = { 393,615,433,619,468,617 } },
                { name = "Cryptonberry Occultist", level = "83-84", pts = { 428,661,493,658,538,646 } },
            } },
        },
    },
    [684] = {
        name = "Reaving Wind", level = 90, element = 2, skill = 332,
        family = "Pugil", stats = "STR+2, AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Apex Jagil", level = "125-127", pts = { 138,-287,156,-258,174,-272 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Apex Jagil", level = "128-130", pts = { -60,118,-83,-48,-95,-83,-186,56 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Apex Jagil", level = "130-133", pts = { 375,-171,412,-167,299,-91,198,-129 } },
            } },
        },
    },
    [685] = {
        name = "Barrier Tusk", level = 91, element = 3, skill = 339,
        family = "Marid", stats = "HP+15, MP-15, VIT+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used while the monster is in a particular form.", },
        extra_lists = { },
        zones = {
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Marid", level = "77-78", pts = { 210,370,161,338 } },
                { name = "Grand Marid", level = "79-80", pts = { 161,338 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Marid", level = "77-78", pts = { 125,309,202,286,281,120,180,116 } },
                { name = "Grand Marid", level = "79-80", pts = { 125,309,281,120 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Morose Marid", level = "81-82", pts = { 147,116,126,108,62,79,34,68 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Olyphant", level = "93-95", pts = { -246,373,-361,352,-243,383,-280,375 } },
            } },
        },
    },
    [686] = {
        name = "Mortal Ray", level = 91, element = 7, skill = 339,
        family = "Taurus", stats = "STR+2, MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, mobs = {
                { name = "Taurus", level = "37-38", pts = { 128,-123 } },
                { name = "Stegotaur", level = "44-48", pts = { 118,-1,56,108,178,59,120,203 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, mobs = {
                { name = "Stegotaur S", level = "47-49", pts = { -143,10,-180,29,-140,79,-61,47 } },
                { name = "Teratotaur", level = "57-59", pts = { 97,-38,141,60,140,-60,253,-2 } },
            } },
            { id = 5, zone = "Uleguerand Range", kind = nil, mobs = {
                { name = "Brontotaur", level = "68-71", pts = { 350,-263,368,-146,436,-175 } },
                { name = "Tyrannotaur", level = "72-75", pts = { 576,104,477,132,424,194,483,270 } },
                { name = "Molech", level = "79-82", pts = { 251,472,136,493,29,492,-286,367 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Dryptotaur", level = "79-80", pts = { -96,-177,-73,-101,-10,-150,48,-107 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Aestutaur", level = "80-81", pts = { -266,-149,-220,-151,-263,-188,-201,-195 } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Gorgotaur", level = "80-82", pts = { -227,52,-279,85,-312,96,-229,-99 } },
                { name = "Tarbotaur", level = "82-83", pts = { -227,52,-349,42 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Titanotaur", level = "83", pts = { -502,78,-502,28 } },
            } },
        },
    },
    [687] = {
        name = "Water Bomb", level = 92, element = 5, skill = 346,
        family = "Frog", stats = "MP+20, INT+4, MND+2, STR-3, VIT-3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Poroggo Gent", level = "56-67", tags = { "Fog" }, pts = { 93,-196,-331,-365,-343,-400,-274,668 } },
            } },
            { id = 65, zone = "Mamook", kind = nil, mobs = {
                { name = "Poroggo", level = "75-77", pts = { -59,-65,-60,-100,-139,-101,-142,-62 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Poroggo Seducteur", level = "79-80", pts = { 433,-479,432,-539 } },
            } },
            { id = 169, zone = "Toraimarai Canal", kind = nil, mobs = {
                { name = "Poroggo Excavator", level = "98-99", pts = { 263,-157,296,-185,159,-211,183,-264 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Wetscale Toad", level = "125-126", pts = { -433,-556,-420,-526,-422,-536,-406,-477 } },
            } },
        },
    },
    [688] = {
        name = "Heavy Strike", level = 92, element = 15, skill = 346,
        family = "Golem", stats = "STR+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Stone Golem", level = "40-42", pts = { 202,13,229,-124,267,-140,354,-178 } },
            } },
            { id = 204, zone = "Fei'Yin", kind = nil, mobs = {
                { name = "Ore Golem", level = "43-45", pts = { -22,39,-20,79,204,-40,203,161 } },
                { name = "Colossus", level = "56-58", pts = { 3,229,-70,181,-191,190,-192,170 } },
            } },
            { id = 121, zone = "The Sanctuary of Zi'Tah", kind = nil, mobs = {
                { name = "Rock Golem", level = "49-50", pts = { -179,-346,23,-425,420,-301,499,-577 } },
            } },
            { id = 122, zone = "Ro'Maeve", kind = nil, mobs = {
                { name = "Mythril Golem", level = "68-70", pts = { 1,-67,1,-23,-1,16 } },
                { name = "Darksteel Golem", level = "80-82", pts = { -250,-13,-257,-46,248,-18,261,-46 } },
            } },
            { id = 177, zone = "VeLugannon Palace", kind = nil, mobs = {
                { name = "Enkidu", level = "77-80", pts = { -198,400,-255,396,-117,405,-119,440 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Aura Statue", level = "81-84", pts = { 737,-576,56,42,59,-38,28,-62 } },
                { name = "Aura Sculpture", level = "104-106", pts = { 82,-1,116,1 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Verglas Golem", level = "98-99", pts = { -196,373,-210,339,-218,296,-282,321 } },
            } },
        },
    },
    [689] = {
        name = "Dark Orb", level = 93, element = 7, skill = 353,
        family = "Gargouille", stats = "AGI+2, MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Gargoyles only use this while flying.", },
        extra_lists = { },
        zones = {
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Dire Gargouille", level = "78-82", pts = { 400,-208,337,-160,284,-268,-117,-14 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Gruesome Gargouille", level = "80-81", pts = { -307,-246,-281,-269,-313,-318,-301,-355 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Dire Gargouille", level = "80-82", pts = { 23,137,19,142,-3,79,4,124 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Gnarled Gargouille", level = "80-82", pts = { -20,63,-64,55,-91,61,-102,104 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Gargouille", level = "81-82", pts = { -121,147,-48,134,-60,79,-18,42 } },
            } },
        },
    },
    [690] = {
        name = "White Wind", level = 94, element = 2, skill = 360,
        family = "Puk", stats = "HP+5, AGI+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 153, zone = "The Boyahda Tree", kind = nil, mobs = {
                { name = "Snaggletooth Peapuk", level = "102-104", pts = { -200,-237,-209,-276,-199,-327,-242,-276 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Vulpangue", level = "78-80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -697,-123 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Waugyl", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -409,-295 } },
            } },
            { id = 67, zone = "Jade Sepulcher", kind = "Battlefield", mobs = {
                { name = "Phantom Puk", level = "76", tags = { "Scripted spawn" }, pts = { 240,240,-240,-240 } },
            } },
        },
    },
    [692] = {
        name = "Sudden Lunge", level = 95, element = 15, skill = 367,
        family = "Ladybug", stats = "HP-5, MP-5, AGI+1, DEX+1", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Ladybug", level = "44-47", pts = { 214,-257,223,-299,217,-365,378,-390 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Biddybug", level = "62-64", pts = { 99,334,-162,244,-147,314,274,555 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Mariehene", level = "71-74", pts = { 218,-77,159,-84,154,-121,206,-111 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Coccinelle", level = "80-81", pts = { 119,-489,151,-503,132,-519 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Nannakola", level = "81-82", pts = { 77,258,59,193,-11,130 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Resplendent Luckybug", level = "99-107", pts = { -443,36,-441,1,-428,-58,-414,-55 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Luckybug Hoarder", level = "100-101", pts = { -237,123,-400,82,-402,46,-240,-81 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Luckybug", level = "107-109", pts = { -37,-140,-135,-86 } },
            } },
        },
    },
    [693] = {
        name = "Quadrastrike", level = 96, element = 15, skill = 374,
        family = "Demon", stats = "STR+3, CHR+3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used by NMs or in Dynamis.", },
        extra_lists = { },
        zones = {
            { id = 42, zone = "Dynamis - Tavnazia", kind = "Dynamis", more = 9, mobs = {
                { name = "Kindred Bard", level = "95-97", pts = { 82,60 } },
                { name = "Kindred Beastmaster", level = "95-97", pts = { 100,1 } },
                { name = "Kindred Black Mage", level = "95-97", pts = { 100,1 } },
                { name = "Kindred Dark Knight", level = "95-97", pts = { 109,45 } },
                { name = "Kindred Dragoon", level = "95-97", pts = { 82,60 } },
                { name = "Kindred Monk", level = "95-97", pts = { 100,1 } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Marquis Forneus", level = "80-85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -343,138 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, mobs = {
                { name = "Gloam Servitor", level = "101-102", nm = true, tags = { "NM (pop/scripted)" }, pts = { -403,45,-71,-195,-233,129 } },
                { name = "Abununnu", level = "105-106", nm = true, tags = { "NM (pop/scripted)" }, pts = { -402,44,-71,-193,-229,130 } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Awoken Angantyr", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { -423,-13 } },
                { name = "Awoken Hjorvarth", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { -420,-16 } },
                { name = "Awoken Hrani", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { -422,-13 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Hanbis Demon", level = "123", nm = true, tags = { "NM (pop/scripted)" }, pts = { -291,-402,292,-384,-471,152,104,-432 } },
            } },
            { id = 144, zone = "Waughroon Shrine", kind = "Battlefield", mobs = {
                { name = "Onki", level = "61", nm = true, tags = { "NM (pop/scripted)" }, pts = { -177,-140,23,20,223,140 } },
                { name = "Gaki", level = "62", nm = true, tags = { "NM (pop/scripted)" }, pts = { -177,-144,23,16,223,136 } },
                { name = "Rasetsu", level = "63", nm = true, tags = { "NM (pop/scripted)" }, pts = { -177,-142,23,18,223,138 } },
            } },
            { id = 156, zone = "Throne Room (S)", kind = "Battlefield", mobs = {
                { name = "Marquis Amon", level = "77-79", nm = true, tags = { "NM (pop/scripted)" }, pts = { -463,-241,-783,-481,-1103,-721 } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", more = 7, mobs = {
                { name = "Angantyr", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Barri", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Berserkr", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Brami", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Bui", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Hadding the Elder", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [694] = {
        name = "Vapor Spray", level = 96, element = 5, skill = 374,
        family = "Phuabo", stats = "HP+15, VIT+4", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 33, zone = "Al'Taieu", kind = nil, mobs = {
                { name = "Ul'phuabo", level = "75-77", pts = { -18,-532,36,-538,-58,-679,28,-699 } },
                { name = "Om'phuabo", level = "79-81", pts = { 632,-306,652,-235,638,-194,586,-32 } },
                { name = "Ru'phuabo", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { 478,-566 } },
                { name = "Jailer of Hope", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -682,-77 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Eschan Phuabo", level = "112-115", pts = { 70,-206,74,-167,114,-185,-68,-200 } },
                { name = "Warders Phuabo", level = "123", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Warder of Hope", level = "124", nm = true, tags = { "NM (pop/scripted)" }, pts = { -79,-198 } },
            } },
            { id = 143, zone = "Palborough Mines", kind = nil, mobs = {
                { name = "Mind-warped Scorpion", level = "139", nm = true, tags = { "NM (pop/scripted)" }, pts = { 95,-61 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Tristitia", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [695] = {
        name = "Thunder Breath", level = 97, element = 4, skill = 381,
        family = "Wyvern", stats = "STR+2, DEX+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "Only used when the target is in Dynamis or a battlefield.", },
        extra_lists = { },
        zones = {
            { id = 168, zone = "Chamber of Oracles", kind = "Battlefield", mobs = {
                { name = "Lightning Wyvern", level = "75-76", tags = { "Scripted spawn" }, pts = { 2,-240,2,240 } },
            } },
        },
    },
    [696] = {
        name = "O. Counterstance", level = 98, element = 0, skill = 388,
        family = "Orc", stats = "HP+10, STR+3, VIT+3, DEX-2, AGI-2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { "On VanaDreams this move is restricted to the Shadowreign (S) zones.", },
        extra_lists = { },
        zones = {
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Orcish Fodder", level = "62-64", pts = { 460,-471,358,-317,326,-346 } },
                { name = "Orcish Mesmerizer", level = "62-64", pts = { 460,-471,358,-317 } },
                { name = "Orcish Neckchopper", level = "62-64", pts = { 460,-471,358,-317,326,-346 } },
                { name = "Orcish Stonechucker", level = "62-64", pts = { 460,-471,326,-346 } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Orcish Brawler", level = "65-69", pts = { -584,101,-618,149,-672,168,-708,133 } },
                { name = "Orcish Chasseur", level = "65-69", pts = { -584,101,-618,149,-654,192,-672,168 } },
                { name = "Orcish Impaler", level = "65-69", pts = { -584,101,-618,149,-642,192 } },
                { name = "Orcish Trooper", level = "65-69", pts = { -642,192,-672,168,-708,133 } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Orcish Brawler", level = "67-69", pts = { 340,-126,340,-154,278,-139 } },
                { name = "Orcish Chasseur", level = "67-69", pts = { 340,-126,340,-154,278,-139 } },
                { name = "Orcish Cursemaker", level = "67-69", pts = { 340,-126,340,-154,339,-138 } },
                { name = "Orcish Trooper", level = "67-69", pts = { 340,-126,340,-154,339,-138 } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Orcish Footsoldier", level = "71-74", pts = { -444,-328,-474,-324,-476,-350,-449,-476 } },
                { name = "Orcish Gladiator", level = "71-74", pts = { -409,-370,-444,-328,-476,-350,-509,-482 } },
                { name = "Orcish Hexspinner", level = "71-74", pts = { -409,-370,-474,-324,-476,-350,-449,-476 } },
                { name = "Orcish Zerker", level = "71-74", pts = { -409,-370,-444,-328,-474,-324,-449,-476 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, more = 1, mobs = {
                { name = "Orcish Augur", level = "76-79", pts = { -3,-102,-3,-44,-27,-60 } },
                { name = "Orcish Bowshooter", level = "76-78", pts = { -3,-102,2,-73,-40,-62 } },
                { name = "Orcish Champion", level = "76-79", pts = { -3,-102,-3,-44,2,-73 } },
                { name = "Orcish Dragonbrander", level = "76-78", pts = { -3,-44,-54,-60 } },
                { name = "Orcish Protector", level = "76-79", pts = { -3,-102,2,-73,18,-43 } },
                { name = "Orcish Veteran", level = "76-78", pts = { 2,-73,18,-43,-40,-62 } },
            } },
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Orcish Bowshooter", level = "76-79", pts = { -197,-146,263,60,-122,83,133,-88 } },
                { name = "Orcish Champion", level = "76-79", pts = { -146,-409,-187,-441,-67,-198,45,-240 } },
                { name = "Orcish Dragonbrander", level = "76-79", pts = { -146,-409,-187,-441,-162,-473,-67,-198 } },
                { name = "Orcish Protector", level = "76-79", pts = { -163,-447,244,-532,240,-555 } },
                { name = "Orcish Veteran", level = "76-79", pts = { -146,-409,-162,-473,-163,-447,0,-200 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, more = 8, mobs = {
                { name = "Orcish Augur", level = "76-79", pts = { 156,-102,227,-121,334,-58,300,-22 } },
                { name = "Orcish Bowshooter", level = "76-79", pts = { 309,-57,333,-142,379,-180,278,-276 } },
                { name = "Orcish Champion", level = "76-79", pts = { 154,-121,246,-123,164,-259,158,-20 } },
                { name = "Orcish Dragonbrander", level = "76-79", pts = { 227,-121,334,-58,342,-109,379,-180 } },
                { name = "Orcish Veteran", level = "76-79", pts = { 155,-74,246,-123,309,-57,300,-22 } },
                { name = "Orcish Protector", level = "77-79", pts = { -128,16,-118,-22,-141,80,-218,45 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, more = 1, mobs = {
                { name = "Orcish Cupholder", level = "81-82", pts = { -58,-96,-102,-102,-99,-135,-50,-142 } },
                { name = "Orcish Dreadnought", level = "81-82", pts = { -22,-97,-102,-102,-18,-137 } },
                { name = "Orcish Farkiller", level = "81-82", pts = { -99,-135,-18,-137,-50,-142,-67,-151 } },
                { name = "Orcish Imperial Guard", level = "81-82", pts = { -99,-135,-18,-137,-50,-142,-69,-153 } },
                { name = "Orcish Prophetess", level = "81-82", pts = { -22,-97,-102,-102 } },
                { name = "Orcish Strategist", level = "81-82", pts = { -70,-152,-99,-135,-18,-137,-50,-142 } },
            } },
        },
    },
    [697] = {
        name = "Amorphic Spikes", level = 98, element = 15, skill = 388,
        family = "Flan", stats = "INT+5, MND+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Black Pudding", level = "72-74", pts = { -181,-182,-177,-144,-193,-108,-264,-169 } },
                { name = "Ebony Pudding", level = "77-79", pts = { -542,205,-538,238,-500,264,-499,179 } },
            } },
            { id = 15, zone = "Abyssea - Konschtat", kind = nil, mobs = {
                { name = "Licorice", level = "78-88", pts = { -228,679,-205,641,-272,651,-183,709 } },
                { name = "Guimauve", level = "85", pts = { -141,651 } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Pitchy Pudding", level = "78-80", pts = { -150,62,-100,66,86,-6,86,48 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Ebony Pudding", level = "79-80", pts = { 169,156,188,168,225,180,231,155 } },
            } },
        },
    },
    [698] = {
        name = "Wind Breath", level = 99, element = 2, skill = 395,
        family = "Dragon", stats = "STR+2, AGI+2", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Sombra Dragon", "sombra late", },
        zones = {
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Shadow Dragon", level = "52-53", pts = { 317,-194 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Rift Dragon", level = "84-85", pts = { -526,-58,-551,-58,-533,-6 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Eschan Shadow Dragon", level = "107-110", pts = { -349,425,-311,429,-301,487,-266,552 } },
            } },
        },
    },
    [699] = {
        name = "Barbed Crescent", level = 99, element = 15, skill = 395,
        family = "Fomor", stats = "STR-3, DEX+4", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 25, zone = "Misareaux Coast", kind = nil, more = 7, mobs = {
                { name = "Fomor Bard", level = "35-50", tags = { "Night only" }, pts = { 444,-332,-83,663 } },
                { name = "Fomor Black Mage", level = "35-37", tags = { "Night only" }, pts = { 452,-345 } },
                { name = "Fomor Ninja", level = "35-50", tags = { "Night only" }, pts = { 444,-332,-301,173 } },
                { name = "Fomor Samurai", level = "35-37", tags = { "Night only" }, pts = { 748,-487,444,-332 } },
                { name = "Fomor Thief", level = "35-50", tags = { "Night only" }, pts = { 751,-487,-300,178 } },
                { name = "Fomor Warrior", level = "35-37", tags = { "Night only" }, pts = { 750,-490 } },
            } },
            { id = 24, zone = "Lufaise Meadows", kind = nil, more = 8, mobs = {
                { name = "Fomor Beastmaster", level = "41-82", tags = { "Night only" }, pts = { 200,348,-131,-2 } },
                { name = "Fomor Ranger", level = "41-81", tags = { "Night only" }, pts = { 197,345,-422,154 } },
                { name = "Fomor Summoner", level = "41-81", tags = { "Night only" }, pts = { 200,344,-129,2 } },
                { name = "Fomor Thief", level = "42-54", tags = { "Night only" }, pts = { -425,156,-181,302 } },
                { name = "Fomor Warrior", level = "42-82", tags = { "Night only" }, pts = { 234,265,-132,1 } },
                { name = "Fomor Monk", level = "52-81", tags = { "Night only" }, pts = { 487,187,200,344,-178,299 } },
            } },
            { id = 27, zone = "Phomiuna Aqueducts", kind = nil, more = 8, mobs = {
                { name = "Fomor Beastmaster", level = "41-46", pts = { 23,118,-159,-77 } },
                { name = "Fomor Dragoon", level = "41-46", pts = { 23,118,-159,-77 } },
                { name = "Fomor Ninja", level = "41-46", pts = { 23,118,-156,200,-159,-77,-198,1 } },
                { name = "Fomor Bard", level = "44-48", pts = { 120,203,100,99,-58,21,-66,103 } },
                { name = "Fomor Black Mage", level = "44-48", pts = { -158,214,-212,60,102,19 } },
                { name = "Fomor Dark Knight", level = "44-47", pts = { -164,200,-198,1,-216,58 } },
            } },
            { id = 28, zone = "Sacrarium", kind = nil, more = 8, mobs = {
                { name = "Fomor Bard", level = "54-57", pts = { -3,60,97,58,59,-112,100,-129 } },
                { name = "Fomor Beastmaster", level = "54-56", pts = { 97,58,59,-112 } },
                { name = "Fomor Black Mage", level = "54-57", pts = { 97,58,99,111,106,-116,142,13 } },
                { name = "Fomor Dark Knight", level = "54-57", pts = { 59,-66,20,-114,142,13 } },
                { name = "Fomor Dragoon", level = "54-57", pts = { 62,66,19,114,142,13 } },
                { name = "Fomor Monk", level = "54-58", pts = { 13,-62,99,111,94,-116,83,18 } },
            } },
            { id = 52, zone = "Bhaflau Thickets", kind = nil, mobs = {
                { name = "Fomor Bard", level = "63-64", tags = { "Night only" }, pts = { 305,36,502,197,100,355 } },
                { name = "Fomor Beastmaster", level = "63-64", tags = { "Night only" }, pts = { 305,36,274,151,278,184 } },
                { name = "Fomor Paladin", level = "63-64", tags = { "Night only" }, pts = { 274,151,502,197,100,355 } },
                { name = "Fomor Thief", level = "63-64", tags = { "Night only" }, pts = { 278,184,395,182,99,377 } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Fomor Bard", level = "63-65", tags = { "Night only" }, pts = { 347,280,-64,411,-113,386 } },
                { name = "Fomor Beastmaster", level = "63-65", tags = { "Night only" }, pts = { 402,260,-113,386 } },
                { name = "Fomor Paladin", level = "63-65", tags = { "Night only" }, pts = { 347,280,13,372,-64,411 } },
                { name = "Fomor Thief", level = "63-65", tags = { "Night only" }, pts = { 402,260,13,372,-64,411 } },
            } },
            { id = 54, zone = "Arrapago Reef", kind = nil, mobs = {
                { name = "Ephramadian Shade", level = "68-70", pts = { -426,-364,-438,-454 } },
                { name = "Fallen Imperial Trooper", level = "72-74", pts = { -298,84,-299,52,-339,-14,-343,17 } },
                { name = "Fallen Imperial Wizard", level = "72-74", pts = { -298,84,-299,52,-421,103,-427,26 } },
                { name = "Fallen Volunteer", level = "72-74", pts = { -298,84,-299,52,-343,17,-413,110 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Ephramadian Shade", level = "75-77", pts = { -699,-147,-615,-158,-700,-224,-663,-272 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, more = 2, mobs = {
                { name = "Shunned Deeparrow", level = "113-116", pts = { -282,-65,563,154,579,138 } },
                { name = "Shunned Elementalist", level = "113-116", pts = { 565,-166,580,-184 } },
                { name = "Shunned Engraver", level = "113-116", pts = { 437,-36,405,-6 } },
                { name = "Shunned Fluteslinger", level = "113-116", pts = { 723,-5 } },
                { name = "Shunned Hexer", level = "113-116", pts = { -281,-92,596,-196,565,-166 } },
                { name = "Shunned Nightstalker", level = "113-116", pts = { -282,-65,594,125,563,154 } },
            } },
        },
    },
    [700] = {
        name = "Nat. Meditation", level = 99, element = 0, skill = 395,
        family = "Chapuli", stats = "DEX+6", stats_verified = true,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "Aristaeus low 55", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Chapuli family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [701] = {
        name = "Tem. Upheaval", level = 99, element = 2, skill = 395,
        family = "Twitherym", stats = "AGI+6", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Careening Twitherym", level = "100-101", pts = { 158,-250,157,-276,126,-260,21,-309 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Twitherym Infestation", level = "100-101", pts = { 360,397,296,234,294,208,160,79 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Careening Twitherym", level = "101-103", pts = { 470,-155,440,-242,443,-262,563,-235 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Repugnant Twitherym", level = "101-105", pts = { 303,-244,82,0,178,-357 } },
                { name = "Blustering Twitherym", level = "102-110", pts = { 353,-295,380,-309 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Malodorous Twitherym", level = "101-103", pts = { -119,-240,-160,-324,-1,-356,35,-365 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Frosty Twitherym", level = "102-105", pts = { 442,-478,248,-191,259,-263,279,-370 } },
                { name = "Befuddled Twitherym", level = "105-110", pts = { -50,276,-68,288,-117,254,-118,260 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Whispering Twitherym", level = "106-109", pts = { 282,116,283,81,313,34,286,38 } },
            } },
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Twitherym", level = "107-109", pts = { 296,339,199,321,201,192,303,-39 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Restless Twitherym", level = "113-116", pts = { -280,-78,-382,167,-520,-186,-646,56 } },
                { name = "Apex Twitherym", level = "134-136", pts = { 259,-326,299,-317 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Leafdancer Twitherym", level = "121-123", pts = { -60,118,-37,438,-440,141 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Bound Twitherym", level = "121-123", pts = { -221,-242,-332,-223,-184,-299,-361,-244 } },
                { name = "Drusy Twitherym", level = "124-127", pts = { 219,76,280,138,343,162,341,216 } },
            } },
        },
    },
    [702] = {
        name = "Rending Deluge", level = 99, element = 5, skill = 395,
        family = "Craklaw", stats = "VIT+6", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Marmorkrebs", },
        zones = {
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Hoary Craklaw", level = "101-104", pts = { 276,204,302,263,489,153,487,129 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Snapping Craklaw", level = "119-122", pts = { 275,474,291,502,211,383,230,415 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Apex Craklaw", level = "128-130", pts = { -60,118,-210,10,-197,-83,-319,-88 } },
            } },
        },
    },
    [703] = {
        name = "Embalming Earth", level = 99, element = 3, skill = 395,
        family = "Gigelorum, Matamata", stats = "STR+6", stats_verified = true,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "Gigelorum", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Gigelorum family", level = "?", tags = { "Odyssey only" } },
                { name = "Matamata family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [704] = {
        name = "Paralyzing Triad", level = 99, element = 15, skill = 395,
        family = "Sgili, Umbril", stats = "HP-10, STR+4, DEX+4", stats_verified = true,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "Sgili", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Sgili family", level = "?", tags = { "Odyssey only" } },
                { name = "Umbril family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [705] = {
        name = "Foul Waters", level = 99, element = 5, skill = 395,
        family = "Bloated Acuex, U Bnai", stats = "HP+10, VIT+4", stats_verified = true,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "U Bnai", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Bloated Acuex family", level = "?", tags = { "Odyssey only" } },
                { name = "U Bnai family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [706] = {
        name = "Glutinous Dart", level = 99, element = 15, skill = 395,
        family = "Velkk", stats = "HP+15, STR+3, DEX+3, INT-3", stats_verified = true,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Velkk Caster", "Velkk Fighter", },
        zones = {
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Velkk Marauder", level = "100-103", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -357,132,-98,-208,-133,165,226,173 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Velkk Destructeur", level = "103-105", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { 154,-127,179,-61,-157,44,-191,81 } },
                { name = "Velkk Sage", level = "103-105", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { 179,-61,-154,80,-402,-213,-359,231 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, more = 2, mobs = {
                { name = "Velkk Berserker", level = "105-110", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -424,276,-330,122 } },
                { name = "Velkk Magus", level = "105-110", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -419,233,-358,76 } },
                { name = "Velkk Reaver", level = "105-110", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -320,218,-501,156,-330,122 } },
                { name = "Velkk Stormcaller", level = "105-110", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -419,181,-513,116,-358,76 } },
                { name = "Velkk Archmagus", level = "121-123", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -238,149 } },
                { name = "Velkk Cyclonicist", level = "121-123", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { -238,149 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Velkk Defiler", level = "106-109", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { 207,-69,253,-78,278,-48,209,-5 } },
                { name = "Velkk Inquisitor", level = "106-109", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { 253,-78,287,-69,238,-6,209,-5 } },
                { name = "Velkk Jaguar", level = "106-109", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { 286,38,331,-160,158,-207,207,-69 } },
                { name = "Velkk Shadowmancer", level = "106-109", conf = "wiki", tags = { "Location from wiki (retail)", "Velkk fighters and casters both use it." }, pts = { 331,-160,158,-207,207,-69,253,-78 } },
            } },
        },
    },
    [707] = {
        name = "Retinal Glare", level = 99, element = 6, skill = 395,
        family = "Unknown", stats = "MP+15, INT+3", stats_verified = true,
        status = "unavailable", unbridled = false,
        notes = { "Not currently learnable on VanaDreams: the enemy move has no action script on the server, so monsters cannot use it.", },
        extra_lists = { },
        zones = {
        },
    },
    [708] = {
        name = "Subduction", level = 99, element = 2, skill = 395,
        family = "Marolith", stats = "MP +25, VIT +6, INT +6", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Asperous Marolith", level = "102-106", pts = { -41,-86,-85,396,325,362,320,-121 } },
                { name = "Hefty Marolith", level = "127-128", pts = { -455,-363 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Missabikong", level = "139", nm = true, tags = { "NM (pop/scripted)" }, pts = { -392,-440 } },
            } },
        },
    },
    [709] = {
        name = "Thrashing Assault", level = 99, element = 15, skill = 395,
        family = "Meeble", stats = "HP +20, DEX +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Meeble", },
        zones = {
        },
    },
    [710] = {
        name = "Erratic Flutter", level = 99, element = 2, skill = 395,
        family = "Wamoura", stats = "HP +15, MP +15, AGI +5, CHR +5", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 62, zone = "Halvung", kind = nil, mobs = {
                { name = "Wamoura", level = "80-82", pts = { -28,362,-28,329,-3,340,35,339 } },
                { name = "Achamoth Nympha", level = "73-75", tags = { "Scripted spawn" }, pts = { -17,340,-35,336 } },
                { name = "Achamoth", level = "86-88", nm = true, tags = { "NM (pop/scripted)" }, pts = { -13,340 } },
            } },
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Wamoura", level = "80-82", tags = { "Scripted spawn" }, pts = { -563,268,20,202,401,147,413,137 } },
                { name = "Ignamoth", level = "84", nm = true, tags = { "NM" }, pts = { -557,278 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Itzpapalotl", level = "90-93", nm = true, tags = { "NM (pop/scripted)" }, pts = { 436,-184,440,-179 } },
            } },
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Taxet", level = "107-109", nm = true, tags = { "NM (pop/scripted)" }, pts = { -280,-290 } },
            } },
            { id = 48, zone = "Al Zahbi", kind = nil, mobs = {
                { name = "War Wamoura", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "War Wamoura", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Wamoura", level = "66-68", tags = { "Scripted spawn" } },
            } },
            { id = 63, zone = "Lebros Cavern", kind = "Instance", mobs = {
                { name = "Ranch Wamoura", level = "78", tags = { "Scripted spawn" } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Infected Wamoura", level = "82", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [711] = {
        name = "Restoral", level = 99, element = 6, skill = 395,
        family = "Gear", stats = "HP +15, MP +15", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Sub-zero Gear", level = "86-87", pts = { -296,-26,-287,-87,-240,-100 } },
            } },
            { id = 72, zone = "Alzadaal Undersea Ruins", kind = nil, mobs = {
                { name = "Apex Archaic Cog", level = "143-145", pts = { 501,461,662,461,699,422,-319,436 } },
                { name = "Apex Archaic Cogs", level = "145-147", pts = { 501,461,662,461,699,422,-319,436 } },
                { name = "Armed Gears", level = "86-88", nm = true, tags = { "NM (pop/scripted)" }, pts = { -20,-183 } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Choh Moui", level = "65", tags = { "Scripted spawn" }, pts = { 325,-126 } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Python Mercenary", level = "70", tags = { "Scripted spawn" }, pts = { -20,114,-18,106,-21,99 } },
            } },
            { id = 94, zone = "Windurst Waters (S)", kind = nil, mobs = {
                { name = "Haja Zhwan", level = "66", tags = { "Scripted spawn" }, pts = { -34,82 } },
                { name = "Wildcat Volunteer", level = "66", tags = { "Scripted spawn" }, pts = { -48,79 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, more = 4, mobs = {
                { name = "Lhu Mhakaracca", level = "65", tags = { "Scripted spawn" }, pts = { -257,398 } },
                { name = "Python Mercenary", level = "65", tags = { "Scripted spawn" }, pts = { -266,409,-298,424,-304,431 } },
                { name = "Cougar Volunteer", level = "66", tags = { "Scripted spawn" }, pts = { -281,415 } },
                { name = "Mikhe Aryohcha", level = "68", tags = { "Scripted spawn" }, pts = { -281,415 } },
                { name = "Haja Zhwan", level = "69", tags = { "Scripted spawn" }, pts = { -281,415 } },
                { name = "Wildcat Volunteer", level = "69", tags = { "Scripted spawn" }, pts = { -281,415,-274,421 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, more = 2, mobs = {
                { name = "Choh Moui", level = "70", tags = { "Scripted spawn" }, pts = { -60,-18 } },
                { name = "Federation Dispenser", level = "70", tags = { "Scripted spawn" }, pts = { -76,1 } },
                { name = "Haja Zhwan", level = "70", tags = { "Scripted spawn" }, pts = { -139,-20 } },
                { name = "Lhu Mhakaracca", level = "70", tags = { "Scripted spawn" } },
                { name = "Python Mercenary", level = "70", tags = { "Scripted spawn" } },
                { name = "Rikoh Wahcondalo", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, more = 2, mobs = {
                { name = "Choh Moui", level = "70", tags = { "Scripted spawn" } },
                { name = "Federation Dispenser", level = "70", tags = { "Scripted spawn" }, pts = { -2,332 } },
                { name = "Haja Zhwan", level = "70", tags = { "Scripted spawn" } },
                { name = "Lhu Mhakaracca", level = "70", tags = { "Scripted spawn" }, pts = { -26,315 } },
                { name = "Python Mercenary", level = "70", tags = { "Scripted spawn" }, pts = { -29,311 } },
                { name = "Rikoh Wahcondalo", level = "70", tags = { "Scripted spawn" } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Vigilant Gear", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { -439,-314,-166,-197 } },
                { name = "Vigilant Gears", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { 102,10 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Vigilant Gear", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -487,6,-562,2 } },
                { name = "Vigilant Gears", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -363,78 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Vigilant Gear", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 275,178 } },
                { name = "Vigilant Gears", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 275,146 } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "66-68", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Archaic Gears", level = "66-68", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Imperial Gear", level = "75", nm = true, tags = { "NM (pop/scripted)" }, pts = { 496,-536,497,-544,503,-543 } },
                { name = "Imperial Gears", level = "75", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 74, zone = "Arrapago Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "73-74", nm = true, tags = { "NM (pop/scripted)" }, pts = { -293,-533,-305,-526,-292,-541,-249,-545 } },
                { name = "Archaic Gears", level = "74-75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -257,-119,-287,-80,-415,-73,-400,-120 } },
            } },
            { id = 129, zone = "Ghoyu's Reverie", kind = "Instance", mobs = {
                { name = "Cobra Mercenary", level = "75", tags = { "Scripted spawn" }, pts = { -397,-6 } },
            } },
            { id = 73, zone = "Zhayolm Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "75-80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -340,-229,-331,-211,-349,-211,-349,-220 } },
                { name = "Archaic Gears", level = "75-80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -331,29,-349,29,-349,20,-340,11 } },
            } },
            { id = 75, zone = "Bhaflau Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "79-81", nm = true, tags = { "NM (pop/scripted)" }, pts = { -217,-439,-232,-437,-228,-401,-441,-403 } },
                { name = "Archaic Gears", level = "79-81", nm = true, tags = { "NM (pop/scripted)" }, pts = { -224,-429,-452,-424,-281,79,-234,80 } },
            } },
            { id = 76, zone = "Silver Sea Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -327,-538,-358,-525,-366,-326,-290,-301 } },
                { name = "Archaic Gears", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -324,-536,-443,-410,-477,-363,-249,-352 } },
                { name = "Gyroscopic Gear", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -355,-318 } },
                { name = "Gyroscopic Gears", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -226,-355 } },
            } },
            { id = 179, zone = "Stellar Fulcrum", kind = "Battlefield", mobs = {
                { name = "Counselor Mihli", level = "60", tags = { "Scripted spawn" } },
            } },
            { id = 168, zone = "Chamber of Oracles", kind = "Battlefield", mobs = {
                { name = "Bopa Greso", level = "75", tags = { "Scripted spawn" }, pts = { -1,-247 } },
                { name = "Cha Lebagta", level = "75", tags = { "Scripted spawn" }, pts = { 0,-248 } },
                { name = "Nanaa Mihgo", level = "75", tags = { "Scripted spawn" }, pts = { 0,-240 } },
            } },
        },
    },
    [712] = {
        name = "Rail Cannon", level = 99, element = 6, skill = 395,
        family = "Gear", stats = "INT +4, MND +4", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Sub-zero Gear", level = "86-87", pts = { -296,-26,-287,-87,-240,-100 } },
            } },
            { id = 72, zone = "Alzadaal Undersea Ruins", kind = nil, mobs = {
                { name = "Apex Archaic Cog", level = "143-145", pts = { 501,461,662,461,699,422,-319,436 } },
                { name = "Apex Archaic Cogs", level = "145-147", pts = { 501,461,662,461,699,422,-319,436 } },
                { name = "Armed Gears", level = "86-88", nm = true, tags = { "NM (pop/scripted)" }, pts = { -20,-183 } },
            } },
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Vigilant Gear", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { -439,-314,-166,-197 } },
                { name = "Vigilant Gears", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { 102,10 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Vigilant Gear", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -487,6,-562,2 } },
                { name = "Vigilant Gears", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -363,78 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Vigilant Gear", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 275,178 } },
                { name = "Vigilant Gears", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 275,146 } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "66-68", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Archaic Gears", level = "66-68", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Imperial Gear", level = "75", nm = true, tags = { "NM (pop/scripted)" }, pts = { 496,-536,497,-544,503,-543 } },
                { name = "Imperial Gears", level = "75", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 74, zone = "Arrapago Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "73-74", nm = true, tags = { "NM (pop/scripted)" }, pts = { -293,-533,-305,-526,-292,-541,-249,-545 } },
                { name = "Archaic Gears", level = "74-75", nm = true, tags = { "NM (pop/scripted)" }, pts = { -257,-119,-287,-80,-415,-73,-400,-120 } },
            } },
            { id = 73, zone = "Zhayolm Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "75-80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -340,-229,-331,-211,-349,-211,-349,-220 } },
                { name = "Archaic Gears", level = "75-80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -331,29,-349,29,-349,20,-340,11 } },
            } },
            { id = 75, zone = "Bhaflau Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "79-81", nm = true, tags = { "NM (pop/scripted)" }, pts = { -217,-439,-232,-437,-228,-401,-441,-403 } },
                { name = "Archaic Gears", level = "79-81", nm = true, tags = { "NM (pop/scripted)" }, pts = { -224,-429,-452,-424,-281,79,-234,80 } },
            } },
            { id = 76, zone = "Silver Sea Remnants", kind = "Instance", mobs = {
                { name = "Archaic Gear", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -327,-538,-358,-525,-366,-326,-290,-301 } },
                { name = "Archaic Gears", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -324,-536,-443,-410,-477,-363,-249,-352 } },
                { name = "Gyroscopic Gear", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -355,-318 } },
                { name = "Gyroscopic Gears", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -226,-355 } },
            } },
        },
    },
    [713] = {
        name = "Diffusion Ray", level = 99, element = 6, skill = 395,
        family = "Chariot", stats = "STR +5, VIT +7", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Immobilizer", level = "85-87", tags = { "Scripted spawn" }, pts = { 102,14,-9,-207,12,-115 } },
                { name = "Oppressor", level = "85-87", tags = { "Scripted spawn" }, pts = { 101,12,26,-106 } },
                { name = "Edifier", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { 52,-76,-119,-247,27,-107 } },
                { name = "Ravager Chariot", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { 16,-114 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Battlerigged Chariot", level = "100", nm = true, tags = { "NM" }, pts = { -646,-590 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Rencounter Chariot", level = "100", nm = true, tags = { "NM" }, pts = { 796,624 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Impervious Chariot", level = "100", nm = true, tags = { "NM (pop/scripted)" }, pts = { -272,-68 } },
                { name = "Refitted Chariot", level = "100", nm = true, tags = { "NM" }, pts = { -272,-68 } },
            } },
            { id = 215, zone = "Abyssea - Attohwa", kind = nil, mobs = {
                { name = "Edifier", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -398,142,-354,43,-330,-127 } },
                { name = "Ravager Chariot", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -329,33 } },
            } },
            { id = 216, zone = "Abyssea - Misareaux", kind = nil, mobs = {
                { name = "Edifier", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 272,136,278,168,190,152 } },
                { name = "Ravager Chariot", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 236,152,183,147 } },
            } },
            { id = 73, zone = "Zhayolm Remnants", kind = "Instance", mobs = {
                { name = "Archaic Chariot", level = "75-80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -300,-100,-380,-100,-340,251 } },
                { name = "Battleclad Chariot", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -340,566 } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Racing Chariot", level = "76-77", tags = { "Scripted spawn" } },
                { name = "Battledressed Chariot", level = "76-77", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Long-Gunned Chariot", level = "76-77", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Long-Horned Chariot", level = "76-77", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Shielded Chariot", level = "76-77", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 74, zone = "Arrapago Remnants", kind = "Instance", mobs = {
                { name = "Archaic Chariot", level = "77-78", nm = true, tags = { "NM (pop/scripted)" }, pts = { -263,-103,-419,-85 } },
                { name = "Armored Chariot", level = "80-85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -339,500 } },
            } },
            { id = 75, zone = "Bhaflau Remnants", kind = "Instance", mobs = {
                { name = "Archaic Chariot", level = "80-81", nm = true, tags = { "NM (pop/scripted)" }, pts = { -256,75,-422,86 } },
                { name = "Long-Bowed Chariot", level = "83", nm = true, tags = { "NM (pop/scripted)" }, pts = { -340,468 } },
            } },
            { id = 76, zone = "Silver Sea Remnants", kind = "Instance", mobs = {
                { name = "Archaic Chariot", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { -420,74,-260,74 } },
                { name = "Long-Armed Chariot", level = "83-85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -340,554 } },
            } },
        },
    },
    [714] = {
        name = "Sinker Drill", level = 99, element = 15, skill = 395,
        family = "Acrolith", stats = "STR +4, DEX +4, VIT +4", stats_verified = false,
        status = "unavailable", unbridled = false,
        notes = { "Not currently learnable on VanaDreams: the enemy move has no action script on the server, so monsters cannot use it.", },
        extra_lists = { },
        zones = {
        },
    },
    [715] = {
        name = "Molting Plumage", level = 99, element = 2, skill = 395,
        family = "Procne, Tulfaire", stats = "AGI +8", stats_verified = false,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "Procne", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Procne family", level = "?", tags = { "Odyssey only" } },
                { name = "Tulfaire family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [716] = {
        name = "Nectarous Deluge", level = 99, element = 5, skill = 395,
        family = "Raskovniche, Snapweed", stats = "MND +8", stats_verified = false,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "Raskovniche", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Raskovniche family", level = "?", tags = { "Odyssey only" } },
                { name = "Snapweed family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [717] = {
        name = "Sweeping Gouge", level = 99, element = 15, skill = 395,
        family = "Raaz", stats = "HP +25, VIT +5", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Henwen", "Henwen low 45", },
        zones = {
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Cicatricose Raaz", level = "111-113", pts = { 274,-253,217,-404,-275,-315,-25,-202 } },
                { name = "Famished Raaz", level = "111-113", nm = true, tags = { "NM (pop/scripted)" }, pts = { 125,-440,128,35 } },
                { name = "Sharptusk Raaz", level = "111-113", nm = true, tags = { "NM (pop/scripted)" }, pts = { 245,-115 } },
                { name = "Calydontis", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 233,-270 } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Indomitable Faaz", level = "121-126", pts = { -591,-19,-581,53,-460,97,-457,67 } },
                { name = "Ascended Faaz", level = "125-127", nm = true, tags = { "NM (pop/scripted)" }, pts = { -431,100 } },
            } },
        },
    },
    [718] = {
        name = "Atra. Libations", level = 99, element = 7, skill = 395,
        family = "Dullahan", stats = "HP +10, VIT +4, INT +4", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Gogmagog", },
        zones = {
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Dullahan", level = "114-118", pts = { -854,-49,-852,1,-810,-20,292,17 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Dullahan", level = "119-122", pts = { 350,295,357,310,336,279 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Dullahan", level = "120-123", pts = { 308,-500,350,-474,316,-478,297,-472 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Dullahan", level = "120-124", pts = { -176,446,-182,445,-123,485,-156,512 } },
            } },
            { id = 273, zone = "Woh Gates", kind = nil, mobs = {
                { name = "Dullahan", level = "121-124", pts = { -259,-497 } },
            } },
            { id = 270, zone = "Cirdas Caverns", kind = nil, mobs = {
                { name = "Dullahan", level = "127", pts = { -458,-372 } },
            } },
        },
    },
    [719] = {
        name = "Searing Tempest", level = 99, element = 0, skill = 395,
        family = "Elemental", stats = "MP +30, STR +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Baelfyr", },
        zones = {
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Irascible Baelfyr", level = "100-101", conf = "wiki", tags = { "Location from wiki (retail)", "Spawns only during fire weather.", "Weather" }, pts = { 318,279,205,88,-322,320,-528,123 } },
            } },
            { id = nil, zone = "Yorcia Weald (U)", kind = nil, mobs = {
                { name = "Escalant", level = "?", conf = "wiki", nm = true, tags = { "Alluvion Skirmish floor 1.", "Location from wiki" } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Baelfyr", level = "82-87", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -161,118,-231,50 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Baelfyr", level = "84-86", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -450,224,-430,-47,125,-209,-360,-378 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Baelfyr", level = "90-91", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 501,-268,690,384 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Baelfyr", level = "104-106", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 43,59,80,35,116,1,78,-31 } },
            } },
        },
    },
    [720] = {
        name = "Spectral Floe", level = 99, element = 1, skill = 395,
        family = "Elemental", stats = "MP +30, INT +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Gefyrst", "Staumarth", },
        zones = {
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Hoarfrost Gefyrst", level = "102-104", conf = "wiki", tags = { "Location from wiki (retail)", "Spawns only during snow weather.", "Weather" }, pts = { -18,182,-84,-50,84,-302,-284,-314 } },
            } },
            { id = nil, zone = "Yorcia Weald (U)", kind = nil, mobs = {
                { name = "Escalant", level = "?", conf = "wiki", nm = true, tags = { "Alluvion Skirmish floor 1.", "Location from wiki" } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Gefyrst", level = "81-83", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -58,-303,154,-315 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Gefyrst", level = "82-84", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -616,-294 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Gefyrst", level = "82-83", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 393,-179,238,468 } },
            } },
            { id = 269, zone = "Moh Gates", kind = nil, mobs = {
                { name = "Staumarth", level = "103-108", conf = "unverified", nm = true, tags = { "NM (pop/scripted)", "Unverified (VanaDreams-only skill list)" }, pts = { 396,-167 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Gefyrst", level = "104-106", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 80,35,116,1,78,-31 } },
            } },
        },
    },
    [721] = {
        name = "Anvil Lightning", level = 99, element = 4, skill = 395,
        family = "Elemental", stats = "MP +30, DEX +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Ungeweder", },
        zones = {
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Unbridled Ungeweder", level = "100-101", conf = "wiki", tags = { "Location from wiki (retail)", "Weather", "Wind weather." }, pts = { 21,-309,24,-288,-165,202,23,347 } },
            } },
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Wooded Ungeweder", level = "100-101", conf = "wiki", tags = { "Location from wiki (retail)", "Weather", "Wind weather." }, pts = { 196,279,-174,350,34,-86,237,-82 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Speleothem Ungeweder", level = "103-105", conf = "wiki", tags = { "Location from wiki (retail)", "Weather", "Wind weather." }, pts = { -162,-162,-236,-198,-354,-57 } },
            } },
        },
    },
    [722] = {
        name = "Entomb", level = 99, element = 3, skill = 395,
        family = "Elemental", stats = "MP +30, VIT +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Byrgen", },
        zones = {
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Phlegmatic Byrgen", level = "113-116", conf = "wiki", tags = { "Location from wiki (retail)" }, pts = { -489,374,-442,368,-457,324,-487,306 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Byrgen", level = "81-83", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -138,-74 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Byrgen", level = "83-85", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -473,-67,579,88 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Byrgen", level = "90-92", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -138,256,-501,123,-237,-387,-340,-566 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Byrgen", level = "104-106", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 49,58,80,35,116,1,78,-31 } },
            } },
        },
    },
    [723] = {
        name = "Saurian Slide", level = 99, element = 15, skill = 395,
        family = "Velkk", stats = "HP +50, VIT +6, INT -3", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Velkk Fighter", },
        zones = {
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Velkk Marauder", level = "100-103", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { -357,132,-98,-208,-133,165,226,173 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Velkk Destructeur", level = "103-105", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { 154,-127,179,-61,-157,44,-191,81 } },
            } },
            { id = 272, zone = "Dho Gates", kind = nil, mobs = {
                { name = "Velkk Berserker", level = "105-110", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { -424,276,-330,122 } },
                { name = "Velkk Reaver", level = "105-110", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { -320,218,-501,156,-330,122 } },
                { name = "Velkk Dreadnought", level = "121-123", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { -197,138 } },
                { name = "Velkk Trampler", level = "121-123", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { -197,138 } },
            } },
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Velkk Defiler", level = "106-109", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { 207,-69,253,-78,278,-48,209,-5 } },
                { name = "Velkk Jaguar", level = "106-109", conf = "wiki", tags = { "Location from wiki (retail)", "Only fighter Velkk use it (not casters)." }, pts = { 286,38,331,-160,158,-207,207,-69 } },
            } },
        },
    },
    [724] = {
        name = "Palling Salvo", level = 99, element = 7, skill = 395,
        family = "Dealan-dhe, Fluturini", stats = "DEX +6, AGI +6", stats_verified = false,
        status = "odyssey", unbridled = false,
        notes = { "On VanaDreams this move only works inside Odyssey (Sheol Gaol). Ordinary family members elsewhere do not use it.", },
        extra_lists = { "Dealan-dhe", "Dealan-dhe low 25", },
        zones = {
            { id = nil, zone = "Sheol Gaol (Odyssey)", kind = "Instance", mobs = {
                { name = "Dealan-dhe family", level = "?", tags = { "Odyssey only" } },
                { name = "Fluturini family", level = "?", tags = { "Odyssey only" } },
            } },
        },
    },
    [725] = {
        name = "Blinding Fulgor", level = 99, element = 6, skill = 395,
        family = "Elemental", stats = "HP +40, STR +4, DEX +4, AGI +4", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Baelfyr", },
        zones = {
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Irascible Baelfyr", level = "100-101", conf = "wiki", tags = { "Location from wiki (retail)", "Spawns only during fire weather.", "Weather" }, pts = { 318,279,205,88,-322,320,-528,123 } },
            } },
            { id = nil, zone = "Yorcia Weald (U)", kind = nil, mobs = {
                { name = "Escalant", level = "?", conf = "wiki", nm = true, tags = { "Alluvion Skirmish floor 1.", "Location from wiki" } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Baelfyr", level = "82-87", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -161,118,-231,50 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Baelfyr", level = "84-86", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -450,224,-430,-47,125,-209,-360,-378 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Baelfyr", level = "90-91", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 501,-268,690,384 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Baelfyr", level = "104-106", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 43,59,80,35,116,1,78,-31 } },
            } },
        },
    },
    [726] = {
        name = "Scouring Spate", level = 99, element = 5, skill = 395,
        family = "Elemental", stats = "MP +30, MND +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Gefyrst", "Staumarth", },
        zones = {
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Hoarfrost Gefyrst", level = "102-104", conf = "wiki", tags = { "Ice/rain weather.", "Location from wiki (retail)", "Weather" }, pts = { -18,182,-84,-50,84,-302,-284,-314 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Speleothem Gefyrst", level = "103-105", conf = "wiki", tags = { "Ice/rain weather.", "Location from wiki (retail)", "Weather" }, pts = { 35,-365,-278,-403,-261,-329,-217,-89 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Treefrost Gefyrst", level = "104", conf = "wiki", tags = { "Location from wiki (retail)" }, pts = { 290,201,511,158,513,130,86,440 } },
            } },
        },
    },
    [727] = {
        name = "Silent Storm", level = 99, element = 2, skill = 395,
        family = "Elemental", stats = "MP +30, AGI +8", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Ungeweder", },
        zones = {
            { id = 260, zone = "Yahse Hunting Grounds", kind = nil, mobs = {
                { name = "Wooded Ungeweder", level = "100-101", conf = "wiki", tags = { "Location from wiki (retail)", "Weather" }, pts = { 196,279,-174,350,34,-86,237,-82 } },
            } },
            { id = 268, zone = "Sih Gates", kind = nil, mobs = {
                { name = "Speleothem Ungeweder", level = "103-105", conf = "wiki", tags = { "Location from wiki (retail)", "Weather" }, pts = { -162,-162,-236,-198,-354,-57 } },
            } },
            { id = nil, zone = "Yorcia Weald (U)", kind = nil, mobs = {
                { name = "Escalant", level = "?", conf = "wiki", nm = true, tags = { "Alluvion Skirmish floor 1.", "Location from wiki" } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Ungeweder", level = "84-87", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -216,343 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Ungeweder", level = "85-90", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 343,-88,726,665,425,657 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Ungeweder", level = "86-87", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 72,165 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Ungeweder", level = "104-106", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 80,35,116,1,78,-31 } },
            } },
        },
    },
    [728] = {
        name = "Tenebral Crush", level = 99, element = 7, skill = 395,
        family = "Elemental", stats = "MP +30, VIT +4, INT +4, MND +4", stats_verified = false,
        status = "ok", unbridled = false,
        notes = { },
        extra_lists = { "Byrgen", },
        zones = {
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Stolid Byrgen", level = "107-109", conf = "wiki", tags = { "Gloom/dust weather.", "Location from wiki (retail)" }, pts = { 177,264,121,463,-62,262,222,-271 } },
            } },
            { id = 274, zone = "Outer Ra'Kaznar", kind = nil, mobs = {
                { name = "Phlegmatic Byrgen", level = "113-116", conf = "wiki", tags = { "Gloom weather.", "Location from wiki (retail)" }, pts = { -489,374,-442,368,-457,324,-487,306 } },
            } },
            { id = nil, zone = "Yorcia Weald (U)", kind = nil, mobs = {
                { name = "Escalant", level = "?", conf = "wiki", nm = true, tags = { "Alluvion Skirmish floor 1.", "Location from wiki" } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Byrgen", level = "81-83", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -138,-74 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Byrgen", level = "83-85", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -473,-67,579,88 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Byrgen", level = "90-92", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { -138,256,-501,123,-237,-387,-340,-566 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Byrgen", level = "104-106", conf = "unverified", tags = { "Unverified (VanaDreams-only skill list)" }, pts = { 49,58,80,35,116,1,78,-31 } },
            } },
        },
    },
    [736] = {
        name = "Thunderbolt", level = 95, element = 4, skill = 367,
        family = "Behemoth", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Legion Lofty Elasmoth", },
        zones = {
            { id = 82, zone = "Jugner Forest (S)", kind = nil, mobs = {
                { name = "Kholomodumo", level = "93-94", nm = true, tags = { "NM (pop/scripted)" }, pts = { 76,115,-329,-142 } },
                { name = "Kaiser Behemoth", level = "1", nm = true, tags = { "NM (pop/scripted)" }, pts = { 52,-34 } },
            } },
            { id = 90, zone = "Pashhow Marshlands (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 98, zone = "Sauromugue Champaign (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 83, zone = "Vunkerl Inlet (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "1", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 127, zone = "Behemoths Dominion", kind = nil, mobs = {
                { name = "Gudanna", level = "55-60", nm = true, tags = { "NM (pop/scripted)" }, pts = { -279,0 } },
                { name = "Behemoth", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { -269,74 } },
                { name = "King Behemoth", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -269,74 } },
                { name = "Sovereign Behemoth", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -247,32,-49,-6,161,-86 } },
            } },
            { id = 87, zone = "Bastok Markets (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 84, zone = "Batallia Downs (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 92, zone = "Beadeaux (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 99, zone = "Castle Oztroja (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 171, zone = "Crawlers' Nest (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 81, zone = "East Ronfaure (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 164, zone = "Garlaige Citadel (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 89, zone = "Grauberg (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" }, pts = { 344,74 } },
            } },
            { id = 85, zone = "La Vaule (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 88, zone = "North Gustaberg (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 91, zone = "Rolanberry Fields (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 80, zone = "Southern San dOria (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 175, zone = "The Eldieme Necropolis (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 94, zone = "Windurst Waters (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "60", nm = true, tags = { "NM (pop/scripted)" }, pts = { -8,12 } },
            } },
            { id = 96, zone = "Fort Karugo-Narugo (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "70", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { -258,392 } },
            } },
            { id = 95, zone = "West Sarutabaruta (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { 13,317 } },
            } },
            { id = 132, zone = "Abyssea - La Theine", kind = nil, mobs = {
                { name = "Hadhayosh", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { 434,41,410,41 } },
            } },
            { id = 125, zone = "Western Altepa Desert", kind = nil, mobs = {
                { name = "Awoken Dendainsonne", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { -19,170 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Urmahlullu", level = "135", nm = true, tags = { "NM (pop/scripted)" }, pts = { 35,126,462,-275 } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 81,-36 } },
            } },
            { id = 138, zone = "Castle Zvahl Baileys (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Kaiser Behemoth", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Behemoth", level = "80", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Lofty Behemoth", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -180,236 } },
                { name = "Lofty Elasmoth", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -185,217 } },
            } },
            { id = 86, zone = "Everbloom Hollow", kind = "Instance", mobs = {
                { name = "Young Behemoth", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Lofty Behemoth", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Lofty Elasmoth", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 139, zone = "Horlais Peak", kind = "Battlefield", mobs = {
                { name = "Chlevnik", level = "80", nm = true, tags = { "NM (pop/scripted)" }, pts = { -396,-64,-156,116,84,296 } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Dendainsonne", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 182, zone = "Walk of Echoes", kind = "Battlefield", mobs = {
                { name = "Barra Edinazu", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { 592,-552,763,-556 } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Sarsaok", level = "125-127", nm = true, tags = { "NM (pop/scripted)" }, pts = { -590,-1030,-485,434 } },
            } },
            { id = 181, zone = "The Celestial Nexus", kind = "Battlefield", mobs = {
                { name = "Ark Angels Behemoth", level = "139", tags = { "Scripted spawn" }, pts = { -36,-23,452,672,502,-688 } },
            } },
        },
    },
    [737] = {
        name = "Harden Shell", level = 95, element = 3, skill = 367,
        family = "Adamantoise", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 212, zone = "Gustav Tunnel", kind = nil, mobs = {
                { name = "Pygmytoise", level = "102-103", pts = { 41,169,52,189,99,198 } },
            } },
            { id = 128, zone = "Valley of Sorrows", kind = nil, mobs = {
                { name = "Adamantoise", level = "70", nm = true, tags = { "NM (pop/scripted)" }, pts = { 1,-36 } },
                { name = "Aspidochelone", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { 1,-36 } },
            } },
            { id = 45, zone = "Abyssea - Tahrongi", kind = nil, mobs = {
                { name = "Thalassinon", level = "82-83", pts = { -258,467,-269,452,-295,387,-347,442 } },
            } },
            { id = 178, zone = "The Shrine of Ru'Avitau", kind = nil, mobs = {
                { name = "Genbu", level = "82-84", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Xuan Wu", level = "98-99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -68,70,68,68,-68,-68 } },
            } },
            { id = 130, zone = "Ru'Aun Gardens", kind = nil, mobs = {
                { name = "Genbu", level = "88-90", nm = true, tags = { "NM (pop/scripted)" }, pts = { 262,526 } },
            } },
            { id = 97, zone = "Meriphataud Mountains (S)", kind = nil, mobs = {
                { name = "Akupara", level = "92-95", nm = true, tags = { "NM (pop/scripted)" }, pts = { 200,-520,-282,602,-514,519 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Genbu", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { 293,-405,103,-427 } },
            } },
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Kurma", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -364,-321 } },
            } },
            { id = 76, zone = "Silver Sea Remnants", kind = "Instance", mobs = {
                { name = "Citadel Chelonian", level = "73", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Adamantoise", level = "80", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Genbu", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Lofty Adamantoise", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -211,218 } },
                { name = "Lofty Ferromantoise", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -183,244 } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Lofty Adamantoise", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Lofty Ferromantoise", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 13, zone = "Mine Shaft 2716", kind = "Battlefield", mobs = {
                { name = "Elvaan Automaton", level = "62", nm = true, tags = { "NM (pop/scripted)" }, pts = { -466,26,14,23,494,22 } },
                { name = "Galkan Automaton", level = "62", nm = true, tags = { "NM (pop/scripted)" }, pts = { -454,26,26,23,506,22 } },
                { name = "Hume Automaton", level = "62", nm = true, tags = { "NM (pop/scripted)" }, pts = { -466,26,14,23,494,22 } },
                { name = "Mithran Automaton", level = "62", nm = true, tags = { "NM (pop/scripted)" }, pts = { -458,26,22,23,502,22 } },
                { name = "Tarutaru Automaton", level = "62", nm = true, tags = { "NM (pop/scripted)" }, pts = { -462,26,18,23,498,22 } },
            } },
            { id = 144, zone = "Waughroon Shrine", kind = "Battlefield", mobs = {
                { name = "Tartaruga Gigante", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { -177,-142,23,18,223,138 } },
            } },
            { id = 182, zone = "Walk of Echoes", kind = "Battlefield", mobs = {
                { name = "Bedraggled Bale", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { -213,275,-299,240,-293,330,-224,316 } },
                { name = "Begrimed Bale", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { -324,172,-200,172,-220,180,-214,274 } },
                { name = "Jebutoise", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { -332,148,-219,261 } },
            } },
            { id = 181, zone = "The Celestial Nexus", kind = "Battlefield", mobs = {
                { name = "Ark Angels Adamantoise", level = "139", tags = { "Scripted spawn" }, pts = { -36,-23,452,672,502,-688 } },
            } },
        },
    },
    [738] = {
        name = "Absolute Terror", level = 96, element = 7, skill = 374,
        family = "Wyrm", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { "Only used when you are in front of the monster and it has no special buff active.", },
        extra_lists = { },
        zones = {
            { id = 29, zone = "Riverne-Site B01", kind = nil, mobs = {
                { name = "Ouryu", level = "88", nm = true, tags = { "NM (pop/scripted)" }, pts = { -700,841 } },
            } },
            { id = 30, zone = "Riverne-Site A01", kind = nil, mobs = {
                { name = "Ouryu", level = "90", nm = true, tags = { "NM (pop/scripted)" }, pts = { 19,-741 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Kouryu", level = "124", nm = true, tags = { "NM (pop/scripted)" }, pts = { 106,-428 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Dragua", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -226,-330,-213,-360 } },
            } },
            { id = 31, zone = "Monarch Linn", kind = "Battlefield", mobs = {
                { name = "Ouryu", level = "54-99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -605,1,596,1 } },
            } },
        },
    },
    [739] = {
        name = "Gates of Hades", level = 97, element = 0, skill = 381,
        family = "Cerberus", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 61, zone = "Mount Zhayolm", kind = nil, mobs = {
                { name = "Cerberus", level = "85", nm = true, tags = { "NM" }, pts = { 305,-70 } },
                { name = "Sarameya", level = "88-89", nm = true, tags = { "NM (pop/scripted)" }, pts = { 322,-582 } },
                { name = "Sarama", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -440,404,-589,277 } },
            } },
            { id = 288, zone = "Escha - Zi'Tah", kind = nil, mobs = {
                { name = "Wepwawet", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { 324,-126,40,128 } },
            } },
            { id = 218, zone = "Abyssea - Altepa", kind = nil, mobs = {
                { name = "Orthrus", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { -400,97,-404,118 } },
            } },
            { id = 63, zone = "Lebros Cavern", kind = "Instance", mobs = {
                { name = "Black Shuck", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { 480,-403 } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Cerberus", level = "80", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Mired Cerberus", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 183,218 } },
                { name = "Mired Orthrus", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 163,258 } },
            } },
            { id = 75, zone = "Bhaflau Remnants", kind = "Instance", mobs = {
                { name = "Cerberus", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Mired Cerberus", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Mired Orthrus", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 182, zone = "Walk of Echoes", kind = "Battlefield", mobs = {
                { name = "Canis Dirus", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { 152,168,328,312 } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Old Shuck", level = "125-127", nm = true, tags = { "NM (pop/scripted)" }, pts = { -587,-1028 } },
            } },
        },
    },
    [740] = {
        name = "Tourbillion", level = 97, element = 15, skill = 381,
        family = "Khimaira", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { "Only used while the monster's wings are up.", },
        extra_lists = { },
        zones = {
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Khimaira", level = "85", nm = true, tags = { "NM (pop/scripted)" }, pts = { 604,415 } },
                { name = "Tyger", level = "88-90", nm = true, tags = { "NM (pop/scripted)" }, pts = { -766,632 } },
                { name = "Shedu", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 591,317 } },
            } },
            { id = 253, zone = "Abyssea - Uleguerand", kind = nil, mobs = {
                { name = "Dhorme Khimaira", level = "95", nm = true, tags = { "NM (pop/scripted)" }, pts = { -281,268 } },
            } },
            { id = 48, zone = "Al Zahbi", kind = nil, mobs = {
                { name = "Nemean Lion", level = "119", tags = { "Scripted spawn" } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Awoken Gorgimera", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { 399,284 } },
            } },
            { id = 55, zone = "Ilrusi Atoll", kind = "Instance", mobs = {
                { name = "Khimaira 14X", level = "80-82", tags = { "Scripted spawn" }, pts = { -395,-560 } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Khimaira", level = "80", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Mired Khimaira", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 163,258 } },
                { name = "Mired Khrysokhimaira", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 173,220 } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Mired Khimaira", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Mired Khrysokhimaira", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 64, zone = "Navukgo Execution Chamber", kind = "Battlefield", mobs = {
                { name = "Khimaira", level = "70", tags = { "Scripted spawn" }, pts = { 383,381 } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Gorgimera", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 182, zone = "Walk of Echoes", kind = "Battlefield", mobs = {
                { name = "Harpimaira", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { 568,522,720,728,668,572,708,607 } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Gajasimha", level = "125-127", nm = true, tags = { "NM (pop/scripted)" }, pts = { -612,-1050,-490,437 } },
            } },
        },
    },
    [741] = {
        name = "Pyric Bulwark", level = 98, element = 6, skill = 388,
        family = "Hydra", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 51, zone = "Wajaom Woodlands", kind = nil, mobs = {
                { name = "Hydra", level = "80", nm = true, tags = { "NM" }, pts = { -277,-8 } },
                { name = "Tinnin", level = "88-89", nm = true, tags = { "NM (pop/scripted)" }, pts = { 278,-703 } },
                { name = "Thuban", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 361,-52,187,-98,105,48 } },
            } },
            { id = 254, zone = "Abyssea - Grauberg", kind = nil, mobs = {
                { name = "Ningishzida", level = "100", nm = true, tags = { "NM (pop/scripted)" }, pts = { 380,239 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Amymone", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { -288,-403,-558,-183 } },
            } },
            { id = 66, zone = "Mamool Ja Training Grounds", kind = "Instance", mobs = {
                { name = "Orochi", level = "80-82", tags = { "Scripted spawn" }, pts = { -440,-48 } },
            } },
            { id = 77, zone = "Nyzul Isle", kind = "Instance", mobs = {
                { name = "Hydra", level = "80", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Mired Alfard", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 139,242 } },
                { name = "Mired Hydra", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { 180,229,157,259 } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Mired Alfard", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Mired Hydra", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 73, zone = "Zhayolm Remnants", kind = "Instance", mobs = {
                { name = "Hydra", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Stoorworm", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 182, zone = "Walk of Echoes", kind = "Battlefield", mobs = {
                { name = "Natrix", level = "90-92", nm = true, tags = { "NM (pop/scripted)" }, pts = { -661,260 } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Awoken Stoorworm", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { -584,-1052 } },
                { name = "Bashmu", level = "125-127", nm = true, tags = { "NM (pop/scripted)" }, pts = { -612,-1050,-443,572 } },
            } },
        },
    },
    [742] = {
        name = "Bilgestorm", level = 99, element = 15, skill = 395,
        family = "Dvergr", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 217, zone = "Abyssea - Vunkerl", kind = nil, mobs = {
                { name = "Durinn", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { -571,-554 } },
                { name = "Dvalinn", level = "85-87", nm = true, tags = { "NM (pop/scripted)" }, pts = { -634,-476 } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Pandemonium Warden", level = "86-88", nm = true, tags = { "NM (pop/scripted)" }, pts = { 206,-140,208,-139 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Naphula", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { 472,153,105,-426,-472,153 } },
            } },
            { id = 7, zone = "Attohwa Chasm", kind = nil, mobs = {
                { name = "Fjalar", level = "?", nm = true, tags = { "NM (pop/scripted)" }, pts = { 39,-116 } },
            } },
            { id = 56, zone = "Periqia", kind = "Instance", mobs = {
                { name = "King Goldemar", level = "80-82", nm = true, tags = { "NM (pop/scripted)" }, pts = { 356,76 } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Soaring Dvergr", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -221,-150 } },
                { name = "Soaring Dweorg", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -179,-164 } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Soaring Dvergr", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
                { name = "Soaring Dweorg", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Motsognir", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 276, zone = "Ra'Kaznar Inner Court", kind = "Battlefield", mobs = {
                { name = "Powercrazed Dvergr", level = "137-139", pts = { 601,319,479,362 } },
            } },
        },
    },
    [743] = {
        name = "Bloodrake", level = 99, element = 15, skill = 395,
        family = "Vampyr", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 167, zone = "Bostaunieux Oubliette", kind = nil, mobs = {
                { name = "Wurdalak", level = "97-99", pts = { 68,-42,129,-37,199,-20,205,-58 } },
            } },
            { id = 111, zone = "Beaucedine Glacier", kind = nil, mobs = {
                { name = "Lord Ruthven", level = "85", nm = true, tags = { "NM" } },
            } },
            { id = 136, zone = "Beaucedine Glacier (S)", kind = nil, mobs = {
                { name = "Lord Ruthven", level = "85", nm = true, tags = { "NM" } },
            } },
            { id = 112, zone = "Xarcabard", kind = nil, mobs = {
                { name = "Lord Ruthven", level = "85", nm = true, tags = { "NM" } },
            } },
            { id = 137, zone = "Xarcabard (S)", kind = nil, mobs = {
                { name = "Lord Ruthven", level = "85", nm = true, tags = { "NM" } },
            } },
            { id = 68, zone = "Aydeewa Subterrane", kind = nil, mobs = {
                { name = "Nosferatu", level = "87-88", nm = true, tags = { "NM (pop/scripted)" }, pts = { -199,-61 } },
            } },
            { id = 155, zone = "Castle Zvahl Keep (S)", kind = nil, mobs = {
                { name = "Varkolak", level = "89", nm = true, tags = { "NM" }, pts = { -262,144,-346,-177,-143,-67 } },
            } },
            { id = 119, zone = "Meriphataud Mountains", kind = nil, mobs = {
                { name = "Lord Asag", level = "94-95", nm = true, tags = { "NM (pop/scripted)" }, pts = { 199,-514,-282,602,-522,515 } },
            } },
            { id = 79, zone = "Caedarva Mire", kind = nil, mobs = {
                { name = "Awoken Vampyr Jarl", level = "119", nm = true, tags = { "NM (pop/scripted)" }, pts = { 785,647 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Sava Savanovic", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { -291,-401,-472,153,95,-439 } },
            } },
            { id = 69, zone = "Leujaoam Sanctum", kind = "Instance", mobs = {
                { name = "Count Dracula", level = "78-80", tags = { "Scripted spawn" }, pts = { 499,-298 } },
            } },
            { id = 183, zone = "Maquette Abdhaljs-Legion A", kind = "Instance", mobs = {
                { name = "Soaring Vampyr", level = "99", tags = { "Scripted spawn" }, pts = { -196,-141 } },
                { name = "Soaring Strigoi", level = "99", nm = true, tags = { "NM (pop/scripted)" }, pts = { -219,-143 } },
            } },
            { id = 287, zone = "Maquette Abdhaljs-Legion B", kind = "Instance", mobs = {
                { name = "Soaring Strigoi", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 78, zone = "Hazhalm Testing Grounds", kind = "Battlefield", mobs = {
                { name = "Vampyr Jarl", level = "85", nm = true, tags = { "NM (pop/scripted)" } },
            } },
            { id = 276, zone = "Ra'Kaznar Inner Court", kind = "Battlefield", mobs = {
                { name = "Enigmatic Vampyr", level = "137-139", pts = { 840,320 } },
            } },
            { id = 13, zone = "Mine Shaft 2716", kind = "Battlefield", mobs = {
                { name = "Awoken Vampyr Jarl", level = "139", nm = true, tags = { "NM (pop/scripted)" }, pts = { -462,22,18,22,498,22 } },
            } },
        },
    },
    [744] = {
        name = "Droning Whirlwind", level = 99, element = 2, skill = 395,
        family = "Bztavian", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Xevioso", },
        zones = {
            { id = 261, zone = "Ceizak Battlegrounds", kind = nil, mobs = {
                { name = "Colkhab", level = "116", nm = true, tags = { "NM (pop/scripted)" }, pts = { -143,432 } },
            } },
            { id = 259, zone = "Rala Waterways U", kind = "Instance", mobs = {
                { name = "Colkhab", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [745] = {
        name = "Carcharian Verve", level = 99, element = 5, skill = 395,
        family = "Rockfin", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Ngai", },
        zones = {
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Tchakka", level = "117-119", conf = "wiki", tags = { "Location from wiki (retail)", "Scripted spawn", "Wildskeeper Reive NM." }, pts = { -121,-525 } },
            } },
            { id = nil, zone = "Cirdas Caverns (U)", kind = nil, mobs = {
                { name = "Dakuwaqa", level = "?", conf = "wiki", nm = true, tags = { "Delve boss.", "Location from wiki" } },
            } },
        },
    },
    [746] = {
        name = "Blistering Roar", level = 99, element = 7, skill = 395,
        family = "Rockfin", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Kalunga", "Kalunga low 30", },
        zones = {
            { id = 265, zone = "Morimar Basalt Fields", kind = nil, mobs = {
                { name = "Achuka", level = "115-117", tags = { "Scripted spawn" }, pts = { -469,503 } },
            } },
            { id = 262, zone = "Foret de Hennetiel", kind = nil, mobs = {
                { name = "Tchakka", level = "117-119", tags = { "Scripted spawn" }, pts = { -121,-525 } },
            } },
        },
    },
    [747] = {
        name = "Uproot", level = 99, element = 6, skill = 395,
        family = "Yggdreant", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Mboze", "Mboze low 30", },
        zones = {
            { id = 263, zone = "Yorcia Weald", kind = nil, mobs = {
                { name = "Yumcax", level = "107-115", tags = { "Scripted spawn" }, pts = { -497,-42 } },
            } },
            { id = 291, zone = "Reisenjima", kind = "Battlefield", mobs = {
                { name = "Yakshi", level = "125-127", tags = { "Scripted spawn" }, pts = { -612,-1050,-273,520 } },
            } },
        },
    },
    [748] = {
        name = "Crashing Thunder", level = 99, element = 4, skill = 395,
        family = "Waktza", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Ongo", "Ongo low 30", },
        zones = {
            { id = 266, zone = "Marjami Ravine", kind = nil, mobs = {
                { name = "Hurkan", level = "115-120", tags = { "Scripted spawn" }, pts = { 61,181 } },
            } },
            { id = 289, zone = "Escha - Ru'Aun", kind = nil, mobs = {
                { name = "Palila", level = "125", tags = { "Scripted spawn" }, pts = { 107,-433 } },
            } },
        },
    },
    [749] = {
        name = "Polar Roar", level = 99, element = 1, skill = 395,
        family = "Cehuetzi", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { },
        zones = {
            { id = 267, zone = "Kamihr Drifts", kind = nil, mobs = {
                { name = "Kumhau", level = "117-119", nm = true, tags = { "NM (pop/scripted)" }, pts = { 380,238 } },
            } },
            { id = 259, zone = "Rala Waterways U", kind = "Instance", mobs = {
                { name = "Kumhau", level = "?", nm = true, tags = { "NM (pop/scripted)" } },
            } },
        },
    },
    [750] = {
        name = "Mighty Guard", level = 99, element = 6, skill = 395,
        family = "Shinryu", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Sempurne", },
        zones = {
            { id = 255, zone = "Abyssea - Empyreal Paradox", kind = nil, mobs = {
                { name = "Shinryu", level = "90-139", nm = true, tags = { "NM (pop/scripted)" }, pts = { -478,515,519,519,-479,-471 } },
            } },
            { id = 290, zone = "Desuetia Empyreal Paradox", kind = "Battlefield", mobs = {
                { name = "Sempurne", level = "125", nm = true, tags = { "NM (pop/scripted)" }, pts = { -477,511 } },
            } },
        },
    },
    [751] = {
        name = "Cruel Joke", level = 99, element = 7, skill = 395,
        family = "Unknown", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Palloritus", },
        zones = {
            { id = nil, zone = "Alluvion Skirmish", kind = nil, mobs = {
                { name = "Balamor's Adumbration", level = "?", conf = "wiki", nm = true, tags = { "Location from wiki", "Random spawn when changing floors." } },
            } },
            { id = nil, zone = "Outer Ra'Kaznar (U)", kind = nil, mobs = {
                { name = "Palloritus", level = "?", conf = "wiki", nm = true, tags = { "Location from wiki", "Vagary boss (Deathborne Gate) / Ra'Kaznar Turris." } },
            } },
        },
    },
    [752] = {
        name = "Cesspool", level = 99, element = 5, skill = 395,
        family = "Unknown", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { },
        extra_lists = { "Rancibus", },
        zones = {
            { id = nil, zone = "Outer Ra'Kaznar (U)", kind = nil, mobs = {
                { name = "Rancibus", level = "?", conf = "wiki", nm = true, tags = { "Location from wiki", "Vagary boss (Brash Gate) / Ra'Kaznar Turris." } },
            } },
        },
    },
    [753] = {
        name = "Tearing Gust", level = 99, element = 2, skill = 395,
        family = "Unknown", stats = "None", stats_verified = true,
        status = "ok", unbridled = true,
        notes = { "VanaDreams maps this to skill list 'Ashrakk', whose monsters are unknown; the retail source is shown instead.", },
        extra_lists = { },
        zones = {
            { id = nil, zone = "Outer Ra'Kaznar (U)", kind = nil, mobs = {
                { name = "Putraxia", level = "?", conf = "wiki", nm = true, tags = { "Location from wiki", "Vagary boss (Duskbrood Gate) / Ra'Kaznar Turris." } },
            } },
        },
    },
};
