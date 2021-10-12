import 'package:equatable/equatable.dart';

import 'tv_show_episode_model.dart';

class TvShowModel extends Equatable {
  final int id;
  final String posterPath;
  final String name;
  final double voteAverage;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final bool isFavorite;
  final List<TvShowEpisodeModel> episodes;

  const TvShowModel(this.id, this.posterPath, this.name, this.voteAverage,
      this.numberOfEpisodes, this.numberOfSeasons,
      [this.isFavorite = false, this.episodes = const []]);

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
        json['id'],
        json['posterPath'],
        json['name'],
        json['voteAverage'],
        json['numberOfEpisodes'],
        json['numberOfSeasons'],
        json['isFavorite']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'posterPath': posterPath,
      'name': name,
      'voteAverage': voteAverage,
      'numberOfEpisodes': numberOfEpisodes,
      'numberOfSeasons': numberOfSeasons,
      'isFavorite': true,
    };
  }

  @override
  List<Object?> get props => [
        id,
        posterPath,
        name,
        voteAverage,
        numberOfEpisodes,
        numberOfSeasons,
        isFavorite,
      ];
}
