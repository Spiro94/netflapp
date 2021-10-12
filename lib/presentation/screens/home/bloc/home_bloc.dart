import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflapp/core/failures/failure.dart';

import '../../../../data/models/tv_show_model.dart';
import '../../../../domain/respository/tv_show_respository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TvShowRepository tvshowRepository;
  HomeBloc(this.tvshowRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadTvShows) {
        await _loadTvShowsEvent(
          emit,
        );
      }
      if (event is AddFavoriteFromHome) {
        await _addFavoriteFromHome(event, emit);
      }
    });
  }

  Future<void> _loadTvShowsEvent(Emitter<HomeState> emit) async {
    emit(TvShowsLoading());
    List<TvShowModel> popularSeries = [];
    List<TvShowModel> recommendedSeries = [];
    List<TvShowModel> favoriteSeries = [];

    var popRes = await tvshowRepository.getPopular();
    Failure? failure;
    popRes.fold((l) => failure = l, (r) => popularSeries = r);

    if (failure == null) {
      var recoRes = await tvshowRepository.getRecommended();

      recoRes.fold((l) => failure = l, (r) => recommendedSeries = r);

      if (failure == null) {
        var favRes = await tvshowRepository.getFavorites();

        favRes.fold((l) => failure = l, (r) => favoriteSeries = r);

        if (failure == null) {
          List<int> indexes = [];
          List<TvShowModel> newRecommended = [];
          for (var serie in favoriteSeries) {
            int index = recommendedSeries
                .indexWhere((element) => element.id == serie.id);
            if (index != -1) indexes.add(index);
          }

          for (var i = 0; i < recommendedSeries.length; i++) {
            if (indexes.contains(i)) {
              newRecommended.add(
                TvShowModel(
                  recommendedSeries[i].id,
                  recommendedSeries[i].posterPath,
                  recommendedSeries[i].name,
                  recommendedSeries[i].voteAverage,
                  recommendedSeries[i].numberOfEpisodes,
                  recommendedSeries[i].numberOfSeasons,
                  true,
                ),
              );
            } else {
              newRecommended.add(recommendedSeries[i]);
            }
          }

          emit(TvShowsLoaded(
            popularSeries,
            newRecommended,
            favoriteSeries,
          ));
        } else {
          emit(TvShowsLoadFailed());
        }
      } else {
        emit(TvShowsLoadFailed());
      }
    } else {
      emit(TvShowsLoadFailed());
    }
  }

  Future<void> _addFavoriteFromHome(
      AddFavoriteFromHome event, Emitter<HomeState> emit) async {
    if (state is TvShowsLoaded) {
      var result = await tvshowRepository.addFavorite(
        event.model,
        delete: event.delete,
      );

      if (result) {
        var newRecommended =
            (state as TvShowsLoaded).recommended.map<TvShowModel>((element) {
          if (element.id == event.model.id) {
            return TvShowModel(
              event.model.id,
              event.model.posterPath,
              event.model.name,
              event.model.voteAverage,
              event.model.numberOfEpisodes,
              event.model.numberOfSeasons,
              !event.delete,
            );
          } else {
            return element;
          }
        }).toList();

        var getFavRes = await tvshowRepository.getFavorites();

        List<TvShowModel> favoriteSeries = [];
        Failure? failure;
        getFavRes.fold((l) => failure = l, (r) => favoriteSeries = r);
        if (failure == null) {
          if (event.delete) {
            emit(
              TvShowsLoaded(List.from((state as TvShowsLoaded).popular),
                  newRecommended, favoriteSeries,
                  flag: !(state as TvShowsLoaded).flag),
            );
          } else {
            emit(TvShowsLoaded(List.from((state as TvShowsLoaded).popular),
                newRecommended, favoriteSeries,
                flag: !(state as TvShowsLoaded).flag));
          }
        } else {
          emit(TvShowsLoadFailed());
        }
      } else {
        emit(TvShowsLoadFailed());
      }
    }
  }
}
