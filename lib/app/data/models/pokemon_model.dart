// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);
import 'dart:convert';

Pokemon pokemonFromJson(String str) =>
    Pokemon.fromJson(json.decode(str) as Map<String, dynamic>);

class Ability {
  final Species ability;
  final bool isHidden;
  final int slot;
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json['ability'] as Map<String, dynamic>),
        isHidden: json['is_hidden'] as bool,
        slot: json['slot'] as int,
      );
}

class Crystal {
  final String? backDefault;
  final String? backShiny;
  final String? backShinyTransparent;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontShinyTransparent;
  final String? frontTransparent;
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });
  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json['back_default'] == null
            ? null
            : json['back_default'] as String,
        backShiny:
            json['back_shiny'] == null ? null : json['back_shiny'] as String,
        backShinyTransparent: json['back_shiny_transparent'] == null
            ? null
            : json['back_shiny_transparent'] as String,
        backTransparent: json['back_transparent'] == null
            ? null
            : json['back_transparent'] as String,
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontShiny:
            json['front_shiny'] == null ? null : json['front_shiny'] as String,
        frontShinyTransparent: json['front_shiny_transparent'] == null
            ? null
            : json['front_shiny_transparent'] as String,
        frontTransparent: json['front_transparent'] == null
            ? null
            : json['front_transparent'] as String,
      );
}

class DreamWorld {
  final String? frontDefault;
  final String? frontFemale;
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });
  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontFemale: json['front_female'] == null
            ? null
            : json['front_female'] as String,
      );
}

class Emerald {
  final String? frontDefault;
  final String? frontShiny;
  Emerald({
    required this.frontDefault,
    this.frontShiny,
  });
  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontShiny:
            json['front_shiny'] == null ? null : json['front_shiny'] as String,
      );
}

class GameIndex {
  final int gameIndex;
  final Species version;
  GameIndex({
    required this.gameIndex,
    required this.version,
  });
  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json['game_index'] as int,
        version: Species.fromJson(json['version'] as Map<String, dynamic>),
      );
}

class GenerationI {
  final RedBlue? redBlue;
  final RedBlue? yellow;
  GenerationI({
    this.redBlue,
    this.yellow,
  });
  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json['red-blue'] as Map<String, dynamic>),
        yellow: RedBlue.fromJson(json['yellow'] as Map<String, dynamic>),
      );
}

class GenerationII {
  final Crystal? crystal;
  final Gold? gold;
  final Gold? silver;
  GenerationII({
    this.crystal,
    this.gold,
    this.silver,
  });
  factory GenerationII.fromJson(Map<String, dynamic> json) => GenerationII(
        crystal: Crystal.fromJson(json['crystal'] as Map<String, dynamic>),
        gold: Gold.fromJson(json['gold'] as Map<String, dynamic>),
        silver: Gold.fromJson(json['silver'] as Map<String, dynamic>),
      );
}

class GenerationIII {
  final Emerald? emerald;
  final Gold? fireredLeafgreen;
  final Gold? rubySapphire;
  GenerationIII({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });
  factory GenerationIII.fromJson(Map<String, dynamic> json) => GenerationIII(
        emerald: Emerald.fromJson(json['emerald'] as Map<String, dynamic>),
        fireredLeafgreen:
            Gold.fromJson(json['firered-leafgreen'] as Map<String, dynamic>),
        rubySapphire:
            Gold.fromJson(json['ruby-sapphire'] as Map<String, dynamic>),
      );
}

class GenerationIV {
  final Sprites? diamondPearl;
  final Sprites? heartgoldSoulsilver;
  final Sprites? platinum;
  GenerationIV({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });
  factory GenerationIV.fromJson(Map<String, dynamic> json) => GenerationIV(
        diamondPearl: json['diamond-pearl'] == null
            ? null
            : Sprites.fromJson(json['diamond-pearl'] as Map<String, dynamic>),
        heartgoldSoulsilver: json['heartgold-soulsilver'] == null
            ? null
            : Sprites.fromJson(
                json['heartgold-soulsilver'] as Map<String, dynamic>,
              ),
        platinum: json['platinum'] == null
            ? null
            : Sprites.fromJson(json['platinum'] as Map<String, dynamic>),
      );
}

class GenerationV {
  final Sprites? blackWhite;
  GenerationV({
    this.blackWhite,
  });
  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite:
            Sprites.fromJson(json['black-white'] as Map<String, dynamic>),
      );
}

