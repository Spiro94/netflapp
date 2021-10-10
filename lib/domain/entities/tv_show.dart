class TvShowSpokenLanguages {
/*
{
  "english_name": "English",
  "iso_639_1": "en",
  "name": "English"
} 
*/

  String? englishName;
  String? iso_639_1;
  String? name;

  TvShowSpokenLanguages({
    this.englishName,
    this.iso_639_1,
    this.name,
  });
  TvShowSpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json["english_name"]?.toString();
    iso_639_1 = json["iso_639_1"]?.toString();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["english_name"] = englishName;
    data["iso_639_1"] = iso_639_1;
    data["name"] = name;
    return data;
  }
}

class TvShowSeasons {
/*
{
  "air_date": "2010-12-05",
  "episode_count": 64,
  "id": 3627,
  "name": "Specials",
  "overview": "",
  "poster_path": "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
  "season_number": 0
} 
*/

  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  TvShowSeasons({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });
  TvShowSeasons.fromJson(Map<String, dynamic> json) {
    airDate = json["air_date"]?.toString();
    episodeCount = json["episode_count"]?.toInt();
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    overview = json["overview"]?.toString();
    posterPath = json["poster_path"]?.toString();
    seasonNumber = json["season_number"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["air_date"] = airDate;
    data["episode_count"] = episodeCount;
    data["id"] = id;
    data["name"] = name;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["season_number"] = seasonNumber;
    return data;
  }
}

class TvShowProductionCountries {
/*
{
  "iso_3166_1": "GB",
  "name": "United Kingdom"
} 
*/

  String? iso_3166_1;
  String? name;

  TvShowProductionCountries({
    this.iso_3166_1,
    this.name,
  });
  TvShowProductionCountries.fromJson(Map<String, dynamic> json) {
    iso_3166_1 = json["iso_3166_1"]?.toString();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["iso_3166_1"] = iso_3166_1;
    data["name"] = name;
    return data;
  }
}

class TvShowProductionCompanies {
/*
{
  "id": 76043,
  "logo_path": "/9RO2vbQ67otPrBLXCaC8UMp3Qat.png",
  "name": "Revolution Sun Studios",
  "origin_country": "US"
} 
*/

  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  TvShowProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
  TvShowProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    logoPath = json["logo_path"]?.toString();
    name = json["name"]?.toString();
    originCountry = json["origin_country"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["logo_path"] = logoPath;
    data["name"] = name;
    data["origin_country"] = originCountry;
    return data;
  }
}

class TvShowNetworks {
/*
{
  "name": "HBO",
  "id": 49,
  "logo_path": "/tuomPhY2UtuPTqqFnKMVHvSb724.png",
  "origin_country": "US"
} 
*/

  String? name;
  int? id;
  String? logoPath;
  String? originCountry;

  TvShowNetworks({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });
  TvShowNetworks.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    id = json["id"]?.toInt();
    logoPath = json["logo_path"]?.toString();
    originCountry = json["origin_country"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["id"] = id;
    data["logo_path"] = logoPath;
    data["origin_country"] = originCountry;
    return data;
  }
}

class TvShowLastEpisodeToAir {
/*
{
  "air_date": "2019-05-19",
  "episode_number": 6,
  "id": 1551830,
  "name": "The Iron Throne",
  "overview": "In the aftermath of the devastating attack on King's Landing, Daenerys must face the survivors.",
  "production_code": "806",
  "season_number": 8,
  "still_path": "/3x8tJon5jXFa1ziAM93hPKNyW7i.jpg",
  "vote_average": 4.8,
  "vote_count": 106
} 
*/

  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? seasonNumber;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  TvShowLastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });
  TvShowLastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json["air_date"]?.toString();
    episodeNumber = json["episode_number"]?.toInt();
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    overview = json["overview"]?.toString();
    productionCode = json["production_code"]?.toString();
    seasonNumber = json["season_number"]?.toInt();
    stillPath = json["still_path"]?.toString();
    voteAverage = json["vote_average"]?.toDouble();
    voteCount = json["vote_count"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["air_date"] = airDate;
    data["episode_number"] = episodeNumber;
    data["id"] = id;
    data["name"] = name;
    data["overview"] = overview;
    data["production_code"] = productionCode;
    data["season_number"] = seasonNumber;
    data["still_path"] = stillPath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}

class TvShowGenres {
/*
{
  "id": 10765,
  "name": "Sci-Fi & Fantasy"
} 
*/

  int? id;
  String? name;

