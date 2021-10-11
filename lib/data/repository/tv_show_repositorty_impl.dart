import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:netflapp/core/utils/constants.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/domain/respository/tv_show_respository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/failures/failure.dart';
import '../../domain/entities/tv_show.dart';

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
            entity.id,
            entity.posterPath,
            entity.name,
            entity.voteAverage,
            entity.numberOfEpisodes,
            entity.numberOfSeasons,
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
            entity.id,
            entity.posterPath,
            entity.name,
            entity.voteAverage,
            entity.numberOfEpisodes,
            entity.numberOfSeasons,
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
}