class GenerationVII {
  final DreamWorld? icons;
  final Home? ultraSunUltraMoon;
  GenerationVII({
    this.icons,
    this.ultraSunUltraMoon,
  });
  factory GenerationVII.fromJson(Map<String, dynamic> json) => GenerationVII(
        icons: DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
        ultraSunUltraMoon: Home.fromJson(
          json['ultra-sun-ultra-moon'] as Map<String, dynamic>,
        ),
      );
}

class GenerationVI {
  GenerationVI({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  factory GenerationVI.fromJson(Map<String, dynamic> json) => GenerationVI(
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontFemale: json['front_female'] == null
            ? null
            : json['front_female'] as String,
        frontShiny:
            json['front_shiny'] == null ? null : json['front_shiny'] as String,
        frontShinyFemale: json['front_shiny_female'] == null
            ? null
            : json['front_shiny_female'] as String,
      );
}

class GenerationVIII {
  final DreamWorld? icons;
  GenerationVIII({
    this.icons,
  });
  factory GenerationVIII.fromJson(Map<String, dynamic> json) => GenerationVIII(
        icons: DreamWorld.fromJson(json['icons'] as Map<String, dynamic>),
      );
}

class Gold {
  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontTransparent;
  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });
  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json['back_default'] == null
            ? null
            : json['back_default'] as String,
        backShiny:
            json['back_shiny'] == null ? null : json['back_shiny'] as String,
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontShiny:
            json['front_shiny'] == null ? null : json['front_shiny'] as String,
        frontTransparent: json['front_transparent'] == null
            ? null
            : json['front_transparent'] as String,
      );
}

class Home {
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  Home({
    required this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontFemale: json['front_female'] == null
            ? null
            : json['front_female'] as String,
        frontShiny:
            json['front_shiny'] == null ? null : json['front_shiny'] as String,
        frontShinyFemale: json['front_shiny_female'] == null
            ? null
            : json['front_shiny_female'] as String,
      );
}

class Move {
  final Species? move;
  final List<VersionGroupDetail>? versionGroupDetails;
  Move({
    this.move,
    this.versionGroupDetails,
  });
  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json['move'] as Map<String, dynamic>),
        versionGroupDetails: List<VersionGroupDetail>.from(
          (json['version_group_details'] as List<dynamic>).map(
            (dynamic x) => VersionGroupDetail.fromJson(
              x as Map<String, dynamic>,
            ),
          ),
        ),
      );
}

class OfficialArtwork {
  final String? frontDefault;
  OfficialArtwork({
    required this.frontDefault,
  });
  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
      );
}

class Other {
  final DreamWorld? dreamWorld;
  final Home? home;
  final OfficialArtwork? officialArtwork;
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });
  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld:
            DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>),
        home: Home.fromJson(json['home'] as Map<String, dynamic>),
        officialArtwork: OfficialArtwork.fromJson(
          json['official-artwork'] as Map<String, dynamic>,
        ),
      );
}

class Pokemon {
  final bool? isDefault;
  final int? baseExperience;
  final int? height;
  final int? id;
  final int? order;
  final int? weight;
  final List<Ability>? abilities;
  final List<GameIndex>? gameIndices;
  final List<Move>? moves;
  final List<Species>? forms;
  final List<Stat>? stats;
  final List<Type>? types;
  final Species? species;
  final Sprites? sprites;
  final String? locationAreaEncounters;
  final String? name;
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });
  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(
          (json['abilities'] as List<dynamic>).map(
            (dynamic x) => Ability.fromJson(x as Map<String, dynamic>),
          ),
        ),
        baseExperience: json['base_experience'] as int,
        forms: List<Species>.from(
          (json['forms'] as List<dynamic>)
              .map((dynamic x) => Species.fromJson(x as Map<String, dynamic>)),
        ),
        gameIndices: List<GameIndex>.from(
          (json['game_indices'] as List<dynamic>).map(
            (dynamic x) => GameIndex.fromJson(x as Map<String, dynamic>),
          ),
        ),
        height: json['height'] as int,
        id: json['id'] as int,
        isDefault: json['is_default'] as bool,
        locationAreaEncounters: json['location_area_encounters'] as String,
        moves: List<Move>.from(
          (json['moves'] as List<dynamic>).map(
            (dynamic x) => Move.fromJson(x as Map<String, dynamic>),
          ),
        ),
        name: json['name'] as String,
        order: json['order'] as int,
        species: Species.fromJson(json['species'] as Map<String, dynamic>),
        sprites: json['sprites'] == null
            ? null
            : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
        stats: List<Stat>.from(
          (json['stats'] as List<dynamic>).map(
            (dynamic x) => Stat.fromJson(x as Map<String, dynamic>),
          ),
        ),
        types: List<Type>.from(
          (json['types'] as List<dynamic>).map(
            (dynamic x) => Type.fromJson(x as Map<String, dynamic>),
          ),
        ),
        weight: json['weight'] as int,
      );
}

