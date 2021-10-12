import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/tv_show_model.dart';
import '../../../../domain/respository/tv_show_respository.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final TvShowRepository tvshowRepository;
  EpisodesBloc(this.tvshowRepository) : super(EpisodesInitial()) {
    on<EpisodesEvent>((event, emit) async {
      if (event is LoadEpisodes) {
        await _loadEpisodes(event, emit);
      }
    });
  }

  _loadEpisodes(LoadEpisodes event, Emitter<EpisodesState> emit) async {
    var result = await tvshowRepository.getSeasons(event.id);

    result.fold(
        (l) => emit(EpisodesLoadedFailed()), (r) => emit(EpisodesLoaded(r)));
  }
}
