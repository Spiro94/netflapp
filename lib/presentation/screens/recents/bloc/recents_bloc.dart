import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/tv_show_model.dart';
import '../../../../domain/respository/tv_show_respository.dart';

part 'recents_event.dart';
part 'recents_state.dart';

class RecentsBloc extends Bloc<RecentsEvent, RecentsState> {
  final TvShowRepository tvShowRepository;
  RecentsBloc(this.tvShowRepository) : super(RecentsInitial()) {
    on<RecentsEvent>((event, emit) async {
      if (event is LoadRecent) {
        await _loadRecent(emit);
      }
    });
  }

  Future<void> _loadRecent(Emitter<RecentsState> emit) async {
    emit(RecentsLoading());
    var result = await tvShowRepository.getRecents();
    result.fold(
        (l) => emit(RecentsLoadedFailed()), (r) => emit(RecentsLoaded(r)));
  }
}