class RedBlue {
  final String? backDefault;
  final String? backGray;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontGray;
  final String? frontTransparent;
  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });
  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json['back_default'] == null
            ? null
            : json['back_default'] as String,
        backGray:
            json['back_gray'] == null ? null : json['back_gray'] as String,
        backTransparent: json['back_transparent'] == null
            ? null
            : json['back_transparent'] as String,
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontGray:
            json['front_gray'] == null ? null : json['front_gray'] as String,
        frontTransparent: json['front_transparent'] == null
            ? null
            : json['front_transparent'] as String,
      );
}

class Species {
  final String? name;
  final String? url;
  Species({
    this.name,
    this.url,
  });
  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'] as String,
        url: json['url'] as String,
      );
}

class Sprites {
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });
  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'] == null
            ? null
            : json['back_default'] as String,
        backFemale:
            json['back_female'] == null ? null : json['back_female'] as String,
        backShiny:
            json['back_shiny'] == null ? null : json['back_shiny'] as String,
        backShinyFemale: json['back_shiny_female'] == null
            ? null
            : json['back_shiny_female'] as String,
        frontDefault: json['front_default'] == null
            ? null
            : json['front_default'] as String,
        frontFemale: json['front_female'] == null
            ? null
            : json['front_female'] as String,
        frontShiny:
            json['front_shiny'] == null ? null : json['front_shiny'] as String,
        frontShinyFemale: json['front_shiny_female'] == null
            ? null
            : json['front_shiny_female'] as String,
        other: json['other'] == null
            ? null
            : Other.fromJson(
                json['other'] as Map<String, dynamic>,
              ),
        versions: json['versions'] == null
            ? null
            : Versions.fromJson(json['versions'] as Map<String, dynamic>),
        animated: json['animated'] == null
            ? null
            : Sprites.fromJson(json['animated'] as Map<String, dynamic>),
      );
}

class Stat {
  final int? baseStat;
  final int? effort;
  final Species? stat;
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });
  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'] as int,
        effort: json['effort'] as int,
        stat: Species.fromJson(json['stat'] as Map<String, dynamic>),
      );
}

class Type {
  final int? slot;
  final Species? type;
  Type({
    this.slot,
    this.type,
  });
  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'] as int,
        type: Species.fromJson(json['type'] as Map<String, dynamic>),
      );
}

class VersionGroupDetail {
  final int? levelLearnedAt;
  final Species? moveLearnMethod;
  final Species? versionGroup;
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });
  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json['level_learned_at'] as int,
        moveLearnMethod:
            Species.fromJson(json['move_learn_method'] as Map<String, dynamic>),
        versionGroup:
            Species.fromJson(json['version_group'] as Map<String, dynamic>),
      );
}

class Versions {
  final GenerationI? generationI;
  final GenerationII? generationII;
  final GenerationIII? generationIII;
  final GenerationIV? generationIV;
  final GenerationV? generationV;
  final GenerationVI? generationVI;
  final GenerationVII? generationVII;
  final GenerationVIII? generationVIII;
  Versions({
    this.generationI,
    this.generationII,
    this.generationIII,
    this.generationIV,
    this.generationV,
    this.generationVI,
    this.generationVII,
    this.generationVIII,
  });
  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(
          json['generation-i'] as Map<String, dynamic>,
        ),
        generationII: GenerationII.fromJson(
          json['generation-ii'] as Map<String, dynamic>,
        ),
        generationIII: GenerationIII.fromJson(
          json['generation-iii'] as Map<String, dynamic>,
        ),
        generationIV: GenerationIV.fromJson(
          json['generation-iv'] as Map<String, dynamic>,
        ),
        generationV: GenerationV.fromJson(
          json['generation-v'] as Map<String, dynamic>,
        ),
        generationVI: GenerationVI.fromJson(
          json['generation-vi'] as Map<String, dynamic>,
        ),
        generationVII: GenerationVII.fromJson(
          json['generation-vii'] as Map<String, dynamic>,
        ),
        generationVIII: GenerationVIII.fromJson(
          json['generation-viii'] as Map<String, dynamic>,
        ),
      );
}
