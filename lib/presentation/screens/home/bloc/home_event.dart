part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadTvShows extends HomeEvent {}

class AddFavoriteFromHome extends HomeEvent {
  final TvShowModel model;
  final bool delete;

  const AddFavoriteFromHome(
    this.model,
    this.delete,
  );

  @override
  List<Object> get props => [model, delete];
}
