import 'package:equatable/equatable.dart';
import 'package:netflapp/data/models/tv_show_episode_model.dart';

class TvShowSeasonModel extends Equatable {
  final int id;
  final List<TvShowEpisodeModel> episodes;

  const TvShowSeasonModel(this.id, this.episodes);

  @override
  List<Object?> get props => [
        id,
        episodes,
      ];
}
