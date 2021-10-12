import 'package:equatable/equatable.dart';

class TvShowEpisodeModel extends Equatable {
  final int id;
  final String name;
  final int episodeNumber;
  final double voteAverage;
  final String overview;
  final String stillPath;
  final int seasonNumber;
  final String airDate;

  const TvShowEpisodeModel(
    this.id,
    this.name,
    this.episodeNumber,
    this.voteAverage,
    this.overview,
    this.stillPath,
    this.seasonNumber,
    this.airDate,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        episodeNumber,
        voteAverage,
        overview,
        stillPath,
        seasonNumber,
        airDate
      ];
}