  TvShowGenres({
    this.id,
    this.name,
  });
  TvShowGenres.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}

class TvShowCreatedBy {
/*
{
  "id": 9813,
  "credit_id": "5256c8c219c2956ff604858a",
  "name": "David Benioff",
  "gender": 2,
  "profile_path": "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"
} 
*/

  int? id;
  String? creditId;
  String? name;
  int? gender;
  String? profilePath;

  TvShowCreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });
  TvShowCreatedBy.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    creditId = json["credit_id"]?.toString();
    name = json["name"]?.toString();
    gender = json["gender"]?.toInt();
    profilePath = json["profile_path"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["credit_id"] = creditId;
    data["name"] = name;
    data["gender"] = gender;
    data["profile_path"] = profilePath;
    return data;
  }
}

class TvShow {
/*
{
  "backdrop_path": "/suopoADq0k8YZr4dQXcU6pToj6s.jpg",
  "created_by": [
    {
      "id": 9813,
      "credit_id": "5256c8c219c2956ff604858a",
      "name": "David Benioff",
      "gender": 2,
      "profile_path": "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"
    }
  ],
  "episode_run_time": [
    60
  ],
  "first_air_date": "2011-04-17",
  "genres": [
    {
      "id": 10765,
      "name": "Sci-Fi & Fantasy"
    }
  ],
  "homepage": "http://www.hbo.com/game-of-thrones",
  "id": 1399,
  "in_production": false,
  "languages": [
    "en"
  ],
  "last_air_date": "2019-05-19",
  "last_episode_to_air": {
    "air_date": "2019-05-19",
    "episode_number": 6,
    "id": 1551830,
    "name": "The Iron Throne",
    "overview": "In the aftermath of the devastating attack on King's Landing, Daenerys must face the survivors.",
    "production_code": "806",
    "season_number": 8,
    "still_path": "/3x8tJon5jXFa1ziAM93hPKNyW7i.jpg",
    "vote_average": 4.8,
    "vote_count": 106
  },
  "name": "Game of Thrones",
  "next_episode_to_air": null,
  "networks": [
    {
      "name": "HBO",
      "id": 49,
      "logo_path": "/tuomPhY2UtuPTqqFnKMVHvSb724.png",
      "origin_country": "US"
    }
  ],
  "number_of_episodes": 73,
  "number_of_seasons": 8,
  "origin_country": [
    "US"
  ],
  "original_language": "en",
  "original_name": "Game of Thrones",
  "overview": "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  "popularity": 369.594,
  "poster_path": "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg",
  "production_companies": [
    {
      "id": 76043,
      "logo_path": "/9RO2vbQ67otPrBLXCaC8UMp3Qat.png",
      "name": "Revolution Sun Studios",
      "origin_country": "US"
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "GB",
      "name": "United Kingdom"
    }
  ],
  "seasons": [
    {
      "air_date": "2010-12-05",
      "episode_count": 64,
      "id": 3627,
      "name": "Specials",
      "overview": "",
      "poster_path": "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
      "season_number": 0
    }
  ],
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    }
  ],
  "status": "Ended",
  "tagline": "Winter Is Coming",
  "type": "Scripted",
  "vote_average": 8.3,
  "vote_count": 11504
} 
*/

