part of 'recents_bloc.dart';

abstract class RecentsEvent extends Equatable {
  const RecentsEvent();

  @override
  List<Object> get props => [];
}

class LoadRecent extends RecentsEvent {}
