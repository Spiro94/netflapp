part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class TvShowsLoading extends HomeState {}

class TvShowsLoaded extends HomeState {
  final List<TvShowModel> popular;
  final List<TvShowModel> recommended;

  const TvShowsLoaded(this.popular, this.recommended);
  @override
  List<Object> get props => [popular, recommended];
}

class TvShowsLoadFailed extends HomeState {}
