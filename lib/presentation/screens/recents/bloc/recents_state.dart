part of 'recents_bloc.dart';

abstract class RecentsState extends Equatable {
  const RecentsState();

  @override
  List<Object> get props => [];
}

class RecentsInitial extends RecentsState {}

class RecentsLoadedFailed extends RecentsState {}

class RecentsLoading extends RecentsState {}

class RecentsLoaded extends RecentsState {
  final List<TvShowModel> recent;

  const RecentsLoaded(this.recent);

  @override
  List<Object> get props => [recent];
}
