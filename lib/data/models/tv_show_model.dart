import 'package:equatable/equatable.dart';

class TvShowModel extends Equatable {
  final int? id;
  final String? posterPath;
  final String? name;
  final double? voteAverage;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final bool isFavorite;

  const TvShowModel(this.id, this.posterPath, this.name, this.voteAverage,
      this.numberOfEpisodes, this.numberOfSeasons,
      [this.isFavorite = false]);

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
