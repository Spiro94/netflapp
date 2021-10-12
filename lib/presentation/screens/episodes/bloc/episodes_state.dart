part of 'episodes_bloc.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoading extends EpisodesState {}

class EpisodesLoadedFailed extends EpisodesState {}

class EpisodesLoaded extends EpisodesState {
  final TvShowModel model;

  const EpisodesLoaded(this.model);
  @override
  List<Object> get props => [model];
}
