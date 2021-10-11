import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/domain/respository/tv_show_respository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TvShowRepository tvshowRepository;
  HomeBloc(this.tvshowRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadTvShows) {
        emit(TvShowsLoading());
        List<TvShowModel> popularSeries = [];
        List<TvShowModel> recommendedSeries = [];

        var popRes = await tvshowRepository.getPopular();
        popRes.fold((l) => emit(TvShowsLoadFailed()), (r) => popularSeries = r);

        var recoRes = await tvshowRepository.getRecommended();

        recoRes.fold(
            (l) => emit(TvShowsLoadFailed()), (r) => recommendedSeries = r);

        emit(TvShowsLoaded(popularSeries, recommendedSeries));
        // var favorite = tvshowRepository.getFavorite();
        //TODO: Implement logic for merging recommended with favorites.
      }
    });
  }
}