  String? backdropPath;
  List<TvShowCreatedBy?>? createdBy;
  List<int?>? episodeRunTime;
  String? firstAirDate;
  List<TvShowGenres?>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String?>? languages;
  String? lastAirDate;
  TvShowLastEpisodeToAir? lastEpisodeToAir;
  String? name;
  String? nextEpisodeToAir;
  List<TvShowNetworks?>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String?>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<TvShowProductionCompanies?>? productionCompanies;
  List<TvShowProductionCountries?>? productionCountries;
  List<TvShowSeasons?>? seasons;
  List<TvShowSpokenLanguages?>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  TvShow({
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });
  TvShow.fromJson(Map<String, dynamic> json) {
    backdropPath = json["backdrop_path"]?.toString();
    if (json["created_by"] != null) {
      final v = json["created_by"];
      final arr0 = <TvShowCreatedBy>[];
      v.forEach((v) {
        arr0.add(TvShowCreatedBy.fromJson(v));
      });
      createdBy = arr0;
    }
    if (json["episode_run_time"] != null) {
      final v = json["episode_run_time"];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      episodeRunTime = arr0;
    }
    firstAirDate = json["first_air_date"]?.toString();
    if (json["genres"] != null) {
      final v = json["genres"];
      final arr0 = <TvShowGenres>[];
      v.forEach((v) {
        arr0.add(TvShowGenres.fromJson(v));
      });
      genres = arr0;
    }
    homepage = json["homepage"]?.toString();
    id = json["id"]?.toInt();
    inProduction = json["in_production"];
    if (json["languages"] != null) {
      final v = json["languages"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      languages = arr0;
    }
    lastAirDate = json["last_air_date"]?.toString();
    lastEpisodeToAir = (json["last_episode_to_air"] != null)
        ? TvShowLastEpisodeToAir.fromJson(json["last_episode_to_air"])
        : null;
    name = json["name"]?.toString();
    nextEpisodeToAir = json["next_episode_to_air"]?.toString();
    if (json["networks"] != null) {
      final v = json["networks"];
      final arr0 = <TvShowNetworks>[];
      v.forEach((v) {
        arr0.add(TvShowNetworks.fromJson(v));
      });
      networks = arr0;
    }
    numberOfEpisodes = json["number_of_episodes"]?.toInt();
    numberOfSeasons = json["number_of_seasons"]?.toInt();
    if (json["origin_country"] != null) {
      final v = json["origin_country"];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      originCountry = arr0;
    }
    originalLanguage = json["original_language"]?.toString();
    originalName = json["original_name"]?.toString();
    overview = json["overview"]?.toString();
    popularity = json["popularity"]?.toDouble();
    posterPath = json["poster_path"]?.toString();
    if (json["production_companies"] != null) {
      final v = json["production_companies"];
      final arr0 = <TvShowProductionCompanies>[];
      v.forEach((v) {
        arr0.add(TvShowProductionCompanies.fromJson(v));
      });
      productionCompanies = arr0;
    }
    if (json["production_countries"] != null) {
      final v = json["production_countries"];
      final arr0 = <TvShowProductionCountries>[];
      v.forEach((v) {
        arr0.add(TvShowProductionCountries.fromJson(v));
      });
      productionCountries = arr0;
    }
    if (json["seasons"] != null) {
      final v = json["seasons"];
      final arr0 = <TvShowSeasons>[];
      v.forEach((v) {
        arr0.add(TvShowSeasons.fromJson(v));
      });
      seasons = arr0;
    }
    if (json["spoken_languages"] != null) {
      final v = json["spoken_languages"];
      final arr0 = <TvShowSpokenLanguages>[];
      v.forEach((v) {
        arr0.add(TvShowSpokenLanguages.fromJson(v));
      });
      spokenLanguages = arr0;
    }
    status = json["status"]?.toString();
    tagline = json["tagline"]?.toString();
    type = json["type"]?.toString();
    voteAverage = json["vote_average"]?.toDouble();
    voteCount = json["vote_count"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["backdrop_path"] = backdropPath;
    if (createdBy != null) {
      final v = createdBy;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["created_by"] = arr0;
    }
    if (episodeRunTime != null) {
      final v = episodeRunTime;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data["episode_run_time"] = arr0;
    }
    data["first_air_date"] = firstAirDate;
    if (genres != null) {
      final v = genres;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["genres"] = arr0;
    }
    data["homepage"] = homepage;
    data["id"] = id;
    data["in_production"] = inProduction;
    if (languages != null) {
      final v = languages;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data["languages"] = arr0;
    }
    data["last_air_date"] = lastAirDate;
    if (lastEpisodeToAir != null) {
      data["last_episode_to_air"] = lastEpisodeToAir!.toJson();
    }
    data["name"] = name;
    data["next_episode_to_air"] = nextEpisodeToAir;
    if (networks != null) {
      final v = networks;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["networks"] = arr0;
    }
    data["number_of_episodes"] = numberOfEpisodes;
    data["number_of_seasons"] = numberOfSeasons;
    if (originCountry != null) {
      final v = originCountry;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data["origin_country"] = arr0;
    }
    data["original_language"] = originalLanguage;
    data["original_name"] = originalName;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    if (productionCompanies != null) {
      final v = productionCompanies;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["production_companies"] = arr0;
    }
    if (productionCountries != null) {
      final v = productionCountries;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["production_countries"] = arr0;
    }
    if (seasons != null) {
      final v = seasons;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["seasons"] = arr0;
    }
    if (spokenLanguages != null) {
      final v = spokenLanguages;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["spoken_languages"] = arr0;
    }
    data["status"] = status;
    data["tagline"] = tagline;
    data["type"] = type;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
