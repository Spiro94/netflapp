import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/failures/failure.dart';
import '../../core/utils/constants.dart';
import '../../domain/entities/tv_show.dart';
import '../../domain/respository/tv_show_respository.dart';
import '../models/tv_show_episode_model.dart';
import '../models/tv_show_model.dart';
import '../models/tv_show_season_model.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final http.Client client;

  TvShowRepositoryImpl(this.client);

  @override
  Future<Either<Failure, List<TvShowModel>>> getPopular() async {
    List<TvShowModel> tvShows = [];
    try {
      var response = await client.get(Uri.parse(
          url + '/tv/popular?api_key=$movieApiKey&language=en-US&page=1'));
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        for (var tvShow in jsonMap['results']) {
          var entity = TvShow.fromJson(tvShow);
          var model = TvShowModel(
            entity.id ?? 1,
            entity.posterPath ?? '',
            entity.name ?? '',
            entity.voteAverage ?? 0.0,
            entity.numberOfEpisodes ?? 0,
            entity.numberOfSeasons ?? 0,
          );
          tvShows.add(model);
        }
      } else {
        return left(Failure());
      }
    } on Exception {
      return left(Failure());
    }
    return Right(tvShows);
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getRecommended() async {
    List<TvShowModel> tvShows = [];
    try {
      var response = await client.get(Uri.parse(
          url + '/tv/top_rated?api_key=$movieApiKey&language=en-US&page=1'));
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        for (var tvShow in jsonMap['results']) {
          var entity = TvShow.fromJson(tvShow);
          var model = TvShowModel(
            entity.id ?? 1,
            entity.posterPath ?? '',
            entity.name ?? '',
            entity.voteAverage ?? 0.0,
            entity.numberOfEpisodes ?? 0,
            entity.numberOfSeasons ?? 0,
          );
          tvShows.add(model);
        }
      } else {
        return left(Failure());
      }
    } on Exception {
      return left(Failure());
    }
    return Right(tvShows);
  }

  @override
  Future<bool> addFavorite(TvShowModel model, {bool delete = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favorites = prefs.getString('favorites') ?? '[]';
    List<TvShowModel> models = [];
    var jsonDecode = json.decode(favorites);

    for (var item in jsonDecode) {
      models.add(TvShowModel.fromJson(item));
    }

    if (models.any((element) => element.id == model.id)) {
      if (delete == true) {
        models.removeWhere((item) => item.id == model.id);
      }
    } else {
      models.add(model);
    }

    var data = json.encode(
      models.map<Map<String, dynamic>>((model) => model.toJson()).toList(),
    );

    return await prefs.setString('favorites', data);
  }

  @override
  Future<Either<Failure, List<TvShowModel>>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favorites = prefs.getString('favorites') ?? '[]';
    List<TvShowModel> models = [];
    var jsonDecode = json.decode(favorites);

    for (var item in jsonDecode) {
      models.add(TvShowModel.fromJson(item));
    }
    return Right(models);
  }

  @override
  Future<Either<Failure, TvShowModel>> getSeasons(int id) async {
    TvShowModel tvShow;
    try {
      var response = await client
          .get(Uri.parse(url + '/tv/$id?api_key=$movieApiKey&language=en-US'));
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);

        var entity = TvShow.fromJson(jsonMap);
        List<TvShowSeasonModel> seasons = [];
        List<TvShowEpisodeModel> episodes = [];

        for (var i = 1; i <= (entity.numberOfSeasons ?? 0); i++) {
          var responseSeason = await client.get(Uri.parse(
              url + '/tv/$id/season/$i?api_key=$movieApiKey&language=en-US'));

          if (responseSeason.statusCode == 200) {
            var seasonEntity =
                TvShowSeason.fromJson(json.decode(responseSeason.body));
            seasonEntity.episodes?.forEach((episodeEntity) {
              if (episodeEntity != null) {
                var episode = TvShowEpisodeModel(
                  episodeEntity.id ?? 1,
                  episodeEntity.name ?? '',
                  episodeEntity.episodeNumber ?? 1,
                  episodeEntity.voteAverage ?? 0.0,
                  episodeEntity.overview ?? '',
                  episodeEntity.stillPath ?? '',
                  episodeEntity.seasonNumber ?? 1,
                  episodeEntity.airDate ?? '',
                );
                episodes.add(episode);
              }
            });
            var season = TvShowSeasonModel(seasonEntity.id ?? 1, episodes);
            seasons.add(season);
          } else {
            return left(Failure());
          }
        }

        tvShow = TvShowModel(
          entity.id ?? 1,
          entity.posterPath ?? '',
          entity.name ?? '',
          entity.voteAverage ?? 0.0,
          entity.numberOfEpisodes ?? 0,
          entity.numberOfSeasons ?? 0,
          false,
          episodes,
        );
      } else {
        return left(Failure());
      }
    } on Exception {
      return left(Failure());
    }
    return Right(tvShow);
  }
}
