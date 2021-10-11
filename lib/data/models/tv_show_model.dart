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
      'numberOfEpisodes': numberOfEpisodes ?? 0,
      'numberOfSeasons': numberOfSeasons ?? 0,
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
