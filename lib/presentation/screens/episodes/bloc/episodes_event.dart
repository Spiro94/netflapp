part of 'episodes_bloc.dart';

abstract class EpisodesEvent extends Equatable {
  const EpisodesEvent();

  @override
  List<Object> get props => [];
}

class LoadEpisodes extends EpisodesEvent {
  final int id;

  const LoadEpisodes(this.id);

  @override
  List<Object> get props => [id];
}
