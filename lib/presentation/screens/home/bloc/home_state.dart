part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class TvShowsLoading extends HomeState {}

class FavoriteLoading extends HomeState {}

class TvShowsLoaded extends HomeState {
  final bool flag;
  final List<TvShowModel> popular;
  final List<TvShowModel> recommended;
  final List<TvShowModel> favorites;

  const TvShowsLoaded(this.popular, this.recommended, this.favorites,
      {this.flag = false});
  @override
  List<Object> get props => [popular, recommended];
}

class TvShowsLoadFailed extends HomeState {}

class FavoriteAdded extends HomeState {
  final bool hasChanged;
  final List<TvShowModel> popular;
  final List<TvShowModel> recommended;

  const FavoriteAdded(
    this.popular,
    this.recommended,
    this.hasChanged,
  );
  @override
  List<Object> get props => [
        popular,
        recommended,
        hasChanged,
      ];
}

class FavoriteDeleted extends HomeState {
  final List<TvShowModel> popular;
  final List<TvShowModel> recommended;

  const FavoriteDeleted(
    this.popular,
    this.recommended,
  );
  @override
  List<Object> get props => [popular, recommended];
}

class FavoriteAddedFailed extends HomeState {}
